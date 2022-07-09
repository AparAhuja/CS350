
../../../build/user/uw-testbin/widefork/widefork:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250014 	sw	a1,20(at)
  40001c:	0c100067 	jal	40019c <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c1000b5 	jal	4002d4 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1000cb 	jal	40032c <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <dowait>:
  400050:	27bdffd8 	addiu	sp,sp,-40
  400054:	afb00018 	sw	s0,24(sp)
  400058:	00808021 	move	s0,a0
  40005c:	24040047 	li	a0,71
  400060:	afbf0020 	sw	ra,32(sp)
  400064:	afb1001c 	sw	s1,28(sp)
  400068:	0c100094 	jal	400250 <putchar>
  40006c:	00a08821 	move	s1,a1
  400070:	02002021 	move	a0,s0
  400074:	27a50010 	addiu	a1,sp,16
  400078:	0c1000cd 	jal	400334 <waitpid>
  40007c:	00003021 	move	a2,zero
  400080:	3c040040 	lui	a0,0x40
  400084:	04400016 	bltz	v0,4000e0 <dowait+0x90>
  400088:	248419d0 	addiu	a0,a0,6608
  40008c:	8fa20010 	lw	v0,16(sp)
  400090:	00000000 	nop
  400094:	00021883 	sra	v1,v0,0x2
  400098:	30420003 	andi	v0,v0,0x3
  40009c:	1440000a 	bnez	v0,4000c8 <dowait+0x78>
  4000a0:	24040078 	li	a0,120
  4000a4:	10710008 	beq	v1,s1,4000c8 <dowait+0x78>
  4000a8:	24640060 	addiu	a0,v1,96
  4000ac:	0c100094 	jal	400250 <putchar>
  4000b0:	24040048 	li	a0,72
  4000b4:	8fbf0020 	lw	ra,32(sp)
  4000b8:	8fb1001c 	lw	s1,28(sp)
  4000bc:	8fb00018 	lw	s0,24(sp)
  4000c0:	03e00008 	jr	ra
  4000c4:	27bd0028 	addiu	sp,sp,40
  4000c8:	0c100094 	jal	400250 <putchar>
  4000cc:	00000000 	nop
  4000d0:	0c100094 	jal	400250 <putchar>
  4000d4:	2404000a 	li	a0,10
  4000d8:	0810002b 	j	4000ac <dowait+0x5c>
  4000dc:	00000000 	nop
  4000e0:	0c1001e2 	jal	400788 <warnx>
  4000e4:	00000000 	nop
  4000e8:	8fbf0020 	lw	ra,32(sp)
  4000ec:	8fb1001c 	lw	s1,28(sp)
  4000f0:	8fb00018 	lw	s0,24(sp)
  4000f4:	03e00008 	jr	ra
  4000f8:	27bd0028 	addiu	sp,sp,40

004000fc <dofork>:
  4000fc:	27bdffe0 	addiu	sp,sp,-32
  400100:	afb10014 	sw	s1,20(sp)
  400104:	00808821 	move	s1,a0
  400108:	24040045 	li	a0,69
  40010c:	afbf0018 	sw	ra,24(sp)
  400110:	0c100094 	jal	400250 <putchar>
  400114:	afb00010 	sw	s0,16(sp)
  400118:	0c1000c5 	jal	400314 <fork>
  40011c:	00000000 	nop
  400120:	0440000b 	bltz	v0,400150 <dofork+0x54>
  400124:	00408021 	move	s0,v0
  400128:	10400016 	beqz	v0,400184 <dofork+0x88>
  40012c:	00000000 	nop
  400130:	0c100094 	jal	400250 <putchar>
  400134:	24040046 	li	a0,70
  400138:	02001021 	move	v0,s0
  40013c:	8fbf0018 	lw	ra,24(sp)
  400140:	8fb10014 	lw	s1,20(sp)
  400144:	8fb00010 	lw	s0,16(sp)
  400148:	03e00008 	jr	ra
  40014c:	27bd0020 	addiu	sp,sp,32
  400150:	3c050040 	lui	a1,0x40
  400154:	02203021 	move	a2,s1
  400158:	24a519dc 	addiu	a1,a1,6620
  40015c:	0c1001be 	jal	4006f8 <errx>
  400160:	24040001 	li	a0,1
  400164:	0c100094 	jal	400250 <putchar>
  400168:	24040046 	li	a0,70
  40016c:	02001021 	move	v0,s0
  400170:	8fbf0018 	lw	ra,24(sp)
  400174:	8fb10014 	lw	s1,20(sp)
  400178:	8fb00010 	lw	s0,16(sp)
  40017c:	03e00008 	jr	ra
  400180:	27bd0020 	addiu	sp,sp,32
  400184:	0c100094 	jal	400250 <putchar>
  400188:	26240040 	addiu	a0,s1,64
  40018c:	0c100094 	jal	400250 <putchar>
  400190:	2404000a 	li	a0,10
  400194:	0c1000cb 	jal	40032c <_exit>
  400198:	02202021 	move	a0,s1

0040019c <main>:
  40019c:	27bdffe0 	addiu	sp,sp,-32
  4001a0:	24040050 	li	a0,80
  4001a4:	afbf001c 	sw	ra,28(sp)
  4001a8:	afb20018 	sw	s2,24(sp)
  4001ac:	afb10014 	sw	s1,20(sp)
  4001b0:	0c100094 	jal	400250 <putchar>
  4001b4:	afb00010 	sw	s0,16(sp)
  4001b8:	0c100094 	jal	400250 <putchar>
  4001bc:	2404000a 	li	a0,10
  4001c0:	0c10003f 	jal	4000fc <dofork>
  4001c4:	24040001 	li	a0,1
  4001c8:	24040050 	li	a0,80
  4001cc:	0c100094 	jal	400250 <putchar>
  4001d0:	00409021 	move	s2,v0
  4001d4:	0c100094 	jal	400250 <putchar>
  4001d8:	2404000a 	li	a0,10
  4001dc:	0c10003f 	jal	4000fc <dofork>
  4001e0:	24040002 	li	a0,2
  4001e4:	24040050 	li	a0,80
  4001e8:	0c100094 	jal	400250 <putchar>
  4001ec:	00408821 	move	s1,v0
  4001f0:	0c100094 	jal	400250 <putchar>
  4001f4:	2404000a 	li	a0,10
  4001f8:	0c10003f 	jal	4000fc <dofork>
  4001fc:	24040003 	li	a0,3
  400200:	02402021 	move	a0,s2
  400204:	24050001 	li	a1,1
  400208:	0c100014 	jal	400050 <dowait>
  40020c:	00408021 	move	s0,v0
  400210:	02202021 	move	a0,s1
  400214:	0c100014 	jal	400050 <dowait>
  400218:	24050002 	li	a1,2
  40021c:	02002021 	move	a0,s0
  400220:	0c100014 	jal	400050 <dowait>
  400224:	24050003 	li	a1,3
  400228:	8fbf001c 	lw	ra,28(sp)
  40022c:	8fb20018 	lw	s2,24(sp)
  400230:	8fb10014 	lw	s1,20(sp)
  400234:	8fb00010 	lw	s0,16(sp)
  400238:	00001021 	move	v0,zero
  40023c:	03e00008 	jr	ra
  400240:	27bd0020 	addiu	sp,sp,32
	...

00400250 <putchar>:
  400250:	27bdffe0 	addiu	sp,sp,-32
  400254:	afb00018 	sw	s0,24(sp)
  400258:	27a50010 	addiu	a1,sp,16
  40025c:	00808021 	move	s0,a0
  400260:	24060001 	li	a2,1
  400264:	24040001 	li	a0,1
  400268:	afbf001c 	sw	ra,28(sp)
  40026c:	0c10010b 	jal	40042c <write>
  400270:	a3b00010 	sb	s0,16(sp)
  400274:	18400005 	blez	v0,40028c <putchar+0x3c>
  400278:	02001021 	move	v0,s0
  40027c:	8fbf001c 	lw	ra,28(sp)
  400280:	8fb00018 	lw	s0,24(sp)
  400284:	03e00008 	jr	ra
  400288:	27bd0020 	addiu	sp,sp,32
  40028c:	2410ffff 	li	s0,-1
  400290:	02001021 	move	v0,s0
  400294:	8fbf001c 	lw	ra,28(sp)
  400298:	8fb00018 	lw	s0,24(sp)
  40029c:	03e00008 	jr	ra
  4002a0:	27bd0020 	addiu	sp,sp,32
	...

004002b0 <__exit_hack>:
  4002b0:	27bdfff8 	addiu	sp,sp,-8
  4002b4:	24020001 	li	v0,1
  4002b8:	afa20000 	sw	v0,0(sp)
  4002bc:	8fa20000 	lw	v0,0(sp)
  4002c0:	00000000 	nop
  4002c4:	1440fffd 	bnez	v0,4002bc <__exit_hack+0xc>
  4002c8:	00000000 	nop
  4002cc:	03e00008 	jr	ra
  4002d0:	27bd0008 	addiu	sp,sp,8

004002d4 <exit>:
  4002d4:	27bdffe8 	addiu	sp,sp,-24
  4002d8:	afbf0010 	sw	ra,16(sp)
  4002dc:	0c1000cb 	jal	40032c <_exit>
  4002e0:	00000000 	nop
	...

004002f0 <__syscall>:
  4002f0:	0000000c 	syscall
  4002f4:	10e00005 	beqz	a3,40030c <__syscall+0x1c>
  4002f8:	00000000 	nop
  4002fc:	3c011000 	lui	at,0x1000
  400300:	ac220010 	sw	v0,16(at)
  400304:	2403ffff 	li	v1,-1
  400308:	2402ffff 	li	v0,-1
  40030c:	03e00008 	jr	ra
  400310:	00000000 	nop

00400314 <fork>:
  400314:	081000bc 	j	4002f0 <__syscall>
  400318:	24020000 	li	v0,0

0040031c <vfork>:
  40031c:	081000bc 	j	4002f0 <__syscall>
  400320:	24020001 	li	v0,1

00400324 <execv>:
  400324:	081000bc 	j	4002f0 <__syscall>
  400328:	24020002 	li	v0,2

0040032c <_exit>:
  40032c:	081000bc 	j	4002f0 <__syscall>
  400330:	24020003 	li	v0,3

00400334 <waitpid>:
  400334:	081000bc 	j	4002f0 <__syscall>
  400338:	24020004 	li	v0,4

0040033c <getpid>:
  40033c:	081000bc 	j	4002f0 <__syscall>
  400340:	24020005 	li	v0,5

00400344 <getppid>:
  400344:	081000bc 	j	4002f0 <__syscall>
  400348:	24020006 	li	v0,6

0040034c <sbrk>:
  40034c:	081000bc 	j	4002f0 <__syscall>
  400350:	24020007 	li	v0,7

00400354 <mmap>:
  400354:	081000bc 	j	4002f0 <__syscall>
  400358:	24020008 	li	v0,8

0040035c <munmap>:
  40035c:	081000bc 	j	4002f0 <__syscall>
  400360:	24020009 	li	v0,9

00400364 <mprotect>:
  400364:	081000bc 	j	4002f0 <__syscall>
  400368:	2402000a 	li	v0,10

0040036c <umask>:
  40036c:	081000bc 	j	4002f0 <__syscall>
  400370:	24020011 	li	v0,17

00400374 <issetugid>:
  400374:	081000bc 	j	4002f0 <__syscall>
  400378:	24020012 	li	v0,18

0040037c <getresuid>:
  40037c:	081000bc 	j	4002f0 <__syscall>
  400380:	24020013 	li	v0,19

00400384 <setresuid>:
  400384:	081000bc 	j	4002f0 <__syscall>
  400388:	24020014 	li	v0,20

0040038c <getresgid>:
  40038c:	081000bc 	j	4002f0 <__syscall>
  400390:	24020015 	li	v0,21

00400394 <setresgid>:
  400394:	081000bc 	j	4002f0 <__syscall>
  400398:	24020016 	li	v0,22

0040039c <getgroups>:
  40039c:	081000bc 	j	4002f0 <__syscall>
  4003a0:	24020017 	li	v0,23

004003a4 <setgroups>:
  4003a4:	081000bc 	j	4002f0 <__syscall>
  4003a8:	24020018 	li	v0,24

004003ac <__getlogin>:
  4003ac:	081000bc 	j	4002f0 <__syscall>
  4003b0:	24020019 	li	v0,25

004003b4 <__setlogin>:
  4003b4:	081000bc 	j	4002f0 <__syscall>
  4003b8:	2402001a 	li	v0,26

004003bc <kill>:
  4003bc:	081000bc 	j	4002f0 <__syscall>
  4003c0:	2402001b 	li	v0,27

004003c4 <sigaction>:
  4003c4:	081000bc 	j	4002f0 <__syscall>
  4003c8:	2402001c 	li	v0,28

004003cc <sigpending>:
  4003cc:	081000bc 	j	4002f0 <__syscall>
  4003d0:	2402001d 	li	v0,29

004003d4 <sigprocmask>:
  4003d4:	081000bc 	j	4002f0 <__syscall>
  4003d8:	2402001e 	li	v0,30

004003dc <sigsuspend>:
  4003dc:	081000bc 	j	4002f0 <__syscall>
  4003e0:	2402001f 	li	v0,31

004003e4 <sigreturn>:
  4003e4:	081000bc 	j	4002f0 <__syscall>
  4003e8:	24020020 	li	v0,32

004003ec <open>:
  4003ec:	081000bc 	j	4002f0 <__syscall>
  4003f0:	2402002d 	li	v0,45

004003f4 <pipe>:
  4003f4:	081000bc 	j	4002f0 <__syscall>
  4003f8:	2402002e 	li	v0,46

004003fc <dup>:
  4003fc:	081000bc 	j	4002f0 <__syscall>
  400400:	2402002f 	li	v0,47

00400404 <dup2>:
  400404:	081000bc 	j	4002f0 <__syscall>
  400408:	24020030 	li	v0,48

0040040c <close>:
  40040c:	081000bc 	j	4002f0 <__syscall>
  400410:	24020031 	li	v0,49

00400414 <read>:
  400414:	081000bc 	j	4002f0 <__syscall>
  400418:	24020032 	li	v0,50

0040041c <pread>:
  40041c:	081000bc 	j	4002f0 <__syscall>
  400420:	24020033 	li	v0,51

00400424 <getdirentry>:
  400424:	081000bc 	j	4002f0 <__syscall>
  400428:	24020036 	li	v0,54

0040042c <write>:
  40042c:	081000bc 	j	4002f0 <__syscall>
  400430:	24020037 	li	v0,55

00400434 <pwrite>:
  400434:	081000bc 	j	4002f0 <__syscall>
  400438:	24020038 	li	v0,56

0040043c <lseek>:
  40043c:	081000bc 	j	4002f0 <__syscall>
  400440:	2402003b 	li	v0,59

00400444 <flock>:
  400444:	081000bc 	j	4002f0 <__syscall>
  400448:	2402003c 	li	v0,60

0040044c <ftruncate>:
  40044c:	081000bc 	j	4002f0 <__syscall>
  400450:	2402003d 	li	v0,61

00400454 <fsync>:
  400454:	081000bc 	j	4002f0 <__syscall>
  400458:	2402003e 	li	v0,62

0040045c <fcntl>:
  40045c:	081000bc 	j	4002f0 <__syscall>
  400460:	2402003f 	li	v0,63

00400464 <ioctl>:
  400464:	081000bc 	j	4002f0 <__syscall>
  400468:	24020040 	li	v0,64

0040046c <select>:
  40046c:	081000bc 	j	4002f0 <__syscall>
  400470:	24020041 	li	v0,65

00400474 <poll>:
  400474:	081000bc 	j	4002f0 <__syscall>
  400478:	24020042 	li	v0,66

0040047c <link>:
  40047c:	081000bc 	j	4002f0 <__syscall>
  400480:	24020043 	li	v0,67

00400484 <remove>:
  400484:	081000bc 	j	4002f0 <__syscall>
  400488:	24020044 	li	v0,68

0040048c <mkdir>:
  40048c:	081000bc 	j	4002f0 <__syscall>
  400490:	24020045 	li	v0,69

00400494 <rmdir>:
  400494:	081000bc 	j	4002f0 <__syscall>
  400498:	24020046 	li	v0,70

0040049c <mkfifo>:
  40049c:	081000bc 	j	4002f0 <__syscall>
  4004a0:	24020047 	li	v0,71

004004a4 <rename>:
  4004a4:	081000bc 	j	4002f0 <__syscall>
  4004a8:	24020048 	li	v0,72

004004ac <access>:
  4004ac:	081000bc 	j	4002f0 <__syscall>
  4004b0:	24020049 	li	v0,73

004004b4 <chdir>:
  4004b4:	081000bc 	j	4002f0 <__syscall>
  4004b8:	2402004a 	li	v0,74

004004bc <fchdir>:
  4004bc:	081000bc 	j	4002f0 <__syscall>
  4004c0:	2402004b 	li	v0,75

004004c4 <__getcwd>:
  4004c4:	081000bc 	j	4002f0 <__syscall>
  4004c8:	2402004c 	li	v0,76

004004cc <symlink>:
  4004cc:	081000bc 	j	4002f0 <__syscall>
  4004d0:	2402004d 	li	v0,77

004004d4 <readlink>:
  4004d4:	081000bc 	j	4002f0 <__syscall>
  4004d8:	2402004e 	li	v0,78

004004dc <mount>:
  4004dc:	081000bc 	j	4002f0 <__syscall>
  4004e0:	2402004f 	li	v0,79

004004e4 <unmount>:
  4004e4:	081000bc 	j	4002f0 <__syscall>
  4004e8:	24020050 	li	v0,80

004004ec <stat>:
  4004ec:	081000bc 	j	4002f0 <__syscall>
  4004f0:	24020051 	li	v0,81

004004f4 <fstat>:
  4004f4:	081000bc 	j	4002f0 <__syscall>
  4004f8:	24020052 	li	v0,82

004004fc <lstat>:
  4004fc:	081000bc 	j	4002f0 <__syscall>
  400500:	24020053 	li	v0,83

00400504 <utimes>:
  400504:	081000bc 	j	4002f0 <__syscall>
  400508:	24020054 	li	v0,84

0040050c <futimes>:
  40050c:	081000bc 	j	4002f0 <__syscall>
  400510:	24020055 	li	v0,85

00400514 <lutimes>:
  400514:	081000bc 	j	4002f0 <__syscall>
  400518:	24020056 	li	v0,86

0040051c <chmod>:
  40051c:	081000bc 	j	4002f0 <__syscall>
  400520:	24020057 	li	v0,87

00400524 <chown>:
  400524:	081000bc 	j	4002f0 <__syscall>
  400528:	24020058 	li	v0,88

0040052c <fchmod>:
  40052c:	081000bc 	j	4002f0 <__syscall>
  400530:	24020059 	li	v0,89

00400534 <fchown>:
  400534:	081000bc 	j	4002f0 <__syscall>
  400538:	2402005a 	li	v0,90

0040053c <lchmod>:
  40053c:	081000bc 	j	4002f0 <__syscall>
  400540:	2402005b 	li	v0,91

00400544 <lchown>:
  400544:	081000bc 	j	4002f0 <__syscall>
  400548:	2402005c 	li	v0,92

0040054c <socket>:
  40054c:	081000bc 	j	4002f0 <__syscall>
  400550:	24020062 	li	v0,98

00400554 <bind>:
  400554:	081000bc 	j	4002f0 <__syscall>
  400558:	24020063 	li	v0,99

0040055c <connect>:
  40055c:	081000bc 	j	4002f0 <__syscall>
  400560:	24020064 	li	v0,100

00400564 <listen>:
  400564:	081000bc 	j	4002f0 <__syscall>
  400568:	24020065 	li	v0,101

0040056c <accept>:
  40056c:	081000bc 	j	4002f0 <__syscall>
  400570:	24020066 	li	v0,102

00400574 <shutdown>:
  400574:	081000bc 	j	4002f0 <__syscall>
  400578:	24020068 	li	v0,104

0040057c <getsockname>:
  40057c:	081000bc 	j	4002f0 <__syscall>
  400580:	24020069 	li	v0,105

00400584 <getpeername>:
  400584:	081000bc 	j	4002f0 <__syscall>
  400588:	2402006a 	li	v0,106

0040058c <getsockopt>:
  40058c:	081000bc 	j	4002f0 <__syscall>
  400590:	2402006b 	li	v0,107

00400594 <setsockopt>:
  400594:	081000bc 	j	4002f0 <__syscall>
  400598:	2402006c 	li	v0,108

0040059c <__time>:
  40059c:	081000bc 	j	4002f0 <__syscall>
  4005a0:	24020071 	li	v0,113

004005a4 <__settime>:
  4005a4:	081000bc 	j	4002f0 <__syscall>
  4005a8:	24020072 	li	v0,114

004005ac <nanosleep>:
  4005ac:	081000bc 	j	4002f0 <__syscall>
  4005b0:	24020073 	li	v0,115

004005b4 <sync>:
  4005b4:	081000bc 	j	4002f0 <__syscall>
  4005b8:	24020076 	li	v0,118

004005bc <reboot>:
  4005bc:	081000bc 	j	4002f0 <__syscall>
  4005c0:	24020077 	li	v0,119
	...

004005d0 <__senderr>:
  4005d0:	0810010b 	j	40042c <write>
  4005d4:	24040002 	li	a0,2

004005d8 <__senderrstr>:
  4005d8:	27bdffe8 	addiu	sp,sp,-24
  4005dc:	afbf0014 	sw	ra,20(sp)
  4005e0:	afb00010 	sw	s0,16(sp)
  4005e4:	0c10042c 	jal	4010b0 <strlen>
  4005e8:	00808021 	move	s0,a0
  4005ec:	00403021 	move	a2,v0
  4005f0:	02002821 	move	a1,s0
  4005f4:	8fbf0014 	lw	ra,20(sp)
  4005f8:	8fb00010 	lw	s0,16(sp)
  4005fc:	00002021 	move	a0,zero
  400600:	08100174 	j	4005d0 <__senderr>
  400604:	27bd0018 	addiu	sp,sp,24

00400608 <__printerr>:
  400608:	27bdffd8 	addiu	sp,sp,-40
  40060c:	afb40020 	sw	s4,32(sp)
  400610:	afb3001c 	sw	s3,28(sp)
  400614:	afb20018 	sw	s2,24(sp)
  400618:	afb10014 	sw	s1,20(sp)
  40061c:	afbf0024 	sw	ra,36(sp)
  400620:	afb00010 	sw	s0,16(sp)
  400624:	3c021000 	lui	v0,0x1000
  400628:	00809821 	move	s3,a0
  40062c:	8c440010 	lw	a0,16(v0)
  400630:	00a08821 	move	s1,a1
  400634:	0c100420 	jal	401080 <strerror>
  400638:	00c09021 	move	s2,a2
  40063c:	0040a021 	move	s4,v0
  400640:	3c021000 	lui	v0,0x1000
  400644:	8c420014 	lw	v0,20(v0)
  400648:	00000000 	nop
  40064c:	1040001f 	beqz	v0,4006cc <__printerr+0xc4>
  400650:	00000000 	nop
  400654:	8c420000 	lw	v0,0(v0)
  400658:	00000000 	nop
  40065c:	1040001b 	beqz	v0,4006cc <__printerr+0xc4>
  400660:	00402021 	move	a0,v0
  400664:	0c100176 	jal	4005d8 <__senderrstr>
  400668:	3c100040 	lui	s0,0x40
  40066c:	0c100176 	jal	4005d8 <__senderrstr>
  400670:	260419fc 	addiu	a0,s0,6652
  400674:	3c040040 	lui	a0,0x40
  400678:	248405d0 	addiu	a0,a0,1488
  40067c:	02203021 	move	a2,s1
  400680:	02403821 	move	a3,s2
  400684:	0c1002bd 	jal	400af4 <__vprintf>
  400688:	00002821 	move	a1,zero
  40068c:	12600005 	beqz	s3,4006a4 <__printerr+0x9c>
  400690:	260419fc 	addiu	a0,s0,6652
  400694:	0c100176 	jal	4005d8 <__senderrstr>
  400698:	00000000 	nop
  40069c:	0c100176 	jal	4005d8 <__senderrstr>
  4006a0:	02802021 	move	a0,s4
  4006a4:	3c040040 	lui	a0,0x40
  4006a8:	8fbf0024 	lw	ra,36(sp)
  4006ac:	8fb40020 	lw	s4,32(sp)
  4006b0:	8fb3001c 	lw	s3,28(sp)
  4006b4:	8fb20018 	lw	s2,24(sp)
  4006b8:	8fb10014 	lw	s1,20(sp)
  4006bc:	8fb00010 	lw	s0,16(sp)
  4006c0:	24841a00 	addiu	a0,a0,6656
  4006c4:	08100176 	j	4005d8 <__senderrstr>
  4006c8:	27bd0028 	addiu	sp,sp,40
  4006cc:	3c020040 	lui	v0,0x40
  4006d0:	08100199 	j	400664 <__printerr+0x5c>
  4006d4:	244419e4 	addiu	a0,v0,6628

004006d8 <verrx>:
  4006d8:	27bdffe8 	addiu	sp,sp,-24
  4006dc:	afb00010 	sw	s0,16(sp)
  4006e0:	00808021 	move	s0,a0
  4006e4:	afbf0014 	sw	ra,20(sp)
  4006e8:	0c100182 	jal	400608 <__printerr>
  4006ec:	00002021 	move	a0,zero
  4006f0:	0c1000b5 	jal	4002d4 <exit>
  4006f4:	02002021 	move	a0,s0

004006f8 <errx>:
  4006f8:	27bdffe0 	addiu	sp,sp,-32
  4006fc:	27a20028 	addiu	v0,sp,40
  400700:	afa60028 	sw	a2,40(sp)
  400704:	00403021 	move	a2,v0
  400708:	afbf0018 	sw	ra,24(sp)
  40070c:	afa7002c 	sw	a3,44(sp)
  400710:	0c1001b6 	jal	4006d8 <verrx>
  400714:	afa20010 	sw	v0,16(sp)
  400718:	8fbf0018 	lw	ra,24(sp)
  40071c:	00000000 	nop
  400720:	03e00008 	jr	ra
  400724:	27bd0020 	addiu	sp,sp,32

00400728 <verr>:
  400728:	27bdffe8 	addiu	sp,sp,-24
  40072c:	afb00010 	sw	s0,16(sp)
  400730:	00808021 	move	s0,a0
  400734:	afbf0014 	sw	ra,20(sp)
  400738:	0c100182 	jal	400608 <__printerr>
  40073c:	24040001 	li	a0,1
  400740:	0c1000b5 	jal	4002d4 <exit>
  400744:	02002021 	move	a0,s0

00400748 <err>:
  400748:	27bdffe0 	addiu	sp,sp,-32
  40074c:	27a20028 	addiu	v0,sp,40
  400750:	afa60028 	sw	a2,40(sp)
  400754:	00403021 	move	a2,v0
  400758:	afbf0018 	sw	ra,24(sp)
  40075c:	afa7002c 	sw	a3,44(sp)
  400760:	0c1001ca 	jal	400728 <verr>
  400764:	afa20010 	sw	v0,16(sp)
  400768:	8fbf0018 	lw	ra,24(sp)
  40076c:	00000000 	nop
  400770:	03e00008 	jr	ra
  400774:	27bd0020 	addiu	sp,sp,32

00400778 <vwarnx>:
  400778:	00a03021 	move	a2,a1
  40077c:	00802821 	move	a1,a0
  400780:	08100182 	j	400608 <__printerr>
  400784:	00002021 	move	a0,zero

00400788 <warnx>:
  400788:	27bdffe0 	addiu	sp,sp,-32
  40078c:	27a20024 	addiu	v0,sp,36
  400790:	afa50024 	sw	a1,36(sp)
  400794:	00402821 	move	a1,v0
  400798:	afbf0018 	sw	ra,24(sp)
  40079c:	afa60028 	sw	a2,40(sp)
  4007a0:	afa7002c 	sw	a3,44(sp)
  4007a4:	0c1001de 	jal	400778 <vwarnx>
  4007a8:	afa20010 	sw	v0,16(sp)
  4007ac:	8fbf0018 	lw	ra,24(sp)
  4007b0:	00000000 	nop
  4007b4:	03e00008 	jr	ra
  4007b8:	27bd0020 	addiu	sp,sp,32

004007bc <vwarn>:
  4007bc:	00a03021 	move	a2,a1
  4007c0:	00802821 	move	a1,a0
  4007c4:	08100182 	j	400608 <__printerr>
  4007c8:	24040001 	li	a0,1

004007cc <warn>:
  4007cc:	27bdffe0 	addiu	sp,sp,-32
  4007d0:	27a20024 	addiu	v0,sp,36
  4007d4:	afa50024 	sw	a1,36(sp)
  4007d8:	00402821 	move	a1,v0
  4007dc:	afbf0018 	sw	ra,24(sp)
  4007e0:	afa60028 	sw	a2,40(sp)
  4007e4:	afa7002c 	sw	a3,44(sp)
  4007e8:	0c1001ef 	jal	4007bc <vwarn>
  4007ec:	afa20010 	sw	v0,16(sp)
  4007f0:	8fbf0018 	lw	ra,24(sp)
  4007f4:	00000000 	nop
  4007f8:	03e00008 	jr	ra
  4007fc:	27bd0020 	addiu	sp,sp,32

00400800 <__pf_print>:
  400800:	27bdffe0 	addiu	sp,sp,-32
  400804:	afbf0018 	sw	ra,24(sp)
  400808:	afb10014 	sw	s1,20(sp)
  40080c:	afb00010 	sw	s0,16(sp)
  400810:	8c830000 	lw	v1,0(a0)
  400814:	00808021 	move	s0,a0
  400818:	8c840004 	lw	a0,4(a0)
  40081c:	0060f809 	jalr	v1
  400820:	00c08821 	move	s1,a2
  400824:	8e02000c 	lw	v0,12(s0)
  400828:	00000000 	nop
  40082c:	00511021 	addu	v0,v0,s1
  400830:	ae02000c 	sw	v0,12(s0)
  400834:	8fbf0018 	lw	ra,24(sp)
  400838:	8fb10014 	lw	s1,20(sp)
  40083c:	8fb00010 	lw	s0,16(sp)
  400840:	03e00008 	jr	ra
  400844:	27bd0020 	addiu	sp,sp,32

00400848 <__pf_endfield>:
  400848:	24020020 	li	v0,32
  40084c:	ac82002c 	sw	v0,44(a0)
  400850:	00001821 	move	v1,zero
  400854:	00001021 	move	v0,zero
  400858:	ac800038 	sw	zero,56(a0)
  40085c:	ac800010 	sw	zero,16(a0)
  400860:	ac800014 	sw	zero,20(a0)
  400864:	ac83001c 	sw	v1,28(a0)
  400868:	ac820018 	sw	v0,24(a0)
  40086c:	ac800020 	sw	zero,32(a0)
  400870:	ac800024 	sw	zero,36(a0)
  400874:	ac800028 	sw	zero,40(a0)
  400878:	ac800030 	sw	zero,48(a0)
  40087c:	03e00008 	jr	ra
  400880:	ac800034 	sw	zero,52(a0)

00400884 <__pf_fill>:
  400884:	27bdffd0 	addiu	sp,sp,-48
  400888:	afb30024 	sw	s3,36(sp)
  40088c:	afb20020 	sw	s2,32(sp)
  400890:	afbf0028 	sw	ra,40(sp)
  400894:	afb1001c 	sw	s1,28(sp)
  400898:	afb00018 	sw	s0,24(sp)
  40089c:	00809821 	move	s3,a0
  4008a0:	8c82002c 	lw	v0,44(a0)
  4008a4:	18a0000b 	blez	a1,4008d4 <__pf_fill+0x50>
  4008a8:	00a09021 	move	s2,a1
  4008ac:	a3a20010 	sb	v0,16(sp)
  4008b0:	00008021 	move	s0,zero
  4008b4:	27b10010 	addiu	s1,sp,16
  4008b8:	26100001 	addiu	s0,s0,1
  4008bc:	02602021 	move	a0,s3
  4008c0:	02202821 	move	a1,s1
  4008c4:	0c100200 	jal	400800 <__pf_print>
  4008c8:	24060001 	li	a2,1
  4008cc:	1650fffb 	bne	s2,s0,4008bc <__pf_fill+0x38>
  4008d0:	26100001 	addiu	s0,s0,1
  4008d4:	8fbf0028 	lw	ra,40(sp)
  4008d8:	8fb30024 	lw	s3,36(sp)
  4008dc:	8fb20020 	lw	s2,32(sp)
  4008e0:	8fb1001c 	lw	s1,28(sp)
  4008e4:	8fb00018 	lw	s0,24(sp)
  4008e8:	03e00008 	jr	ra
  4008ec:	27bd0030 	addiu	sp,sp,48

004008f0 <__pf_printstuff>:
  4008f0:	27bdffd0 	addiu	sp,sp,-48
  4008f4:	afbf0028 	sw	ra,40(sp)
  4008f8:	afb50024 	sw	s5,36(sp)
  4008fc:	afb40020 	sw	s4,32(sp)
  400900:	afb3001c 	sw	s3,28(sp)
  400904:	afb20018 	sw	s2,24(sp)
  400908:	00c09821 	move	s3,a2
  40090c:	afb10014 	sw	s1,20(sp)
  400910:	afb00010 	sw	s0,16(sp)
  400914:	00808821 	move	s1,a0
  400918:	00a02021 	move	a0,a1
  40091c:	00a0a021 	move	s4,a1
  400920:	0c10042c 	jal	4010b0 <strlen>
  400924:	00e0a821 	move	s5,a3
  400928:	02602021 	move	a0,s3
  40092c:	0c10042c 	jal	4010b0 <strlen>
  400930:	00409021 	move	s2,v0
  400934:	02a02021 	move	a0,s5
  400938:	0c10042c 	jal	4010b0 <strlen>
  40093c:	02428021 	addu	s0,s2,v0
  400940:	8e230024 	lw	v1,36(s1)
  400944:	02022821 	addu	a1,s0,v0
  400948:	00a3102a 	slt	v0,a1,v1
  40094c:	10400040 	beqz	v0,400a50 <__pf_printstuff+0x160>
  400950:	00658023 	subu	s0,v1,a1
  400954:	1a000056 	blez	s0,400ab0 <__pf_printstuff+0x1c0>
  400958:	02403021 	move	a2,s2
  40095c:	8e220028 	lw	v0,40(s1)
  400960:	00000000 	nop
  400964:	10400028 	beqz	v0,400a08 <__pf_printstuff+0x118>
  400968:	24020030 	li	v0,48
  40096c:	0c10042c 	jal	4010b0 <strlen>
  400970:	02802021 	move	a0,s4
  400974:	00403021 	move	a2,v0
  400978:	02802821 	move	a1,s4
  40097c:	0c100200 	jal	400800 <__pf_print>
  400980:	02202021 	move	a0,s1
  400984:	0c10042c 	jal	4010b0 <strlen>
  400988:	02602021 	move	a0,s3
  40098c:	00403021 	move	a2,v0
  400990:	02202021 	move	a0,s1
  400994:	0c100200 	jal	400800 <__pf_print>
  400998:	02602821 	move	a1,s3
  40099c:	8e220028 	lw	v0,40(s1)
  4009a0:	00000000 	nop
  4009a4:	14400005 	bnez	v0,4009bc <__pf_printstuff+0xcc>
  4009a8:	24020030 	li	v0,48
  4009ac:	8e23002c 	lw	v1,44(s1)
  4009b0:	00000000 	nop
  4009b4:	1062004b 	beq	v1,v0,400ae4 <__pf_printstuff+0x1f4>
  4009b8:	02202021 	move	a0,s1
  4009bc:	0c10042c 	jal	4010b0 <strlen>
  4009c0:	02a02021 	move	a0,s5
  4009c4:	00403021 	move	a2,v0
  4009c8:	02202021 	move	a0,s1
  4009cc:	0c100200 	jal	400800 <__pf_print>
  4009d0:	02a02821 	move	a1,s5
  4009d4:	8e220028 	lw	v0,40(s1)
  4009d8:	00000000 	nop
  4009dc:	14400012 	bnez	v0,400a28 <__pf_printstuff+0x138>
  4009e0:	02202021 	move	a0,s1
  4009e4:	8fbf0028 	lw	ra,40(sp)
  4009e8:	8fb50024 	lw	s5,36(sp)
  4009ec:	8fb40020 	lw	s4,32(sp)
  4009f0:	8fb3001c 	lw	s3,28(sp)
  4009f4:	8fb20018 	lw	s2,24(sp)
  4009f8:	8fb10014 	lw	s1,20(sp)
  4009fc:	8fb00010 	lw	s0,16(sp)
  400a00:	03e00008 	jr	ra
  400a04:	27bd0030 	addiu	sp,sp,48
  400a08:	8e23002c 	lw	v1,44(s1)
  400a0c:	00000000 	nop
  400a10:	1062ffd6 	beq	v1,v0,40096c <__pf_printstuff+0x7c>
  400a14:	02202021 	move	a0,s1
  400a18:	0c100221 	jal	400884 <__pf_fill>
  400a1c:	02002821 	move	a1,s0
  400a20:	0810025b 	j	40096c <__pf_printstuff+0x7c>
  400a24:	00000000 	nop
  400a28:	02002821 	move	a1,s0
  400a2c:	8fbf0028 	lw	ra,40(sp)
  400a30:	8fb50024 	lw	s5,36(sp)
  400a34:	8fb40020 	lw	s4,32(sp)
  400a38:	8fb3001c 	lw	s3,28(sp)
  400a3c:	8fb20018 	lw	s2,24(sp)
  400a40:	8fb10014 	lw	s1,20(sp)
  400a44:	8fb00010 	lw	s0,16(sp)
  400a48:	08100221 	j	400884 <__pf_fill>
  400a4c:	27bd0030 	addiu	sp,sp,48
  400a50:	02802821 	move	a1,s4
  400a54:	02403021 	move	a2,s2
  400a58:	0c100200 	jal	400800 <__pf_print>
  400a5c:	02202021 	move	a0,s1
  400a60:	0c10042c 	jal	4010b0 <strlen>
  400a64:	02602021 	move	a0,s3
  400a68:	00403021 	move	a2,v0
  400a6c:	02202021 	move	a0,s1
  400a70:	0c100200 	jal	400800 <__pf_print>
  400a74:	02602821 	move	a1,s3
  400a78:	0c10042c 	jal	4010b0 <strlen>
  400a7c:	02a02021 	move	a0,s5
  400a80:	02202021 	move	a0,s1
  400a84:	02a02821 	move	a1,s5
  400a88:	8fbf0028 	lw	ra,40(sp)
  400a8c:	8fb50024 	lw	s5,36(sp)
  400a90:	8fb40020 	lw	s4,32(sp)
  400a94:	8fb3001c 	lw	s3,28(sp)
  400a98:	8fb20018 	lw	s2,24(sp)
  400a9c:	8fb10014 	lw	s1,20(sp)
  400aa0:	8fb00010 	lw	s0,16(sp)
  400aa4:	00403021 	move	a2,v0
  400aa8:	08100200 	j	400800 <__pf_print>
  400aac:	27bd0030 	addiu	sp,sp,48
  400ab0:	02802821 	move	a1,s4
  400ab4:	0c100200 	jal	400800 <__pf_print>
  400ab8:	02202021 	move	a0,s1
  400abc:	0c10042c 	jal	4010b0 <strlen>
  400ac0:	02602021 	move	a0,s3
  400ac4:	00403021 	move	a2,v0
  400ac8:	02202021 	move	a0,s1
  400acc:	0c100200 	jal	400800 <__pf_print>
  400ad0:	02602821 	move	a1,s3
  400ad4:	0c10042c 	jal	4010b0 <strlen>
  400ad8:	02a02021 	move	a0,s5
  400adc:	081002a1 	j	400a84 <__pf_printstuff+0x194>
  400ae0:	02202021 	move	a0,s1
  400ae4:	0c100221 	jal	400884 <__pf_fill>
  400ae8:	02002821 	move	a1,s0
  400aec:	0810026f 	j	4009bc <__pf_printstuff+0xcc>
  400af0:	00000000 	nop

00400af4 <__vprintf>:
  400af4:	27bdff68 	addiu	sp,sp,-152
  400af8:	afbe0090 	sw	s8,144(sp)
  400afc:	27be0030 	addiu	s8,sp,48
  400b00:	afb10074 	sw	s1,116(sp)
  400b04:	afa40030 	sw	a0,48(sp)
  400b08:	00c08821 	move	s1,a2
  400b0c:	03c02021 	move	a0,s8
  400b10:	afb00070 	sw	s0,112(sp)
  400b14:	afbf0094 	sw	ra,148(sp)
  400b18:	afb7008c 	sw	s7,140(sp)
  400b1c:	afb60088 	sw	s6,136(sp)
  400b20:	afb50084 	sw	s5,132(sp)
  400b24:	afb40080 	sw	s4,128(sp)
  400b28:	afb3007c 	sw	s3,124(sp)
  400b2c:	afb20078 	sw	s2,120(sp)
  400b30:	afa50034 	sw	a1,52(sp)
  400b34:	afa70038 	sw	a3,56(sp)
  400b38:	0c100212 	jal	400848 <__pf_endfield>
  400b3c:	afa0003c 	sw	zero,60(sp)
  400b40:	82300000 	lb	s0,0(s1)
  400b44:	00000000 	nop
  400b48:	12000017 	beqz	s0,400ba8 <__vprintf+0xb4>
  400b4c:	0220a021 	move	s4,s1
  400b50:	081002de 	j	400b78 <__vprintf+0x84>
  400b54:	00000000 	nop
  400b58:	27a50010 	addiu	a1,sp,16
  400b5c:	24060001 	li	a2,1
  400b60:	0c100200 	jal	400800 <__pf_print>
  400b64:	a3b00010 	sb	s0,16(sp)
  400b68:	82900001 	lb	s0,1(s4)
  400b6c:	00000000 	nop
  400b70:	1200000d 	beqz	s0,400ba8 <__vprintf+0xb4>
  400b74:	26940001 	addiu	s4,s4,1
  400b78:	8fa20040 	lw	v0,64(sp)
  400b7c:	00000000 	nop
  400b80:	14400016 	bnez	v0,400bdc <__vprintf+0xe8>
  400b84:	24020025 	li	v0,37
  400b88:	1602fff3 	bne	s0,v0,400b58 <__vprintf+0x64>
  400b8c:	03c02021 	move	a0,s8
  400b90:	24020001 	li	v0,1
  400b94:	afa20040 	sw	v0,64(sp)
  400b98:	82900001 	lb	s0,1(s4)
  400b9c:	00000000 	nop
  400ba0:	1600fff5 	bnez	s0,400b78 <__vprintf+0x84>
  400ba4:	26940001 	addiu	s4,s4,1
  400ba8:	8fa2003c 	lw	v0,60(sp)
  400bac:	8fbf0094 	lw	ra,148(sp)
  400bb0:	8fbe0090 	lw	s8,144(sp)
  400bb4:	8fb7008c 	lw	s7,140(sp)
  400bb8:	8fb60088 	lw	s6,136(sp)
  400bbc:	8fb50084 	lw	s5,132(sp)
  400bc0:	8fb40080 	lw	s4,128(sp)
  400bc4:	8fb3007c 	lw	s3,124(sp)
  400bc8:	8fb20078 	lw	s2,120(sp)
  400bcc:	8fb10074 	lw	s1,116(sp)
  400bd0:	8fb00070 	lw	s0,112(sp)
  400bd4:	03e00008 	jr	ra
  400bd8:	27bd0098 	addiu	sp,sp,152
  400bdc:	3c040040 	lui	a0,0x40
  400be0:	24841a10 	addiu	a0,a0,6672
  400be4:	0c100408 	jal	401020 <strchr>
  400be8:	02002821 	move	a1,s0
  400bec:	10400031 	beqz	v0,400cb4 <__vprintf+0x1c0>
  400bf0:	24020030 	li	v0,48
  400bf4:	1202001d 	beq	s0,v0,400c6c <__vprintf+0x178>
  400bf8:	2a020031 	slti	v0,s0,49
  400bfc:	10400013 	beqz	v0,400c4c <__vprintf+0x158>
  400c00:	2402006c 	li	v0,108
  400c04:	24020023 	li	v0,35
  400c08:	12020027 	beq	s0,v0,400ca8 <__vprintf+0x1b4>
  400c0c:	2402002d 	li	v0,45
  400c10:	1202004a 	beq	s0,v0,400d3c <__vprintf+0x248>
  400c14:	24020001 	li	v0,1
  400c18:	2602ffcf 	addiu	v0,s0,-49
  400c1c:	2c420009 	sltiu	v0,v0,9
  400c20:	1040001a 	beqz	v0,400c8c <__vprintf+0x198>
  400c24:	3c040040 	lui	a0,0x40
  400c28:	8fa20054 	lw	v0,84(sp)
  400c2c:	00000000 	nop
  400c30:	000218c0 	sll	v1,v0,0x3
  400c34:	00021040 	sll	v0,v0,0x1
  400c38:	00431021 	addu	v0,v0,v1
  400c3c:	02021021 	addu	v0,s0,v0
  400c40:	2442ffd0 	addiu	v0,v0,-48
  400c44:	081002da 	j	400b68 <__vprintf+0x74>
  400c48:	afa20054 	sw	v0,84(sp)
  400c4c:	1602fff3 	bne	s0,v0,400c1c <__vprintf+0x128>
  400c50:	2602ffcf 	addiu	v0,s0,-49
  400c54:	8fa20044 	lw	v0,68(sp)
  400c58:	24030001 	li	v1,1
  400c5c:	10430039 	beq	v0,v1,400d44 <__vprintf+0x250>
  400c60:	24020002 	li	v0,2
  400c64:	081002da 	j	400b68 <__vprintf+0x74>
  400c68:	afa30044 	sw	v1,68(sp)
  400c6c:	8fa20054 	lw	v0,84(sp)
  400c70:	00000000 	nop
  400c74:	1840008c 	blez	v0,400ea8 <__vprintf+0x3b4>
  400c78:	000218c0 	sll	v1,v0,0x3
  400c7c:	00021040 	sll	v0,v0,0x1
  400c80:	00431021 	addu	v0,v0,v1
  400c84:	081002da 	j	400b68 <__vprintf+0x74>
  400c88:	afa20054 	sw	v0,84(sp)
  400c8c:	3c060040 	lui	a2,0x40
  400c90:	24841a20 	addiu	a0,a0,6688
  400c94:	24c61a48 	addiu	a2,a2,6728
  400c98:	0c100450 	jal	401140 <__bad_assert>
  400c9c:	240500dc 	li	a1,220
  400ca0:	0810030a 	j	400c28 <__vprintf+0x134>
  400ca4:	00000000 	nop
  400ca8:	24020001 	li	v0,1
  400cac:	081002da 	j	400b68 <__vprintf+0x74>
  400cb0:	afa20068 	sw	v0,104(sp)
  400cb4:	3c040040 	lui	a0,0x40
  400cb8:	24841a5c 	addiu	a0,a0,6748
  400cbc:	0c100408 	jal	401020 <strchr>
  400cc0:	02002821 	move	a1,s0
  400cc4:	10400091 	beqz	v0,400f0c <__vprintf+0x418>
  400cc8:	24020070 	li	v0,112
  400ccc:	1202001f 	beq	s0,v0,400d4c <__vprintf+0x258>
  400cd0:	24020064 	li	v0,100
  400cd4:	1202009e 	beq	s0,v0,400f50 <__vprintf+0x45c>
  400cd8:	24020001 	li	v0,1
  400cdc:	8fa30044 	lw	v1,68(sp)
  400ce0:	00000000 	nop
  400ce4:	10620003 	beq	v1,v0,400cf4 <__vprintf+0x200>
  400ce8:	00000000 	nop
  400cec:	14600074 	bnez	v1,400ec0 <__vprintf+0x3cc>
  400cf0:	24020002 	li	v0,2
  400cf4:	8fa20038 	lw	v0,56(sp)
  400cf8:	afa00048 	sw	zero,72(sp)
  400cfc:	8c430000 	lw	v1,0(v0)
  400d00:	24420004 	addiu	v0,v0,4
  400d04:	afa20038 	sw	v0,56(sp)
  400d08:	afa3004c 	sw	v1,76(sp)
  400d0c:	2602ff9c 	addiu	v0,s0,-100
  400d10:	304200ff 	andi	v0,v0,0xff
  400d14:	2c430015 	sltiu	v1,v0,21
  400d18:	10600015 	beqz	v1,400d70 <__vprintf+0x27c>
  400d1c:	3c030040 	lui	v1,0x40
  400d20:	00021080 	sll	v0,v0,0x2
  400d24:	24631860 	addiu	v1,v1,6240
  400d28:	00431021 	addu	v0,v0,v1
  400d2c:	8c440000 	lw	a0,0(v0)
  400d30:	00000000 	nop
  400d34:	00800008 	jr	a0
  400d38:	00000000 	nop
  400d3c:	081002da 	j	400b68 <__vprintf+0x74>
  400d40:	afa20058 	sw	v0,88(sp)
  400d44:	081002da 	j	400b68 <__vprintf+0x74>
  400d48:	afa20044 	sw	v0,68(sp)
  400d4c:	8fa20038 	lw	v0,56(sp)
  400d50:	afa00048 	sw	zero,72(sp)
  400d54:	24430004 	addiu	v1,v0,4
  400d58:	afa30038 	sw	v1,56(sp)
  400d5c:	8c440000 	lw	a0,0(v0)
  400d60:	00000000 	nop
  400d64:	afa4004c 	sw	a0,76(sp)
  400d68:	24020010 	li	v0,16
  400d6c:	afa20060 	sw	v0,96(sp)
  400d70:	8fa20068 	lw	v0,104(sp)
  400d74:	00000000 	nop
  400d78:	1440004d 	bnez	v0,400eb0 <__vprintf+0x3bc>
  400d7c:	24020001 	li	v0,1
  400d80:	24020070 	li	v0,112
  400d84:	1202004a 	beq	s0,v0,400eb0 <__vprintf+0x3bc>
  400d88:	24020001 	li	v0,1
  400d8c:	8fb60060 	lw	s6,96(sp)
  400d90:	3c020040 	lui	v0,0x40
  400d94:	8fb1004c 	lw	s1,76(sp)
  400d98:	8fb00048 	lw	s0,72(sp)
  400d9c:	a3a00029 	sb	zero,41(sp)
  400da0:	24571a64 	addiu	s7,v0,6756
  400da4:	27b50028 	addiu	s5,sp,40
  400da8:	02c09821 	move	s3,s6
  400dac:	001697c3 	sra	s2,s6,0x1f
  400db0:	02202821 	move	a1,s1
  400db4:	02002021 	move	a0,s0
  400db8:	02603821 	move	a3,s3
  400dbc:	0c100444 	jal	401110 <__umoddi3>
  400dc0:	02403021 	move	a2,s2
  400dc4:	02e31821 	addu	v1,s7,v1
  400dc8:	90620000 	lbu	v0,0(v1)
  400dcc:	02202821 	move	a1,s1
  400dd0:	02002021 	move	a0,s0
  400dd4:	02603821 	move	a3,s3
  400dd8:	02403021 	move	a2,s2
  400ddc:	0c10043c 	jal	4010f0 <__udivdi3>
  400de0:	a2a20000 	sb	v0,0(s5)
  400de4:	00408021 	move	s0,v0
  400de8:	02031025 	or	v0,s0,v1
  400dec:	00608821 	move	s1,v1
  400df0:	1440ffef 	bnez	v0,400db0 <__vprintf+0x2bc>
  400df4:	26b5ffff 	addiu	s5,s5,-1
  400df8:	8fa20064 	lw	v0,100(sp)
  400dfc:	00000000 	nop
  400e00:	10400006 	beqz	v0,400e1c <__vprintf+0x328>
  400e04:	3c020040 	lui	v0,0x40
  400e08:	24020010 	li	v0,16
  400e0c:	12c2005e 	beq	s6,v0,400f88 <__vprintf+0x494>
  400e10:	24020008 	li	v0,8
  400e14:	12c20037 	beq	s6,v0,400ef4 <__vprintf+0x400>
  400e18:	3c020040 	lui	v0,0x40
  400e1c:	24461b2c 	addiu	a2,v0,6956
  400e20:	8fa20050 	lw	v0,80(sp)
  400e24:	00000000 	nop
  400e28:	10400023 	beqz	v0,400eb8 <__vprintf+0x3c4>
  400e2c:	3c020040 	lui	v0,0x40
  400e30:	3c020040 	lui	v0,0x40
  400e34:	24451a04 	addiu	a1,v0,6660
  400e38:	03c02021 	move	a0,s8
  400e3c:	0c10023c 	jal	4008f0 <__pf_printstuff>
  400e40:	26a70001 	addiu	a3,s5,1
  400e44:	0c100212 	jal	400848 <__pf_endfield>
  400e48:	03c02021 	move	a0,s8
  400e4c:	081002da 	j	400b68 <__vprintf+0x74>
  400e50:	00000000 	nop
  400e54:	8fa20038 	lw	v0,56(sp)
  400e58:	2403fff8 	li	v1,-8
  400e5c:	24420007 	addiu	v0,v0,7
  400e60:	00431024 	and	v0,v0,v1
  400e64:	8c470004 	lw	a3,4(v0)
  400e68:	8c460000 	lw	a2,0(v0)
  400e6c:	24420008 	addiu	v0,v0,8
  400e70:	afa20038 	sw	v0,56(sp)
  400e74:	04c10040 	bgez	a2,400f78 <__vprintf+0x484>
  400e78:	2402000a 	li	v0,10
  400e7c:	00071823 	negu	v1,a3
  400e80:	0003282b 	sltu	a1,zero,v1
  400e84:	00061023 	negu	v0,a2
  400e88:	00451023 	subu	v0,v0,a1
  400e8c:	2404ffff 	li	a0,-1
  400e90:	afa40050 	sw	a0,80(sp)
  400e94:	afa3004c 	sw	v1,76(sp)
  400e98:	afa20048 	sw	v0,72(sp)
  400e9c:	2402000a 	li	v0,10
  400ea0:	0810035c 	j	400d70 <__vprintf+0x27c>
  400ea4:	afa20060 	sw	v0,96(sp)
  400ea8:	081002da 	j	400b68 <__vprintf+0x74>
  400eac:	afb0005c 	sw	s0,92(sp)
  400eb0:	08100363 	j	400d8c <__vprintf+0x298>
  400eb4:	afa20064 	sw	v0,100(sp)
  400eb8:	0810038e 	j	400e38 <__vprintf+0x344>
  400ebc:	24451b2c 	addiu	a1,v0,6956
  400ec0:	1462ff93 	bne	v1,v0,400d10 <__vprintf+0x21c>
  400ec4:	2602ff9c 	addiu	v0,s0,-100
  400ec8:	8fa20038 	lw	v0,56(sp)
  400ecc:	2403fff8 	li	v1,-8
  400ed0:	24420007 	addiu	v0,v0,7
  400ed4:	00431024 	and	v0,v0,v1
  400ed8:	8c450004 	lw	a1,4(v0)
  400edc:	8c440000 	lw	a0,0(v0)
  400ee0:	24420008 	addiu	v0,v0,8
  400ee4:	afa20038 	sw	v0,56(sp)
  400ee8:	afa5004c 	sw	a1,76(sp)
  400eec:	08100343 	j	400d0c <__vprintf+0x218>
  400ef0:	afa40048 	sw	a0,72(sp)
  400ef4:	3c020040 	lui	v0,0x40
  400ef8:	08100388 	j	400e20 <__vprintf+0x32c>
  400efc:	24461a7c 	addiu	a2,v0,6780
  400f00:	24020008 	li	v0,8
  400f04:	0810035c 	j	400d70 <__vprintf+0x27c>
  400f08:	afa20060 	sw	v0,96(sp)
  400f0c:	24020073 	li	v0,115
  400f10:	12020028 	beq	s0,v0,400fb4 <__vprintf+0x4c0>
  400f14:	24020063 	li	v0,99
  400f18:	12020037 	beq	s0,v0,400ff8 <__vprintf+0x504>
  400f1c:	00000000 	nop
  400f20:	a3b00011 	sb	s0,17(sp)
  400f24:	3c050040 	lui	a1,0x40
  400f28:	24a51b2c 	addiu	a1,a1,6956
  400f2c:	03c02021 	move	a0,s8
  400f30:	00a03021 	move	a2,a1
  400f34:	27a70011 	addiu	a3,sp,17
  400f38:	0c10023c 	jal	4008f0 <__pf_printstuff>
  400f3c:	a3a00012 	sb	zero,18(sp)
  400f40:	0c100212 	jal	400848 <__pf_endfield>
  400f44:	03c02021 	move	a0,s8
  400f48:	081002da 	j	400b68 <__vprintf+0x74>
  400f4c:	00000000 	nop
  400f50:	8fa30044 	lw	v1,68(sp)
  400f54:	00000000 	nop
  400f58:	1062000e 	beq	v1,v0,400f94 <__vprintf+0x4a0>
  400f5c:	00000000 	nop
  400f60:	1060000c 	beqz	v1,400f94 <__vprintf+0x4a0>
  400f64:	24020002 	li	v0,2
  400f68:	1062ffba 	beq	v1,v0,400e54 <__vprintf+0x360>
  400f6c:	00003821 	move	a3,zero
  400f70:	00003021 	move	a2,zero
  400f74:	2402000a 	li	v0,10
  400f78:	afa7004c 	sw	a3,76(sp)
  400f7c:	afa60048 	sw	a2,72(sp)
  400f80:	0810035c 	j	400d70 <__vprintf+0x27c>
  400f84:	afa20060 	sw	v0,96(sp)
  400f88:	3c020040 	lui	v0,0x40
  400f8c:	08100388 	j	400e20 <__vprintf+0x32c>
  400f90:	24461a78 	addiu	a2,v0,6776
  400f94:	8fa20038 	lw	v0,56(sp)
  400f98:	00000000 	nop
  400f9c:	8c430000 	lw	v1,0(v0)
  400fa0:	24420004 	addiu	v0,v0,4
  400fa4:	00603821 	move	a3,v1
  400fa8:	000337c3 	sra	a2,v1,0x1f
  400fac:	0810039d 	j	400e74 <__vprintf+0x380>
  400fb0:	afa20038 	sw	v0,56(sp)
  400fb4:	8fa30038 	lw	v1,56(sp)
  400fb8:	00000000 	nop
  400fbc:	8c670000 	lw	a3,0(v1)
  400fc0:	00000000 	nop
  400fc4:	10e00013 	beqz	a3,401014 <__vprintf+0x520>
  400fc8:	3c020040 	lui	v0,0x40
  400fcc:	3c050040 	lui	a1,0x40
  400fd0:	24a51b2c 	addiu	a1,a1,6956
  400fd4:	24620004 	addiu	v0,v1,4
  400fd8:	03c02021 	move	a0,s8
  400fdc:	00a03021 	move	a2,a1
  400fe0:	0c10023c 	jal	4008f0 <__pf_printstuff>
  400fe4:	afa20038 	sw	v0,56(sp)
  400fe8:	0c100212 	jal	400848 <__pf_endfield>
  400fec:	03c02021 	move	a0,s8
  400ff0:	081002da 	j	400b68 <__vprintf+0x74>
  400ff4:	00000000 	nop
  400ff8:	8fa20038 	lw	v0,56(sp)
  400ffc:	00000000 	nop
  401000:	8c430000 	lw	v1,0(v0)
  401004:	24420004 	addiu	v0,v0,4
  401008:	afa20038 	sw	v0,56(sp)
  40100c:	081003c9 	j	400f24 <__vprintf+0x430>
  401010:	a3a30011 	sb	v1,17(sp)
  401014:	081003f3 	j	400fcc <__vprintf+0x4d8>
  401018:	24471a08 	addiu	a3,v0,6664
  40101c:	00000000 	nop

00401020 <strchr>:
  401020:	80830000 	lb	v1,0(a0)
  401024:	00052e00 	sll	a1,a1,0x18
  401028:	00801021 	move	v0,a0
  40102c:	1060000c 	beqz	v1,401060 <strchr+0x40>
  401030:	00052e03 	sra	a1,a1,0x18
  401034:	14a30006 	bne	a1,v1,401050 <strchr+0x30>
  401038:	24420001 	addiu	v0,v0,1
  40103c:	03e00008 	jr	ra
  401040:	2442ffff 	addiu	v0,v0,-1
  401044:	10a3000c 	beq	a1,v1,401078 <strchr+0x58>
  401048:	00000000 	nop
  40104c:	24420001 	addiu	v0,v0,1
  401050:	80430000 	lb	v1,0(v0)
  401054:	00000000 	nop
  401058:	1460fffa 	bnez	v1,401044 <strchr+0x24>
  40105c:	00000000 	nop
  401060:	14a00003 	bnez	a1,401070 <strchr+0x50>
  401064:	00000000 	nop
  401068:	03e00008 	jr	ra
  40106c:	00000000 	nop
  401070:	03e00008 	jr	ra
  401074:	00001021 	move	v0,zero
  401078:	03e00008 	jr	ra
  40107c:	00000000 	nop

00401080 <strerror>:
  401080:	3c020040 	lui	v0,0x40
  401084:	00042880 	sll	a1,a0,0x2
  401088:	244218c0 	addiu	v0,v0,6336
  40108c:	3c030040 	lui	v1,0x40
  401090:	2c840041 	sltiu	a0,a0,65
  401094:	00a22821 	addu	a1,a1,v0
  401098:	10800002 	beqz	a0,4010a4 <strerror+0x24>
  40109c:	24621a80 	addiu	v0,v1,6784
  4010a0:	8ca20000 	lw	v0,0(a1)
  4010a4:	03e00008 	jr	ra
  4010a8:	00000000 	nop
  4010ac:	00000000 	nop

004010b0 <strlen>:
  4010b0:	80820000 	lb	v0,0(a0)
  4010b4:	00000000 	nop
  4010b8:	1040000a 	beqz	v0,4010e4 <strlen+0x34>
  4010bc:	00002821 	move	a1,zero
  4010c0:	24a50001 	addiu	a1,a1,1
  4010c4:	00851021 	addu	v0,a0,a1
  4010c8:	80430000 	lb	v1,0(v0)
  4010cc:	00000000 	nop
  4010d0:	1460fffc 	bnez	v1,4010c4 <strlen+0x14>
  4010d4:	24a50001 	addiu	a1,a1,1
  4010d8:	24a5ffff 	addiu	a1,a1,-1
  4010dc:	03e00008 	jr	ra
  4010e0:	00a01021 	move	v0,a1
  4010e4:	03e00008 	jr	ra
  4010e8:	00a01021 	move	v0,a1
  4010ec:	00000000 	nop

004010f0 <__udivdi3>:
  4010f0:	27bdffe0 	addiu	sp,sp,-32
  4010f4:	afbf0018 	sw	ra,24(sp)
  4010f8:	0c1004cb 	jal	40132c <__qdivrem>
  4010fc:	afa00010 	sw	zero,16(sp)
  401100:	8fbf0018 	lw	ra,24(sp)
  401104:	00000000 	nop
  401108:	03e00008 	jr	ra
  40110c:	27bd0020 	addiu	sp,sp,32

00401110 <__umoddi3>:
  401110:	27bdffd8 	addiu	sp,sp,-40
  401114:	27a20018 	addiu	v0,sp,24
  401118:	afbf0020 	sw	ra,32(sp)
  40111c:	0c1004cb 	jal	40132c <__qdivrem>
  401120:	afa20010 	sw	v0,16(sp)
  401124:	8fa3001c 	lw	v1,28(sp)
  401128:	8fa20018 	lw	v0,24(sp)
  40112c:	8fbf0020 	lw	ra,32(sp)
  401130:	00000000 	nop
  401134:	03e00008 	jr	ra
  401138:	27bd0028 	addiu	sp,sp,40
  40113c:	00000000 	nop

00401140 <__bad_assert>:
  401140:	27bdfee0 	addiu	sp,sp,-288
  401144:	00c03821 	move	a3,a2
  401148:	afb00118 	sw	s0,280(sp)
  40114c:	3c060040 	lui	a2,0x40
  401150:	27b00018 	addiu	s0,sp,24
  401154:	24c62084 	addiu	a2,a2,8324
  401158:	afa40010 	sw	a0,16(sp)
  40115c:	afa50014 	sw	a1,20(sp)
  401160:	02002021 	move	a0,s0
  401164:	afbf011c 	sw	ra,284(sp)
  401168:	0c10049c 	jal	401270 <snprintf>
  40116c:	24050100 	li	a1,256
  401170:	0c10042c 	jal	4010b0 <strlen>
  401174:	02002021 	move	a0,s0
  401178:	00403021 	move	a2,v0
  40117c:	02002821 	move	a1,s0
  401180:	0c10010b 	jal	40042c <write>
  401184:	24040002 	li	a0,2
  401188:	0c1004a8 	jal	4012a0 <abort>
  40118c:	00000000 	nop

00401190 <__snprintf_send>:
  401190:	10c00012 	beqz	a2,4011dc <__snprintf_send+0x4c>
  401194:	00004021 	move	t0,zero
  401198:	8c870008 	lw	a3,8(a0)
  40119c:	8c820004 	lw	v0,4(a0)
  4011a0:	00a81821 	addu	v1,a1,t0
  4011a4:	00e2102b 	sltu	v0,a3,v0
  4011a8:	1040000a 	beqz	v0,4011d4 <__snprintf_send+0x44>
  4011ac:	25080001 	addiu	t0,t0,1
  4011b0:	8c820000 	lw	v0,0(a0)
  4011b4:	90630000 	lbu	v1,0(v1)
  4011b8:	00471021 	addu	v0,v0,a3
  4011bc:	a0430000 	sb	v1,0(v0)
  4011c0:	8c870008 	lw	a3,8(a0)
  4011c4:	00000000 	nop
  4011c8:	24e20001 	addiu	v0,a3,1
  4011cc:	00403821 	move	a3,v0
  4011d0:	ac820008 	sw	v0,8(a0)
  4011d4:	14c8fff1 	bne	a2,t0,40119c <__snprintf_send+0xc>
  4011d8:	00000000 	nop
  4011dc:	03e00008 	jr	ra
  4011e0:	00000000 	nop

004011e4 <vsnprintf>:
  4011e4:	27bdffd8 	addiu	sp,sp,-40
  4011e8:	afb00020 	sw	s0,32(sp)
  4011ec:	00a01021 	move	v0,a1
  4011f0:	00808021 	move	s0,a0
  4011f4:	3c040040 	lui	a0,0x40
  4011f8:	24a3ffff 	addiu	v1,a1,-1
  4011fc:	afbf0024 	sw	ra,36(sp)
  401200:	24841190 	addiu	a0,a0,4496
  401204:	27a50010 	addiu	a1,sp,16
  401208:	1440000c 	bnez	v0,40123c <vsnprintf+0x58>
  40120c:	afb00010 	sw	s0,16(sp)
  401210:	3c040040 	lui	a0,0x40
  401214:	24841190 	addiu	a0,a0,4496
  401218:	afa00014 	sw	zero,20(sp)
  40121c:	0c1002bd 	jal	400af4 <__vprintf>
  401220:	afa00018 	sw	zero,24(sp)
  401224:	00401821 	move	v1,v0
  401228:	8fbf0024 	lw	ra,36(sp)
  40122c:	8fb00020 	lw	s0,32(sp)
  401230:	00601021 	move	v0,v1
  401234:	03e00008 	jr	ra
  401238:	27bd0028 	addiu	sp,sp,40
  40123c:	afa30014 	sw	v1,20(sp)
  401240:	0c1002bd 	jal	400af4 <__vprintf>
  401244:	afa00018 	sw	zero,24(sp)
  401248:	00401821 	move	v1,v0
  40124c:	8fa20018 	lw	v0,24(sp)
  401250:	00000000 	nop
  401254:	02021021 	addu	v0,s0,v0
  401258:	a0400000 	sb	zero,0(v0)
  40125c:	8fbf0024 	lw	ra,36(sp)
  401260:	8fb00020 	lw	s0,32(sp)
  401264:	00601021 	move	v0,v1
  401268:	03e00008 	jr	ra
  40126c:	27bd0028 	addiu	sp,sp,40

00401270 <snprintf>:
  401270:	27bdffe0 	addiu	sp,sp,-32
  401274:	27a2002c 	addiu	v0,sp,44
  401278:	afa7002c 	sw	a3,44(sp)
  40127c:	00403821 	move	a3,v0
  401280:	afbf0018 	sw	ra,24(sp)
  401284:	0c100479 	jal	4011e4 <vsnprintf>
  401288:	afa20010 	sw	v0,16(sp)
  40128c:	8fbf0018 	lw	ra,24(sp)
  401290:	00000000 	nop
  401294:	03e00008 	jr	ra
  401298:	27bd0020 	addiu	sp,sp,32
  40129c:	00000000 	nop

004012a0 <abort>:
  4012a0:	27bdffe8 	addiu	sp,sp,-24
  4012a4:	afbf0010 	sw	ra,16(sp)
  4012a8:	0c1000cb 	jal	40032c <_exit>
  4012ac:	240400ff 	li	a0,255

004012b0 <shl>:
  4012b0:	18a00016 	blez	a1,40130c <shl+0x5c>
  4012b4:	24020010 	li	v0,16
  4012b8:	00464823 	subu	t1,v0,a2
  4012bc:	00803821 	move	a3,a0
  4012c0:	00004021 	move	t0,zero
  4012c4:	8ce20000 	lw	v0,0(a3)
  4012c8:	8ce30004 	lw	v1,4(a3)
  4012cc:	00c21004 	sllv	v0,v0,a2
  4012d0:	3042ffff 	andi	v0,v0,0xffff
  4012d4:	01231806 	srlv	v1,v1,t1
  4012d8:	00431025 	or	v0,v0,v1
  4012dc:	25080001 	addiu	t0,t0,1
  4012e0:	ace20000 	sw	v0,0(a3)
  4012e4:	14a8fff7 	bne	a1,t0,4012c4 <shl+0x14>
  4012e8:	24e70004 	addiu	a3,a3,4
  4012ec:	00051880 	sll	v1,a1,0x2
  4012f0:	00831821 	addu	v1,a0,v1
  4012f4:	8c620000 	lw	v0,0(v1)
  4012f8:	00000000 	nop
  4012fc:	00c21004 	sllv	v0,v0,a2
  401300:	3042ffff 	andi	v0,v0,0xffff
  401304:	03e00008 	jr	ra
  401308:	ac620000 	sw	v0,0(v1)
  40130c:	00001821 	move	v1,zero
  401310:	00831821 	addu	v1,a0,v1
  401314:	8c620000 	lw	v0,0(v1)
  401318:	00000000 	nop
  40131c:	00c21004 	sllv	v0,v0,a2
  401320:	3042ffff 	andi	v0,v0,0xffff
  401324:	03e00008 	jr	ra
  401328:	ac620000 	sw	v0,0(v1)

0040132c <__qdivrem>:
  40132c:	27bdff80 	addiu	sp,sp,-128
  401330:	00c71025 	or	v0,a2,a3
  401334:	afb20060 	sw	s2,96(sp)
  401338:	afbf007c 	sw	ra,124(sp)
  40133c:	afbe0078 	sw	s8,120(sp)
  401340:	afb70074 	sw	s7,116(sp)
  401344:	afb60070 	sw	s6,112(sp)
  401348:	afb5006c 	sw	s5,108(sp)
  40134c:	afb40068 	sw	s4,104(sp)
  401350:	afb30064 	sw	s3,100(sp)
  401354:	afb1005c 	sw	s1,92(sp)
  401358:	afb00058 	sw	s0,88(sp)
  40135c:	00a04821 	move	t1,a1
  401360:	8fb20090 	lw	s2,144(sp)
  401364:	14400018 	bnez	v0,4013c8 <__qdivrem+0x9c>
  401368:	00804021 	move	t0,a0
  40136c:	3c031000 	lui	v1,0x1000
  401370:	8c640000 	lw	a0,0(v1)
  401374:	24020001 	li	v0,1
  401378:	14800002 	bnez	a0,401384 <__qdivrem+0x58>
  40137c:	0044001b 	divu	zero,v0,a0
  401380:	0007000d 	break	0x7
  401384:	00001012 	mflo	v0
  401388:	12400003 	beqz	s2,401398 <__qdivrem+0x6c>
  40138c:	00401821 	move	v1,v0
  401390:	ae450004 	sw	a1,4(s2)
  401394:	ae480000 	sw	t0,0(s2)
  401398:	8fbf007c 	lw	ra,124(sp)
  40139c:	8fbe0078 	lw	s8,120(sp)
  4013a0:	8fb70074 	lw	s7,116(sp)
  4013a4:	8fb60070 	lw	s6,112(sp)
  4013a8:	8fb5006c 	lw	s5,108(sp)
  4013ac:	8fb40068 	lw	s4,104(sp)
  4013b0:	8fb30064 	lw	s3,100(sp)
  4013b4:	8fb20060 	lw	s2,96(sp)
  4013b8:	8fb1005c 	lw	s1,92(sp)
  4013bc:	8fb00058 	lw	s0,88(sp)
  4013c0:	03e00008 	jr	ra
  4013c4:	27bd0080 	addiu	sp,sp,128
  4013c8:	0086102b 	sltu	v0,a0,a2
  4013cc:	10400008 	beqz	v0,4013f0 <__qdivrem+0xc4>
  4013d0:	00000000 	nop
  4013d4:	1240010c 	beqz	s2,401808 <__qdivrem+0x4dc>
  4013d8:	00000000 	nop
  4013dc:	00001821 	move	v1,zero
  4013e0:	00001021 	move	v0,zero
  4013e4:	ae490004 	sw	t1,4(s2)
  4013e8:	081004e6 	j	401398 <__qdivrem+0x6c>
  4013ec:	ae480000 	sw	t0,0(s2)
  4013f0:	10860046 	beq	a0,a2,40150c <__qdivrem+0x1e0>
  4013f4:	00a7102b 	sltu	v0,a1,a3
  4013f8:	00e08821 	move	s1,a3
  4013fc:	01001821 	move	v1,t0
  401400:	00c08021 	move	s0,a2
  401404:	30c7ffff 	andi	a3,a2,0xffff
  401408:	3108ffff 	andi	t0,t0,0xffff
  40140c:	312affff 	andi	t2,t1,0xffff
  401410:	3226ffff 	andi	a2,s1,0xffff
  401414:	00031c02 	srl	v1,v1,0x10
  401418:	00092c02 	srl	a1,t1,0x10
  40141c:	00101402 	srl	v0,s0,0x10
  401420:	00112402 	srl	a0,s1,0x10
  401424:	afa00010 	sw	zero,16(sp)
  401428:	afa30014 	sw	v1,20(sp)
  40142c:	afa80018 	sw	t0,24(sp)
  401430:	afa5001c 	sw	a1,28(sp)
  401434:	afaa0020 	sw	t2,32(sp)
  401438:	afa20028 	sw	v0,40(sp)
  40143c:	afa7002c 	sw	a3,44(sp)
  401440:	afa40030 	sw	a0,48(sp)
  401444:	144000f6 	bnez	v0,401820 <__qdivrem+0x4f4>
  401448:	afa60034 	sw	a2,52(sp)
  40144c:	14e00033 	bnez	a3,40151c <__qdivrem+0x1f0>
  401450:	27a20028 	addiu	v0,sp,40
  401454:	148000f7 	bnez	a0,401834 <__qdivrem+0x508>
  401458:	27a2002c 	addiu	v0,sp,44
  40145c:	14c00002 	bnez	a2,401468 <__qdivrem+0x13c>
  401460:	0066001b 	divu	zero,v1,a2
  401464:	0007000d 	break	0x7
  401468:	00001010 	mfhi	v0
  40146c:	00021400 	sll	v0,v0,0x10
  401470:	00481025 	or	v0,v0,t0
  401474:	00004812 	mflo	t1
	...
  401480:	14c00002 	bnez	a2,40148c <__qdivrem+0x160>
  401484:	0046001b 	divu	zero,v0,a2
  401488:	0007000d 	break	0x7
  40148c:	00001810 	mfhi	v1
  401490:	00031c00 	sll	v1,v1,0x10
  401494:	00651825 	or	v1,v1,a1
  401498:	00003812 	mflo	a3
	...
  4014a4:	14c00002 	bnez	a2,4014b0 <__qdivrem+0x184>
  4014a8:	0066001b 	divu	zero,v1,a2
  4014ac:	0007000d 	break	0x7
  4014b0:	00001010 	mfhi	v0
  4014b4:	00021400 	sll	v0,v0,0x10
  4014b8:	00001812 	mflo	v1
  4014bc:	12400008 	beqz	s2,4014e0 <__qdivrem+0x1b4>
  4014c0:	01422025 	or	a0,t2,v0
  4014c4:	14c00002 	bnez	a2,4014d0 <__qdivrem+0x1a4>
  4014c8:	0086001b 	divu	zero,a0,a2
  4014cc:	0007000d 	break	0x7
  4014d0:	ae400000 	sw	zero,0(s2)
  4014d4:	00001010 	mfhi	v0
  4014d8:	ae420004 	sw	v0,4(s2)
  4014dc:	00000000 	nop
  4014e0:	14c00002 	bnez	a2,4014ec <__qdivrem+0x1c0>
  4014e4:	0086001b 	divu	zero,a0,a2
  4014e8:	0007000d 	break	0x7
  4014ec:	00091400 	sll	v0,t1,0x10
  4014f0:	00031c00 	sll	v1,v1,0x10
  4014f4:	00e28025 	or	s0,a3,v0
  4014f8:	02001021 	move	v0,s0
  4014fc:	00002012 	mflo	a0
  401500:	00838825 	or	s1,a0,v1
  401504:	081004e6 	j	401398 <__qdivrem+0x6c>
  401508:	02201821 	move	v1,s1
  40150c:	1040ffbb 	beqz	v0,4013fc <__qdivrem+0xd0>
  401510:	00e08821 	move	s1,a3
  401514:	081004f5 	j	4013d4 <__qdivrem+0xa8>
  401518:	00000000 	nop
  40151c:	afa20050 	sw	v0,80(sp)
  401520:	24170003 	li	s7,3
  401524:	27be002c 	addiu	s8,sp,44
  401528:	8fa30014 	lw	v1,20(sp)
  40152c:	24020004 	li	v0,4
  401530:	146000c4 	bnez	v1,401844 <__qdivrem+0x518>
  401534:	00579823 	subu	s3,v0,s7
  401538:	08100551 	j	401544 <__qdivrem+0x218>
  40153c:	27b40014 	addiu	s4,sp,20
  401540:	0060a021 	move	s4,v1
  401544:	8e820004 	lw	v0,4(s4)
  401548:	2673ffff 	addiu	s3,s3,-1
  40154c:	1040fffc 	beqz	v0,401540 <__qdivrem+0x214>
  401550:	26830004 	addiu	v1,s4,4
  401554:	24020004 	li	v0,4
  401558:	00532023 	subu	a0,v0,s3
  40155c:	2483ffff 	addiu	v1,a0,-1
  401560:	046000bc 	bltz	v1,401854 <__qdivrem+0x528>
  401564:	00001821 	move	v1,zero
  401568:	27a60038 	addiu	a2,sp,56
  40156c:	00042880 	sll	a1,a0,0x2
  401570:	00c51021 	addu	v0,a2,a1
  401574:	2442fffc 	addiu	v0,v0,-4
  401578:	24630001 	addiu	v1,v1,1
  40157c:	ac400000 	sw	zero,0(v0)
  401580:	1464fffd 	bne	v1,a0,401578 <__qdivrem+0x24c>
  401584:	2442fffc 	addiu	v0,v0,-4
  401588:	8fcb0000 	lw	t3,0(s8)
  40158c:	34028000 	li	v0,0x8000
  401590:	0162102b 	sltu	v0,t3,v0
  401594:	00c5b021 	addu	s6,a2,a1
  401598:	104000ac 	beqz	v0,40184c <__qdivrem+0x520>
  40159c:	01601821 	move	v1,t3
  4015a0:	0000a821 	move	s5,zero
  4015a4:	34048000 	li	a0,0x8000
  4015a8:	00031840 	sll	v1,v1,0x1
  4015ac:	0064102b 	sltu	v0,v1,a0
  4015b0:	1440fffd 	bnez	v0,4015a8 <__qdivrem+0x27c>
  4015b4:	26b50001 	addiu	s5,s5,1
  4015b8:	1aa00009 	blez	s5,4015e0 <__qdivrem+0x2b4>
  4015bc:	02f32821 	addu	a1,s7,s3
  4015c0:	02a03021 	move	a2,s5
  4015c4:	0c1004ac 	jal	4012b0 <shl>
  4015c8:	02802021 	move	a0,s4
  4015cc:	03c02021 	move	a0,s8
  4015d0:	26e5ffff 	addiu	a1,s7,-1
  4015d4:	0c1004ac 	jal	4012b0 <shl>
  4015d8:	02a03021 	move	a2,s5
  4015dc:	8fcb0000 	lw	t3,0(s8)
  4015e0:	8fa20050 	lw	v0,80(sp)
  4015e4:	00177080 	sll	t6,s7,0x2
  4015e8:	8c580008 	lw	t8,8(v0)
  4015ec:	02c06821 	move	t5,s6
  4015f0:	02804821 	move	t1,s4
  4015f4:	028e6021 	addu	t4,s4,t6
  4015f8:	00007821 	move	t7,zero
  4015fc:	3416ffff 	li	s6,0xffff
  401600:	8d240000 	lw	a0,0(t1)
  401604:	8d230004 	lw	v1,4(t1)
  401608:	8d260008 	lw	a2,8(t1)
  40160c:	11640081 	beq	t3,a0,401814 <__qdivrem+0x4e8>
  401610:	00041400 	sll	v0,a0,0x10
  401614:	00621025 	or	v0,v1,v0
  401618:	15600002 	bnez	t3,401624 <__qdivrem+0x2f8>
  40161c:	004b001b 	divu	zero,v0,t3
  401620:	0007000d 	break	0x7
  401624:	00002810 	mfhi	a1
  401628:	00003812 	mflo	a3
	...
  401634:	00f80018 	mult	a3,t8
  401638:	00051400 	sll	v0,a1,0x10
  40163c:	00c21025 	or	v0,a2,v0
  401640:	00001812 	mflo	v1
  401644:	0043182b 	sltu	v1,v0,v1
  401648:	10600006 	beqz	v1,401664 <__qdivrem+0x338>
  40164c:	00000000 	nop
  401650:	24e7ffff 	addiu	a3,a3,-1
  401654:	00ab2821 	addu	a1,a1,t3
  401658:	02c5102b 	sltu	v0,s6,a1
  40165c:	1040fff6 	beqz	v0,401638 <__qdivrem+0x30c>
  401660:	00f80018 	mult	a3,t8
  401664:	1ae00017 	blez	s7,4016c4 <__qdivrem+0x398>
  401668:	00004021 	move	t0,zero
  40166c:	8fa20050 	lw	v0,80(sp)
  401670:	01802021 	move	a0,t4
  401674:	004e3021 	addu	a2,v0,t6
  401678:	02e02821 	move	a1,s7
  40167c:	3c0a0001 	lui	t2,0x1
  401680:	8cc20000 	lw	v0,0(a2)
  401684:	8c830000 	lw	v1,0(a0)
  401688:	00e20018 	mult	a3,v0
  40168c:	24a5ffff 	addiu	a1,a1,-1
  401690:	24c6fffc 	addiu	a2,a2,-4
  401694:	00001012 	mflo	v0
  401698:	00621823 	subu	v1,v1,v0
  40169c:	00681823 	subu	v1,v1,t0
  4016a0:	00031402 	srl	v0,v1,0x10
  4016a4:	01421023 	subu	v0,t2,v0
  4016a8:	3063ffff 	andi	v1,v1,0xffff
  4016ac:	ac830000 	sw	v1,0(a0)
  4016b0:	3048ffff 	andi	t0,v0,0xffff
  4016b4:	14a0fff2 	bnez	a1,401680 <__qdivrem+0x354>
  4016b8:	2484fffc 	addiu	a0,a0,-4
  4016bc:	8d240000 	lw	a0,0(t1)
  4016c0:	00000000 	nop
  4016c4:	00881023 	subu	v0,a0,t0
  4016c8:	3044ffff 	andi	a0,v0,0xffff
  4016cc:	00021c02 	srl	v1,v0,0x10
  4016d0:	10600018 	beqz	v1,401734 <__qdivrem+0x408>
  4016d4:	ad240000 	sw	a0,0(t1)
  4016d8:	1ae00012 	blez	s7,401724 <__qdivrem+0x3f8>
  4016dc:	00004021 	move	t0,zero
  4016e0:	8fa20050 	lw	v0,80(sp)
  4016e4:	01802021 	move	a0,t4
  4016e8:	004e3021 	addu	a2,v0,t6
  4016ec:	02e02821 	move	a1,s7
  4016f0:	8c820000 	lw	v0,0(a0)
  4016f4:	8cc30000 	lw	v1,0(a2)
  4016f8:	01021021 	addu	v0,t0,v0
  4016fc:	00431021 	addu	v0,v0,v1
  401700:	3043ffff 	andi	v1,v0,0xffff
  401704:	24a5ffff 	addiu	a1,a1,-1
  401708:	ac830000 	sw	v1,0(a0)
  40170c:	00024402 	srl	t0,v0,0x10
  401710:	2484fffc 	addiu	a0,a0,-4
  401714:	14a0fff6 	bnez	a1,4016f0 <__qdivrem+0x3c4>
  401718:	24c6fffc 	addiu	a2,a2,-4
  40171c:	8d240000 	lw	a0,0(t1)
  401720:	00000000 	nop
  401724:	01041021 	addu	v0,t0,a0
  401728:	3042ffff 	andi	v0,v0,0xffff
  40172c:	ad220000 	sw	v0,0(t1)
  401730:	24e7ffff 	addiu	a3,a3,-1
  401734:	25ef0001 	addiu	t7,t7,1
  401738:	026f102a 	slt	v0,s3,t7
  40173c:	ada70000 	sw	a3,0(t5)
  401740:	25290004 	addiu	t1,t1,4
  401744:	25ad0004 	addiu	t5,t5,4
  401748:	1040ffad 	beqz	v0,401600 <__qdivrem+0x2d4>
  40174c:	258c0004 	addiu	t4,t4,4
  401750:	12400022 	beqz	s2,4017dc <__qdivrem+0x4b0>
  401754:	00000000 	nop
  401758:	12a00016 	beqz	s5,4017b4 <__qdivrem+0x488>
  40175c:	02f32821 	addu	a1,s7,s3
  401760:	0265102a 	slt	v0,s3,a1
  401764:	10400011 	beqz	v0,4017ac <__qdivrem+0x480>
  401768:	00051080 	sll	v0,a1,0x2
  40176c:	00051880 	sll	v1,a1,0x2
  401770:	24020010 	li	v0,16
  401774:	00553823 	subu	a3,v0,s5
  401778:	02833021 	addu	a2,s4,v1
  40177c:	8cc2fffc 	lw	v0,-4(a2)
  401780:	8cc30000 	lw	v1,0(a2)
  401784:	00e21004 	sllv	v0,v0,a3
  401788:	02a31806 	srlv	v1,v1,s5
  40178c:	3042ffff 	andi	v0,v0,0xffff
  401790:	24a5ffff 	addiu	a1,a1,-1
  401794:	00621825 	or	v1,v1,v0
  401798:	0265202a 	slt	a0,s3,a1
  40179c:	acc30000 	sw	v1,0(a2)
  4017a0:	1480fff6 	bnez	a0,40177c <__qdivrem+0x450>
  4017a4:	24c6fffc 	addiu	a2,a2,-4
  4017a8:	00051080 	sll	v0,a1,0x2
  4017ac:	00541021 	addu	v0,v0,s4
  4017b0:	ac400000 	sw	zero,0(v0)
  4017b4:	8fa20014 	lw	v0,20(sp)
  4017b8:	8fa40018 	lw	a0,24(sp)
  4017bc:	00021400 	sll	v0,v0,0x10
  4017c0:	8fa3001c 	lw	v1,28(sp)
  4017c4:	00448025 	or	s0,v0,a0
  4017c8:	8fa20020 	lw	v0,32(sp)
  4017cc:	00031c00 	sll	v1,v1,0x10
  4017d0:	00628825 	or	s1,v1,v0
  4017d4:	ae510004 	sw	s1,4(s2)
  4017d8:	ae500000 	sw	s0,0(s2)
  4017dc:	8fa2003c 	lw	v0,60(sp)
  4017e0:	8fa40040 	lw	a0,64(sp)
  4017e4:	00021400 	sll	v0,v0,0x10
  4017e8:	8fa30044 	lw	v1,68(sp)
  4017ec:	00448025 	or	s0,v0,a0
  4017f0:	8fa20048 	lw	v0,72(sp)
  4017f4:	00031c00 	sll	v1,v1,0x10
  4017f8:	00628825 	or	s1,v1,v0
  4017fc:	02201821 	move	v1,s1
  401800:	081004e6 	j	401398 <__qdivrem+0x6c>
  401804:	02001021 	move	v0,s0
  401808:	00001821 	move	v1,zero
  40180c:	081004e6 	j	401398 <__qdivrem+0x6c>
  401810:	00001021 	move	v0,zero
  401814:	00602821 	move	a1,v1
  401818:	08100595 	j	401654 <__qdivrem+0x328>
  40181c:	3407ffff 	li	a3,0xffff
  401820:	27a20024 	addiu	v0,sp,36
  401824:	24170004 	li	s7,4
  401828:	27be0028 	addiu	s8,sp,40
  40182c:	0810054a 	j	401528 <__qdivrem+0x1fc>
  401830:	afa20050 	sw	v0,80(sp)
  401834:	24170002 	li	s7,2
  401838:	27be0030 	addiu	s8,sp,48
  40183c:	0810054a 	j	401528 <__qdivrem+0x1fc>
  401840:	afa20050 	sw	v0,80(sp)
  401844:	08100555 	j	401554 <__qdivrem+0x228>
  401848:	27b40010 	addiu	s4,sp,16
  40184c:	08100578 	j	4015e0 <__qdivrem+0x2b4>
  401850:	0000a821 	move	s5,zero
  401854:	00042880 	sll	a1,a0,0x2
  401858:	08100562 	j	401588 <__qdivrem+0x25c>
  40185c:	27a60038 	addiu	a2,sp,56
