#include <types.h>
#include <kern/errno.h>
#include <kern/unistd.h>
#include <kern/wait.h>
#include <lib.h>
#include <syscall.h>
#include <current.h>
#include <proc.h>
#include <thread.h>
#include <addrspace.h>
#include <copyinout.h>
#include <clock.h>
#include <mips/trapframe.h>
#include <spinlock.h>
#include <vfs.h>
#include <kern/fcntl.h>
#include <vm.h>
#include <copyinout.h>
#include <test.h>
#include "opt-A1.h"
#include "opt-A3.h"
  /* this implementation of sys__exit does not do anything with the exit code */
  /* this needs to be fixed to get exit() and waitpid() working properly */

#if OPT_A1

int sys_fork(pid_t *retval, struct trapframe *tf){
  // kprint("inside sys_fork\n");
  struct proc *child = proc_create_runprogram("child");
  struct addrspace *cur = curproc_getas();
  child->p_parent = curproc;
  array_add(curproc->p_children,(void *) child, NULL);
  int err;
  err = as_copy(cur, &(child->p_addrspace));
 // if(err != 0){
 //   return err;
 // }
  struct trapframe *tf_child;
  tf_child = kmalloc(sizeof(struct trapframe));
  memcpy(tf_child, tf, sizeof(struct trapframe));;
  *retval = child->p_pid;
  err = thread_fork("child_thread", child, (void *)enter_forked_process, (void*)tf_child, 0);
  //if(err != 0){
  //  return err;
  // }
  *retval = child->p_pid;
  clocksleep(1);
  return(0);
}
#endif


#if OPT_A3
char** args_alloc(){
  char** duffer = (char**)kmalloc(17*sizeof(char*));
  for(int i=0;i<17;i++){
    duffer[i] = (char*)kmalloc(129*sizeof(char));
  }
  duffer[16] = NULL;
  return duffer;
}
void args_free(char** duffer){
  for(int i=0;i<17;i++){
    kfree(duffer[i]);
  }
  kfree(duffer);
  return;
}
int argscopy_in(char** args, char** duffer){
  int i = 0; // NULL terminated args
  for(;args[i]!=NULL;i++){
    copyinstr((userptr_t)args[i], duffer[i], 128, NULL);
  }
  return i;
}
int sys_execv(char *progname, char **argsin){
  
  char** args = args_alloc();
  int nargs = argscopy_in(argsin, args);
  //rest of the code is the same
  
  struct addrspace *as;
	struct vnode *v;
	vaddr_t entrypoint, stackptr;
	int result;

	/* Open the file. */
	result = vfs_open(progname, O_RDONLY, 0, &v);
	if (result) {
		return result;
	}

	/* We should be a new process. */
	//KASSERT(curproc_getas() == NULL);


	/* Create a new address space. */
	as = as_create();
	if (as ==NULL) {
		vfs_close(v);
		return ENOMEM;
	}

	/* Switch to it and activate it. */
  struct addrspace* old = curproc_getas();
	curproc_setas(as);
	as_activate();
  as_destroy(old);

	/* Load the executable. */
	result = load_elf(v, &entrypoint);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		vfs_close(v);
		return result;
	}

	/* Done with the file now. */
	vfs_close(v);

	/* Define the user stack in the address space */
	result = as_define_stack(as, &stackptr);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		return result;
	}

	vaddr_t argv[(int)nargs+1];
	argv[0] = (int)NULL;
  for(int i=0;i<(int)nargs;i++){
		argv[(int)nargs-i] = argcopy_out((vaddr_t*)&stackptr, args[i]);
	}

	for(int i=0;i<(int)nargs+1;i++){
		stackptr -= 4;
		copyout(&argv[i], (userptr_t)stackptr, 4);
	}
  args_free(args);
	enter_new_process(nargs /*argc*/, (userptr_t)stackptr /*userspace addr of argv*/, stackptr, entrypoint);

	/* Warp to user mode. */
	//enter_new_process(0 /*argc*/, NULL /*userspace addr of argv*/,
			  //stackptr, entrypoint);
	
	/* enter_new_process does not return. */
	panic("enter_new_process returned\n");
	return EINVAL;
}
#endif

void sys__exit(int exitcode) {
 // kprintf("inside sys__exit\n");
  struct addrspace *as;
  struct proc *p = curproc;
  /* for now, just include this to keep the compiler from complaining about
     an unused variable */
  //(void)exitcode;

  DEBUG(DB_SYSCALL,"Syscall: _exit(%d)\n",exitcode);

  KASSERT(curproc->p_addrspace != NULL);
  as_deactivate();
  /*
   * clear p_addrspace before calling as_destroy. Otherwise if
   * as_destroy sleeps (which is quite possible) when we
   * come back we'll be calling as_activate on a
   * half-destroyed address space. This tends to be
   * messily fatal.
   */
  as = curproc_setas(NULL);
  as_destroy(as);
  #if OPT_A1
  //struct proc *temp_child;
  unsigned size = array_num(p->p_children);
  for(int i = size-1; i >= 0; i--){
       struct proc *temp_child = array_get(p->p_children, i);
       array_remove(p->p_children, i);
       spinlock_acquire(&temp_child->p_lock);
       KASSERT(temp_child!=NULL);
       if(temp_child->p_exitstatus == 0){
           spinlock_release(&temp_child->p_lock);
           proc_destroy(temp_child);
       }
       else{
           temp_child->p_parent = NULL;
           spinlock_release(&temp_child->p_lock);
       }
       //array_remove(p->p_children, i);
  }
  #endif
  /* detach this thread from its process */
  /* note: curproc cannot be used after this call */
  proc_remthread(curthread);

  /* if this is the last user process in the system, proc_destroy()
     will wake up the kernel menu thread */
  //  proc_destroy(p);
  #if OPT_A1
  spinlock_acquire(&(p->p_lock));
  if(p->p_parent == NULL){
    spinlock_release(&(p->p_lock));
    proc_destroy(p);
  }
  else{
    p->p_exitstatus = 0;
    p->p_exitcode = exitcode;
    spinlock_release(&p->p_lock);
  }
 #else 
  (void) exitcode;
  proc_destroy(p);
 #endif
  thread_exit();
  /* thread_exit() does not return, so we should never get here */
  panic("return from thread_exit in sys_exit\n");
}


/* stub handler for getpid() system call                */
int
sys_getpid(pid_t *retval)
{
  /* for now, this is just a stub that always returns a PID of 1 */
  /* you need to fix this to make it work properly */
  *retval = curproc->p_pid;
  return(0);
}

/* stub handler for waitpid() system call                */

int
sys_waitpid(pid_t pid,
	    userptr_t status,
	    int options,
	    pid_t *retval)
{
  int exitstatus;
  int result;

  /* this is just a stub implementation that always reports an
     exit status of 0, regardless of the actual exit status of
     the specified process.   
     In fact, this will return 0 even if the specified process
     is still running, and even if it never existed in the first place.

     Fix this!
  */

  if (options != 0) {
    return(EINVAL);
  }
  #if OPT_A1
  struct proc* temp_child = NULL;
  unsigned size = array_num(curproc->p_children);
  for(unsigned i =0; i < size; i++){
    struct proc * x = array_get(curproc->p_children, i);
    if(pid == (x->p_pid)){
      temp_child = array_get(curproc->p_children, i);
      array_remove(curproc->p_children, i);
      break;
    }
  }
  if(temp_child == NULL){
  *retval = -1;
  return (ESRCH);
  }
  spinlock_acquire(&temp_child->p_lock); 
  while (temp_child->p_exitstatus) {
    spinlock_release(&temp_child->p_lock); 
    clocksleep(1); 
    spinlock_acquire(&temp_child->p_lock);
  }
  spinlock_release(&temp_child->p_lock);
  exitstatus = temp_child->p_exitcode;
//  proc_destroy(temp_child);
  exitstatus = _MKWAIT_EXIT(exitstatus);
  proc_destroy(temp_child);
  #else
  exitstatus = 0;
  #endif

  /* for now, just pretend the exitstatus is 0 */
  //exitstatus = 0;
  result = copyout((void *)&exitstatus,status,sizeof(int));
  if (result) {
    return(result);
  }
  *retval = pid;
  return(0);
}

