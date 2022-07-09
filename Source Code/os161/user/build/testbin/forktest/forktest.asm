
../../../build/user/testbin/forktest/forktest:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250018 	sw	a1,24(at)
  40001c:	0c100080 	jal	400200 <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c1000fd 	jal	4003f4 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c10013b 	jal	4004ec <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <dofork>:
  400050:	27bdffe8 	addiu	sp,sp,-24
  400054:	afb00010 	sw	s0,16(sp)
  400058:	afbf0014 	sw	ra,20(sp)
  40005c:	0c100135 	jal	4004d4 <fork>
  400060:	00000000 	nop
  400064:	3c040040 	lui	a0,0x40
  400068:	00408021 	move	s0,v0
  40006c:	04400006 	bltz	v0,400088 <dofork+0x38>
  400070:	24841b90 	addiu	a0,a0,7056
  400074:	02001021 	move	v0,s0
  400078:	8fbf0014 	lw	ra,20(sp)
  40007c:	8fb00010 	lw	s0,16(sp)
  400080:	03e00008 	jr	ra
  400084:	27bd0018 	addiu	sp,sp,24
  400088:	0c100263 	jal	40098c <warn>
  40008c:	00000000 	nop
  400090:	02001021 	move	v0,s0
  400094:	8fbf0014 	lw	ra,20(sp)
  400098:	8fb00010 	lw	s0,16(sp)
  40009c:	03e00008 	jr	ra
  4000a0:	27bd0018 	addiu	sp,sp,24

004000a4 <check>:
  4000a4:	27bdffd0 	addiu	sp,sp,-48
  4000a8:	afb40028 	sw	s4,40(sp)
  4000ac:	afb30024 	sw	s3,36(sp)
  4000b0:	afb20020 	sw	s2,32(sp)
  4000b4:	afb1001c 	sw	s1,28(sp)
  4000b8:	afbf002c 	sw	ra,44(sp)
  4000bc:	afb00018 	sw	s0,24(sp)
  4000c0:	0c10013f 	jal	4004fc <getpid>
  4000c4:	3c131000 	lui	s3,0x1000
  4000c8:	ae620010 	sw	v0,16(s3)
  4000cc:	00008821 	move	s1,zero
  4000d0:	3c140040 	lui	s4,0x40
  4000d4:	24120320 	li	s2,800
  4000d8:	8e620010 	lw	v0,16(s3)
  4000dc:	26310001 	addiu	s1,s1,1
  4000e0:	afa20010 	sw	v0,16(sp)
  4000e4:	0c10013f 	jal	4004fc <getpid>
  4000e8:	00000000 	nop
  4000ec:	8fa30010 	lw	v1,16(sp)
  4000f0:	00000000 	nop
  4000f4:	10430009 	beq	v0,v1,40011c <check+0x78>
  4000f8:	00000000 	nop
  4000fc:	8fb00010 	lw	s0,16(sp)
  400100:	0c10013f 	jal	4004fc <getpid>
  400104:	00000000 	nop
  400108:	00403821 	move	a3,v0
  40010c:	02003021 	move	a2,s0
  400110:	24040001 	li	a0,1
  400114:	0c10022e 	jal	4008b8 <errx>
  400118:	26851b98 	addiu	a1,s4,7064
  40011c:	1632ffee 	bne	s1,s2,4000d8 <check+0x34>
  400120:	00000000 	nop
  400124:	8fbf002c 	lw	ra,44(sp)
  400128:	8fb40028 	lw	s4,40(sp)
  40012c:	8fb30024 	lw	s3,36(sp)
  400130:	8fb20020 	lw	s2,32(sp)
  400134:	8fb1001c 	lw	s1,28(sp)
  400138:	8fb00018 	lw	s0,24(sp)
  40013c:	03e00008 	jr	ra
  400140:	27bd0030 	addiu	sp,sp,48

00400144 <dowait>:
  400144:	27bdffe0 	addiu	sp,sp,-32
  400148:	afb00018 	sw	s0,24(sp)
  40014c:	afbf001c 	sw	ra,28(sp)
  400150:	04a00005 	bltz	a1,400168 <dowait+0x24>
  400154:	00a08021 	move	s0,a1
  400158:	10a00027 	beqz	a1,4001f8 <dowait+0xb4>
  40015c:	00000000 	nop
  400160:	10800005 	beqz	a0,400178 <dowait+0x34>
  400164:	00a02021 	move	a0,a1
  400168:	8fbf001c 	lw	ra,28(sp)
  40016c:	8fb00018 	lw	s0,24(sp)
  400170:	03e00008 	jr	ra
  400174:	27bd0020 	addiu	sp,sp,32
  400178:	00003021 	move	a2,zero
  40017c:	0c10013d 	jal	4004f4 <waitpid>
  400180:	27a50010 	addiu	a1,sp,16
  400184:	04400012 	bltz	v0,4001d0 <dowait+0x8c>
  400188:	3c040040 	lui	a0,0x40
  40018c:	8fa60010 	lw	a2,16(sp)
  400190:	00000000 	nop
  400194:	30c20003 	andi	v0,a2,0x3
  400198:	2442ffff 	addiu	v0,v0,-1
  40019c:	2c420002 	sltiu	v0,v0,2
  4001a0:	1440000f 	bnez	v0,4001e0 <dowait+0x9c>
  4001a4:	3c040040 	lui	a0,0x40
  4001a8:	00063083 	sra	a2,a2,0x2
  4001ac:	10c0ffee 	beqz	a2,400168 <dowait+0x24>
  4001b0:	3c040040 	lui	a0,0x40
  4001b4:	02002821 	move	a1,s0
  4001b8:	0c100252 	jal	400948 <warnx>
  4001bc:	24841bec 	addiu	a0,a0,7148
  4001c0:	8fbf001c 	lw	ra,28(sp)
  4001c4:	8fb00018 	lw	s0,24(sp)
  4001c8:	03e00008 	jr	ra
  4001cc:	27bd0020 	addiu	sp,sp,32
  4001d0:	0c100263 	jal	40098c <warn>
  4001d4:	24841bd0 	addiu	a0,a0,7120
  4001d8:	0810005a 	j	400168 <dowait+0x24>
  4001dc:	00000000 	nop
  4001e0:	24841bd8 	addiu	a0,a0,7128
  4001e4:	02002821 	move	a1,s0
  4001e8:	0c100252 	jal	400948 <warnx>
  4001ec:	00063083 	sra	a2,a2,0x2
  4001f0:	0810005a 	j	400168 <dowait+0x24>
  4001f4:	00000000 	nop
  4001f8:	0c1000fd 	jal	4003f4 <exit>
  4001fc:	00002021 	move	a0,zero

00400200 <main>:
  400200:	27bdffd8 	addiu	sp,sp,-40
  400204:	00a03021 	move	a2,a1
  400208:	24020002 	li	v0,2
  40020c:	3c050040 	lui	a1,0x40
  400210:	afbf0024 	sw	ra,36(sp)
  400214:	afb40020 	sw	s4,32(sp)
  400218:	afb3001c 	sw	s3,28(sp)
  40021c:	afb20018 	sw	s2,24(sp)
  400220:	afb10014 	sw	s1,20(sp)
  400224:	afb00010 	sw	s0,16(sp)
  400228:	2c830002 	sltiu	v1,a0,2
  40022c:	1082000f 	beq	a0,v0,40026c <main+0x6c>
  400230:	24a51bfc 	addiu	a1,a1,7164
  400234:	14600012 	bnez	v1,400280 <main+0x80>
  400238:	0000a021 	move	s4,zero
  40023c:	3c040040 	lui	a0,0x40
  400240:	0c100252 	jal	400948 <warnx>
  400244:	24841c00 	addiu	a0,a0,7168
  400248:	8fbf0024 	lw	ra,36(sp)
  40024c:	8fb40020 	lw	s4,32(sp)
  400250:	8fb3001c 	lw	s3,28(sp)
  400254:	8fb20018 	lw	s2,24(sp)
  400258:	8fb10014 	lw	s1,20(sp)
  40025c:	8fb00010 	lw	s0,16(sp)
  400260:	24020001 	li	v0,1
  400264:	03e00008 	jr	ra
  400268:	27bd0028 	addiu	sp,sp,40
  40026c:	8cc40004 	lw	a0,4(a2)
  400270:	0c100104 	jal	400410 <strcmp>
  400274:	00000000 	nop
  400278:	1440fff0 	bnez	v0,40023c <main+0x3c>
  40027c:	24140001 	li	s4,1
  400280:	3c040040 	lui	a0,0x40
  400284:	0c100252 	jal	400948 <warnx>
  400288:	24841c18 	addiu	a0,a0,7192
  40028c:	0c100014 	jal	400050 <dofork>
  400290:	00000000 	nop
  400294:	24040030 	li	a0,48
  400298:	0c1000dc 	jal	400370 <putchar>
  40029c:	00409821 	move	s3,v0
  4002a0:	0c100029 	jal	4000a4 <check>
  4002a4:	00000000 	nop
  4002a8:	0c100014 	jal	400050 <dofork>
  4002ac:	00000000 	nop
  4002b0:	24040031 	li	a0,49
  4002b4:	0c1000dc 	jal	400370 <putchar>
  4002b8:	00409021 	move	s2,v0
  4002bc:	0c100029 	jal	4000a4 <check>
  4002c0:	00000000 	nop
  4002c4:	0c100014 	jal	400050 <dofork>
  4002c8:	00000000 	nop
  4002cc:	24040032 	li	a0,50
  4002d0:	0c1000dc 	jal	400370 <putchar>
  4002d4:	00408821 	move	s1,v0
  4002d8:	0c100029 	jal	4000a4 <check>
  4002dc:	00000000 	nop
  4002e0:	0c100014 	jal	400050 <dofork>
  4002e4:	00000000 	nop
  4002e8:	00408021 	move	s0,v0
  4002ec:	0c1000dc 	jal	400370 <putchar>
  4002f0:	24040033 	li	a0,51
  4002f4:	0c100029 	jal	4000a4 <check>
  4002f8:	00000000 	nop
  4002fc:	02802021 	move	a0,s4
  400300:	0c100051 	jal	400144 <dowait>
  400304:	02002821 	move	a1,s0
  400308:	02802021 	move	a0,s4
  40030c:	0c100051 	jal	400144 <dowait>
  400310:	02202821 	move	a1,s1
  400314:	02802021 	move	a0,s4
  400318:	0c100051 	jal	400144 <dowait>
  40031c:	02402821 	move	a1,s2
  400320:	02602821 	move	a1,s3
  400324:	0c100051 	jal	400144 <dowait>
  400328:	02802021 	move	a0,s4
  40032c:	0c1000dc 	jal	400370 <putchar>
  400330:	2404000a 	li	a0,10
  400334:	3c040040 	lui	a0,0x40
  400338:	0c100252 	jal	400948 <warnx>
  40033c:	24841c24 	addiu	a0,a0,7204
  400340:	8fbf0024 	lw	ra,36(sp)
  400344:	8fb40020 	lw	s4,32(sp)
  400348:	8fb3001c 	lw	s3,28(sp)
  40034c:	8fb20018 	lw	s2,24(sp)
  400350:	8fb10014 	lw	s1,20(sp)
  400354:	8fb00010 	lw	s0,16(sp)
  400358:	00001021 	move	v0,zero
  40035c:	03e00008 	jr	ra
  400360:	27bd0028 	addiu	sp,sp,40
	...

00400370 <putchar>:
  400370:	27bdffe0 	addiu	sp,sp,-32
  400374:	afb00018 	sw	s0,24(sp)
  400378:	27a50010 	addiu	a1,sp,16
  40037c:	00808021 	move	s0,a0
  400380:	24060001 	li	a2,1
  400384:	24040001 	li	a0,1
  400388:	afbf001c 	sw	ra,28(sp)
  40038c:	0c10017b 	jal	4005ec <write>
  400390:	a3b00010 	sb	s0,16(sp)
  400394:	18400005 	blez	v0,4003ac <putchar+0x3c>
  400398:	02001021 	move	v0,s0
  40039c:	8fbf001c 	lw	ra,28(sp)
  4003a0:	8fb00018 	lw	s0,24(sp)
  4003a4:	03e00008 	jr	ra
  4003a8:	27bd0020 	addiu	sp,sp,32
  4003ac:	2410ffff 	li	s0,-1
  4003b0:	02001021 	move	v0,s0
  4003b4:	8fbf001c 	lw	ra,28(sp)
  4003b8:	8fb00018 	lw	s0,24(sp)
  4003bc:	03e00008 	jr	ra
  4003c0:	27bd0020 	addiu	sp,sp,32
	...

004003d0 <__exit_hack>:
  4003d0:	27bdfff8 	addiu	sp,sp,-8
  4003d4:	24020001 	li	v0,1
  4003d8:	afa20000 	sw	v0,0(sp)
  4003dc:	8fa20000 	lw	v0,0(sp)
  4003e0:	00000000 	nop
  4003e4:	1440fffd 	bnez	v0,4003dc <__exit_hack+0xc>
  4003e8:	00000000 	nop
  4003ec:	03e00008 	jr	ra
  4003f0:	27bd0008 	addiu	sp,sp,8

004003f4 <exit>:
  4003f4:	27bdffe8 	addiu	sp,sp,-24
  4003f8:	afbf0010 	sw	ra,16(sp)
  4003fc:	0c10013b 	jal	4004ec <_exit>
  400400:	00000000 	nop
	...

00400410 <strcmp>:
  400410:	80860000 	lb	a2,0(a0)
  400414:	00000000 	nop
  400418:	10c00022 	beqz	a2,4004a4 <strcmp+0x94>
  40041c:	00a04021 	move	t0,a1
  400420:	80a20000 	lb	v0,0(a1)
  400424:	00000000 	nop
  400428:	14460015 	bne	v0,a2,400480 <strcmp+0x70>
  40042c:	00003821 	move	a3,zero
  400430:	08100112 	j	400448 <strcmp+0x38>
  400434:	24a20001 	addiu	v0,a1,1
  400438:	80630000 	lb	v1,0(v1)
  40043c:	00000000 	nop
  400440:	14660011 	bne	v1,a2,400488 <strcmp+0x78>
  400444:	00602821 	move	a1,v1
  400448:	24e50001 	addiu	a1,a3,1
  40044c:	00401821 	move	v1,v0
  400450:	00851021 	addu	v0,a0,a1
  400454:	80460000 	lb	a2,0(v0)
  400458:	00a03821 	move	a3,a1
  40045c:	14c0fff6 	bnez	a2,400438 <strcmp+0x28>
  400460:	24620001 	addiu	v0,v1,1
  400464:	01051021 	addu	v0,t0,a1
  400468:	80450000 	lb	a1,0(v0)
  40046c:	00000000 	nop
  400470:	00c51026 	xor	v0,a2,a1
  400474:	0002102b 	sltu	v0,zero,v0
  400478:	03e00008 	jr	ra
  40047c:	00021023 	negu	v0,v0
  400480:	00401821 	move	v1,v0
  400484:	00602821 	move	a1,v1
  400488:	30c200ff 	andi	v0,a2,0xff
  40048c:	306300ff 	andi	v1,v1,0xff
  400490:	0062102b 	sltu	v0,v1,v0
  400494:	1040fff6 	beqz	v0,400470 <strcmp+0x60>
  400498:	00000000 	nop
  40049c:	03e00008 	jr	ra
  4004a0:	24020001 	li	v0,1
  4004a4:	08100119 	j	400464 <strcmp+0x54>
  4004a8:	00002821 	move	a1,zero
  4004ac:	00000000 	nop

004004b0 <__syscall>:
  4004b0:	0000000c 	syscall
  4004b4:	10e00005 	beqz	a3,4004cc <__syscall+0x1c>
  4004b8:	00000000 	nop
  4004bc:	3c011000 	lui	at,0x1000
  4004c0:	ac220014 	sw	v0,20(at)
  4004c4:	2403ffff 	li	v1,-1
  4004c8:	2402ffff 	li	v0,-1
  4004cc:	03e00008 	jr	ra
  4004d0:	00000000 	nop

004004d4 <fork>:
  4004d4:	0810012c 	j	4004b0 <__syscall>
  4004d8:	24020000 	li	v0,0

004004dc <vfork>:
  4004dc:	0810012c 	j	4004b0 <__syscall>
  4004e0:	24020001 	li	v0,1

004004e4 <execv>:
  4004e4:	0810012c 	j	4004b0 <__syscall>
  4004e8:	24020002 	li	v0,2

004004ec <_exit>:
  4004ec:	0810012c 	j	4004b0 <__syscall>
  4004f0:	24020003 	li	v0,3

004004f4 <waitpid>:
  4004f4:	0810012c 	j	4004b0 <__syscall>
  4004f8:	24020004 	li	v0,4

004004fc <getpid>:
  4004fc:	0810012c 	j	4004b0 <__syscall>
  400500:	24020005 	li	v0,5

00400504 <getppid>:
  400504:	0810012c 	j	4004b0 <__syscall>
  400508:	24020006 	li	v0,6

0040050c <sbrk>:
  40050c:	0810012c 	j	4004b0 <__syscall>
  400510:	24020007 	li	v0,7

00400514 <mmap>:
  400514:	0810012c 	j	4004b0 <__syscall>
  400518:	24020008 	li	v0,8

0040051c <munmap>:
  40051c:	0810012c 	j	4004b0 <__syscall>
  400520:	24020009 	li	v0,9

00400524 <mprotect>:
  400524:	0810012c 	j	4004b0 <__syscall>
  400528:	2402000a 	li	v0,10

0040052c <umask>:
  40052c:	0810012c 	j	4004b0 <__syscall>
  400530:	24020011 	li	v0,17

00400534 <issetugid>:
  400534:	0810012c 	j	4004b0 <__syscall>
  400538:	24020012 	li	v0,18

0040053c <getresuid>:
  40053c:	0810012c 	j	4004b0 <__syscall>
  400540:	24020013 	li	v0,19

00400544 <setresuid>:
  400544:	0810012c 	j	4004b0 <__syscall>
  400548:	24020014 	li	v0,20

0040054c <getresgid>:
  40054c:	0810012c 	j	4004b0 <__syscall>
  400550:	24020015 	li	v0,21

00400554 <setresgid>:
  400554:	0810012c 	j	4004b0 <__syscall>
  400558:	24020016 	li	v0,22

0040055c <getgroups>:
  40055c:	0810012c 	j	4004b0 <__syscall>
  400560:	24020017 	li	v0,23

00400564 <setgroups>:
  400564:	0810012c 	j	4004b0 <__syscall>
  400568:	24020018 	li	v0,24

0040056c <__getlogin>:
  40056c:	0810012c 	j	4004b0 <__syscall>
  400570:	24020019 	li	v0,25

00400574 <__setlogin>:
  400574:	0810012c 	j	4004b0 <__syscall>
  400578:	2402001a 	li	v0,26

0040057c <kill>:
  40057c:	0810012c 	j	4004b0 <__syscall>
  400580:	2402001b 	li	v0,27

00400584 <sigaction>:
  400584:	0810012c 	j	4004b0 <__syscall>
  400588:	2402001c 	li	v0,28

0040058c <sigpending>:
  40058c:	0810012c 	j	4004b0 <__syscall>
  400590:	2402001d 	li	v0,29

00400594 <sigprocmask>:
  400594:	0810012c 	j	4004b0 <__syscall>
  400598:	2402001e 	li	v0,30

0040059c <sigsuspend>:
  40059c:	0810012c 	j	4004b0 <__syscall>
  4005a0:	2402001f 	li	v0,31

004005a4 <sigreturn>:
  4005a4:	0810012c 	j	4004b0 <__syscall>
  4005a8:	24020020 	li	v0,32

004005ac <open>:
  4005ac:	0810012c 	j	4004b0 <__syscall>
  4005b0:	2402002d 	li	v0,45

004005b4 <pipe>:
  4005b4:	0810012c 	j	4004b0 <__syscall>
  4005b8:	2402002e 	li	v0,46

004005bc <dup>:
  4005bc:	0810012c 	j	4004b0 <__syscall>
  4005c0:	2402002f 	li	v0,47

004005c4 <dup2>:
  4005c4:	0810012c 	j	4004b0 <__syscall>
  4005c8:	24020030 	li	v0,48

004005cc <close>:
  4005cc:	0810012c 	j	4004b0 <__syscall>
  4005d0:	24020031 	li	v0,49

004005d4 <read>:
  4005d4:	0810012c 	j	4004b0 <__syscall>
  4005d8:	24020032 	li	v0,50

004005dc <pread>:
  4005dc:	0810012c 	j	4004b0 <__syscall>
  4005e0:	24020033 	li	v0,51

004005e4 <getdirentry>:
  4005e4:	0810012c 	j	4004b0 <__syscall>
  4005e8:	24020036 	li	v0,54

004005ec <write>:
  4005ec:	0810012c 	j	4004b0 <__syscall>
  4005f0:	24020037 	li	v0,55

004005f4 <pwrite>:
  4005f4:	0810012c 	j	4004b0 <__syscall>
  4005f8:	24020038 	li	v0,56

004005fc <lseek>:
  4005fc:	0810012c 	j	4004b0 <__syscall>
  400600:	2402003b 	li	v0,59

00400604 <flock>:
  400604:	0810012c 	j	4004b0 <__syscall>
  400608:	2402003c 	li	v0,60

0040060c <ftruncate>:
  40060c:	0810012c 	j	4004b0 <__syscall>
  400610:	2402003d 	li	v0,61

00400614 <fsync>:
  400614:	0810012c 	j	4004b0 <__syscall>
  400618:	2402003e 	li	v0,62

0040061c <fcntl>:
  40061c:	0810012c 	j	4004b0 <__syscall>
  400620:	2402003f 	li	v0,63

00400624 <ioctl>:
  400624:	0810012c 	j	4004b0 <__syscall>
  400628:	24020040 	li	v0,64

0040062c <select>:
  40062c:	0810012c 	j	4004b0 <__syscall>
  400630:	24020041 	li	v0,65

00400634 <poll>:
  400634:	0810012c 	j	4004b0 <__syscall>
  400638:	24020042 	li	v0,66

0040063c <link>:
  40063c:	0810012c 	j	4004b0 <__syscall>
  400640:	24020043 	li	v0,67

00400644 <remove>:
  400644:	0810012c 	j	4004b0 <__syscall>
  400648:	24020044 	li	v0,68

0040064c <mkdir>:
  40064c:	0810012c 	j	4004b0 <__syscall>
  400650:	24020045 	li	v0,69

00400654 <rmdir>:
  400654:	0810012c 	j	4004b0 <__syscall>
  400658:	24020046 	li	v0,70

0040065c <mkfifo>:
  40065c:	0810012c 	j	4004b0 <__syscall>
  400660:	24020047 	li	v0,71

00400664 <rename>:
  400664:	0810012c 	j	4004b0 <__syscall>
  400668:	24020048 	li	v0,72

0040066c <access>:
  40066c:	0810012c 	j	4004b0 <__syscall>
  400670:	24020049 	li	v0,73

00400674 <chdir>:
  400674:	0810012c 	j	4004b0 <__syscall>
  400678:	2402004a 	li	v0,74

0040067c <fchdir>:
  40067c:	0810012c 	j	4004b0 <__syscall>
  400680:	2402004b 	li	v0,75

00400684 <__getcwd>:
  400684:	0810012c 	j	4004b0 <__syscall>
  400688:	2402004c 	li	v0,76

0040068c <symlink>:
  40068c:	0810012c 	j	4004b0 <__syscall>
  400690:	2402004d 	li	v0,77

00400694 <readlink>:
  400694:	0810012c 	j	4004b0 <__syscall>
  400698:	2402004e 	li	v0,78

0040069c <mount>:
  40069c:	0810012c 	j	4004b0 <__syscall>
  4006a0:	2402004f 	li	v0,79

004006a4 <unmount>:
  4006a4:	0810012c 	j	4004b0 <__syscall>
  4006a8:	24020050 	li	v0,80

004006ac <stat>:
  4006ac:	0810012c 	j	4004b0 <__syscall>
  4006b0:	24020051 	li	v0,81

004006b4 <fstat>:
  4006b4:	0810012c 	j	4004b0 <__syscall>
  4006b8:	24020052 	li	v0,82

004006bc <lstat>:
  4006bc:	0810012c 	j	4004b0 <__syscall>
  4006c0:	24020053 	li	v0,83

004006c4 <utimes>:
  4006c4:	0810012c 	j	4004b0 <__syscall>
  4006c8:	24020054 	li	v0,84

004006cc <futimes>:
  4006cc:	0810012c 	j	4004b0 <__syscall>
  4006d0:	24020055 	li	v0,85

004006d4 <lutimes>:
  4006d4:	0810012c 	j	4004b0 <__syscall>
  4006d8:	24020056 	li	v0,86

004006dc <chmod>:
  4006dc:	0810012c 	j	4004b0 <__syscall>
  4006e0:	24020057 	li	v0,87

004006e4 <chown>:
  4006e4:	0810012c 	j	4004b0 <__syscall>
  4006e8:	24020058 	li	v0,88

004006ec <fchmod>:
  4006ec:	0810012c 	j	4004b0 <__syscall>
  4006f0:	24020059 	li	v0,89

004006f4 <fchown>:
  4006f4:	0810012c 	j	4004b0 <__syscall>
  4006f8:	2402005a 	li	v0,90

004006fc <lchmod>:
  4006fc:	0810012c 	j	4004b0 <__syscall>
  400700:	2402005b 	li	v0,91

00400704 <lchown>:
  400704:	0810012c 	j	4004b0 <__syscall>
  400708:	2402005c 	li	v0,92

0040070c <socket>:
  40070c:	0810012c 	j	4004b0 <__syscall>
  400710:	24020062 	li	v0,98

00400714 <bind>:
  400714:	0810012c 	j	4004b0 <__syscall>
  400718:	24020063 	li	v0,99

0040071c <connect>:
  40071c:	0810012c 	j	4004b0 <__syscall>
  400720:	24020064 	li	v0,100

00400724 <listen>:
  400724:	0810012c 	j	4004b0 <__syscall>
  400728:	24020065 	li	v0,101

0040072c <accept>:
  40072c:	0810012c 	j	4004b0 <__syscall>
  400730:	24020066 	li	v0,102

00400734 <shutdown>:
  400734:	0810012c 	j	4004b0 <__syscall>
  400738:	24020068 	li	v0,104

0040073c <getsockname>:
  40073c:	0810012c 	j	4004b0 <__syscall>
  400740:	24020069 	li	v0,105

00400744 <getpeername>:
  400744:	0810012c 	j	4004b0 <__syscall>
  400748:	2402006a 	li	v0,106

0040074c <getsockopt>:
  40074c:	0810012c 	j	4004b0 <__syscall>
  400750:	2402006b 	li	v0,107

00400754 <setsockopt>:
  400754:	0810012c 	j	4004b0 <__syscall>
  400758:	2402006c 	li	v0,108

0040075c <__time>:
  40075c:	0810012c 	j	4004b0 <__syscall>
  400760:	24020071 	li	v0,113

00400764 <__settime>:
  400764:	0810012c 	j	4004b0 <__syscall>
  400768:	24020072 	li	v0,114

0040076c <nanosleep>:
  40076c:	0810012c 	j	4004b0 <__syscall>
  400770:	24020073 	li	v0,115

00400774 <sync>:
  400774:	0810012c 	j	4004b0 <__syscall>
  400778:	24020076 	li	v0,118

0040077c <reboot>:
  40077c:	0810012c 	j	4004b0 <__syscall>
  400780:	24020077 	li	v0,119
	...

00400790 <__senderr>:
  400790:	0810017b 	j	4005ec <write>
  400794:	24040002 	li	a0,2

00400798 <__senderrstr>:
  400798:	27bdffe8 	addiu	sp,sp,-24
  40079c:	afbf0014 	sw	ra,20(sp)
  4007a0:	afb00010 	sw	s0,16(sp)
  4007a4:	0c10049c 	jal	401270 <strlen>
  4007a8:	00808021 	move	s0,a0
  4007ac:	00403021 	move	a2,v0
  4007b0:	02002821 	move	a1,s0
  4007b4:	8fbf0014 	lw	ra,20(sp)
  4007b8:	8fb00010 	lw	s0,16(sp)
  4007bc:	00002021 	move	a0,zero
  4007c0:	081001e4 	j	400790 <__senderr>
  4007c4:	27bd0018 	addiu	sp,sp,24

004007c8 <__printerr>:
  4007c8:	27bdffd8 	addiu	sp,sp,-40
  4007cc:	afb40020 	sw	s4,32(sp)
  4007d0:	afb3001c 	sw	s3,28(sp)
  4007d4:	afb20018 	sw	s2,24(sp)
  4007d8:	afb10014 	sw	s1,20(sp)
  4007dc:	afbf0024 	sw	ra,36(sp)
  4007e0:	afb00010 	sw	s0,16(sp)
  4007e4:	3c021000 	lui	v0,0x1000
  4007e8:	00809821 	move	s3,a0
  4007ec:	8c440014 	lw	a0,20(v0)
  4007f0:	00a08821 	move	s1,a1
  4007f4:	0c100490 	jal	401240 <strerror>
  4007f8:	00c09021 	move	s2,a2
  4007fc:	0040a021 	move	s4,v0
  400800:	3c021000 	lui	v0,0x1000
  400804:	8c420018 	lw	v0,24(v0)
  400808:	00000000 	nop
  40080c:	1040001f 	beqz	v0,40088c <__printerr+0xc4>
  400810:	00000000 	nop
  400814:	8c420000 	lw	v0,0(v0)
  400818:	00000000 	nop
  40081c:	1040001b 	beqz	v0,40088c <__printerr+0xc4>
  400820:	00402021 	move	a0,v0
  400824:	0c1001e6 	jal	400798 <__senderrstr>
  400828:	3c100040 	lui	s0,0x40
  40082c:	0c1001e6 	jal	400798 <__senderrstr>
  400830:	26041c48 	addiu	a0,s0,7240
  400834:	3c040040 	lui	a0,0x40
  400838:	24840790 	addiu	a0,a0,1936
  40083c:	02203021 	move	a2,s1
  400840:	02403821 	move	a3,s2
  400844:	0c10032d 	jal	400cb4 <__vprintf>
  400848:	00002821 	move	a1,zero
  40084c:	12600005 	beqz	s3,400864 <__printerr+0x9c>
  400850:	26041c48 	addiu	a0,s0,7240
  400854:	0c1001e6 	jal	400798 <__senderrstr>
  400858:	00000000 	nop
  40085c:	0c1001e6 	jal	400798 <__senderrstr>
  400860:	02802021 	move	a0,s4
  400864:	3c040040 	lui	a0,0x40
  400868:	8fbf0024 	lw	ra,36(sp)
  40086c:	8fb40020 	lw	s4,32(sp)
  400870:	8fb3001c 	lw	s3,28(sp)
  400874:	8fb20018 	lw	s2,24(sp)
  400878:	8fb10014 	lw	s1,20(sp)
  40087c:	8fb00010 	lw	s0,16(sp)
  400880:	24841c4c 	addiu	a0,a0,7244
  400884:	081001e6 	j	400798 <__senderrstr>
  400888:	27bd0028 	addiu	sp,sp,40
  40088c:	3c020040 	lui	v0,0x40
  400890:	08100209 	j	400824 <__printerr+0x5c>
  400894:	24441c30 	addiu	a0,v0,7216

00400898 <verrx>:
  400898:	27bdffe8 	addiu	sp,sp,-24
  40089c:	afb00010 	sw	s0,16(sp)
  4008a0:	00808021 	move	s0,a0
  4008a4:	afbf0014 	sw	ra,20(sp)
  4008a8:	0c1001f2 	jal	4007c8 <__printerr>
  4008ac:	00002021 	move	a0,zero
  4008b0:	0c1000fd 	jal	4003f4 <exit>
  4008b4:	02002021 	move	a0,s0

004008b8 <errx>:
  4008b8:	27bdffe0 	addiu	sp,sp,-32
  4008bc:	27a20028 	addiu	v0,sp,40
  4008c0:	afa60028 	sw	a2,40(sp)
  4008c4:	00403021 	move	a2,v0
  4008c8:	afbf0018 	sw	ra,24(sp)
  4008cc:	afa7002c 	sw	a3,44(sp)
  4008d0:	0c100226 	jal	400898 <verrx>
  4008d4:	afa20010 	sw	v0,16(sp)
  4008d8:	8fbf0018 	lw	ra,24(sp)
  4008dc:	00000000 	nop
  4008e0:	03e00008 	jr	ra
  4008e4:	27bd0020 	addiu	sp,sp,32

004008e8 <verr>:
  4008e8:	27bdffe8 	addiu	sp,sp,-24
  4008ec:	afb00010 	sw	s0,16(sp)
  4008f0:	00808021 	move	s0,a0
  4008f4:	afbf0014 	sw	ra,20(sp)
  4008f8:	0c1001f2 	jal	4007c8 <__printerr>
  4008fc:	24040001 	li	a0,1
  400900:	0c1000fd 	jal	4003f4 <exit>
  400904:	02002021 	move	a0,s0

00400908 <err>:
  400908:	27bdffe0 	addiu	sp,sp,-32
  40090c:	27a20028 	addiu	v0,sp,40
  400910:	afa60028 	sw	a2,40(sp)
  400914:	00403021 	move	a2,v0
  400918:	afbf0018 	sw	ra,24(sp)
  40091c:	afa7002c 	sw	a3,44(sp)
  400920:	0c10023a 	jal	4008e8 <verr>
  400924:	afa20010 	sw	v0,16(sp)
  400928:	8fbf0018 	lw	ra,24(sp)
  40092c:	00000000 	nop
  400930:	03e00008 	jr	ra
  400934:	27bd0020 	addiu	sp,sp,32

00400938 <vwarnx>:
  400938:	00a03021 	move	a2,a1
  40093c:	00802821 	move	a1,a0
  400940:	081001f2 	j	4007c8 <__printerr>
  400944:	00002021 	move	a0,zero

00400948 <warnx>:
  400948:	27bdffe0 	addiu	sp,sp,-32
  40094c:	27a20024 	addiu	v0,sp,36
  400950:	afa50024 	sw	a1,36(sp)
  400954:	00402821 	move	a1,v0
  400958:	afbf0018 	sw	ra,24(sp)
  40095c:	afa60028 	sw	a2,40(sp)
  400960:	afa7002c 	sw	a3,44(sp)
  400964:	0c10024e 	jal	400938 <vwarnx>
  400968:	afa20010 	sw	v0,16(sp)
  40096c:	8fbf0018 	lw	ra,24(sp)
  400970:	00000000 	nop
  400974:	03e00008 	jr	ra
  400978:	27bd0020 	addiu	sp,sp,32

0040097c <vwarn>:
  40097c:	00a03021 	move	a2,a1
  400980:	00802821 	move	a1,a0
  400984:	081001f2 	j	4007c8 <__printerr>
  400988:	24040001 	li	a0,1

0040098c <warn>:
  40098c:	27bdffe0 	addiu	sp,sp,-32
  400990:	27a20024 	addiu	v0,sp,36
  400994:	afa50024 	sw	a1,36(sp)
  400998:	00402821 	move	a1,v0
  40099c:	afbf0018 	sw	ra,24(sp)
  4009a0:	afa60028 	sw	a2,40(sp)
  4009a4:	afa7002c 	sw	a3,44(sp)
  4009a8:	0c10025f 	jal	40097c <vwarn>
  4009ac:	afa20010 	sw	v0,16(sp)
  4009b0:	8fbf0018 	lw	ra,24(sp)
  4009b4:	00000000 	nop
  4009b8:	03e00008 	jr	ra
  4009bc:	27bd0020 	addiu	sp,sp,32

004009c0 <__pf_print>:
  4009c0:	27bdffe0 	addiu	sp,sp,-32
  4009c4:	afbf0018 	sw	ra,24(sp)
  4009c8:	afb10014 	sw	s1,20(sp)
  4009cc:	afb00010 	sw	s0,16(sp)
  4009d0:	8c830000 	lw	v1,0(a0)
  4009d4:	00808021 	move	s0,a0
  4009d8:	8c840004 	lw	a0,4(a0)
  4009dc:	0060f809 	jalr	v1
  4009e0:	00c08821 	move	s1,a2
  4009e4:	8e02000c 	lw	v0,12(s0)
  4009e8:	00000000 	nop
  4009ec:	00511021 	addu	v0,v0,s1
  4009f0:	ae02000c 	sw	v0,12(s0)
  4009f4:	8fbf0018 	lw	ra,24(sp)
  4009f8:	8fb10014 	lw	s1,20(sp)
  4009fc:	8fb00010 	lw	s0,16(sp)
  400a00:	03e00008 	jr	ra
  400a04:	27bd0020 	addiu	sp,sp,32

00400a08 <__pf_endfield>:
  400a08:	24020020 	li	v0,32
  400a0c:	ac82002c 	sw	v0,44(a0)
  400a10:	00001821 	move	v1,zero
  400a14:	00001021 	move	v0,zero
  400a18:	ac800038 	sw	zero,56(a0)
  400a1c:	ac800010 	sw	zero,16(a0)
  400a20:	ac800014 	sw	zero,20(a0)
  400a24:	ac83001c 	sw	v1,28(a0)
  400a28:	ac820018 	sw	v0,24(a0)
  400a2c:	ac800020 	sw	zero,32(a0)
  400a30:	ac800024 	sw	zero,36(a0)
  400a34:	ac800028 	sw	zero,40(a0)
  400a38:	ac800030 	sw	zero,48(a0)
  400a3c:	03e00008 	jr	ra
  400a40:	ac800034 	sw	zero,52(a0)

00400a44 <__pf_fill>:
  400a44:	27bdffd0 	addiu	sp,sp,-48
  400a48:	afb30024 	sw	s3,36(sp)
  400a4c:	afb20020 	sw	s2,32(sp)
  400a50:	afbf0028 	sw	ra,40(sp)
  400a54:	afb1001c 	sw	s1,28(sp)
  400a58:	afb00018 	sw	s0,24(sp)
  400a5c:	00809821 	move	s3,a0
  400a60:	8c82002c 	lw	v0,44(a0)
  400a64:	18a0000b 	blez	a1,400a94 <__pf_fill+0x50>
  400a68:	00a09021 	move	s2,a1
  400a6c:	a3a20010 	sb	v0,16(sp)
  400a70:	00008021 	move	s0,zero
  400a74:	27b10010 	addiu	s1,sp,16
  400a78:	26100001 	addiu	s0,s0,1
  400a7c:	02602021 	move	a0,s3
  400a80:	02202821 	move	a1,s1
  400a84:	0c100270 	jal	4009c0 <__pf_print>
  400a88:	24060001 	li	a2,1
  400a8c:	1650fffb 	bne	s2,s0,400a7c <__pf_fill+0x38>
  400a90:	26100001 	addiu	s0,s0,1
  400a94:	8fbf0028 	lw	ra,40(sp)
  400a98:	8fb30024 	lw	s3,36(sp)
  400a9c:	8fb20020 	lw	s2,32(sp)
  400aa0:	8fb1001c 	lw	s1,28(sp)
  400aa4:	8fb00018 	lw	s0,24(sp)
  400aa8:	03e00008 	jr	ra
  400aac:	27bd0030 	addiu	sp,sp,48

00400ab0 <__pf_printstuff>:
  400ab0:	27bdffd0 	addiu	sp,sp,-48
  400ab4:	afbf0028 	sw	ra,40(sp)
  400ab8:	afb50024 	sw	s5,36(sp)
  400abc:	afb40020 	sw	s4,32(sp)
  400ac0:	afb3001c 	sw	s3,28(sp)
  400ac4:	afb20018 	sw	s2,24(sp)
  400ac8:	00c09821 	move	s3,a2
  400acc:	afb10014 	sw	s1,20(sp)
  400ad0:	afb00010 	sw	s0,16(sp)
  400ad4:	00808821 	move	s1,a0
  400ad8:	00a02021 	move	a0,a1
  400adc:	00a0a021 	move	s4,a1
  400ae0:	0c10049c 	jal	401270 <strlen>
  400ae4:	00e0a821 	move	s5,a3
  400ae8:	02602021 	move	a0,s3
  400aec:	0c10049c 	jal	401270 <strlen>
  400af0:	00409021 	move	s2,v0
  400af4:	02a02021 	move	a0,s5
  400af8:	0c10049c 	jal	401270 <strlen>
  400afc:	02428021 	addu	s0,s2,v0
  400b00:	8e230024 	lw	v1,36(s1)
  400b04:	02022821 	addu	a1,s0,v0
  400b08:	00a3102a 	slt	v0,a1,v1
  400b0c:	10400040 	beqz	v0,400c10 <__pf_printstuff+0x160>
  400b10:	00658023 	subu	s0,v1,a1
  400b14:	1a000056 	blez	s0,400c70 <__pf_printstuff+0x1c0>
  400b18:	02403021 	move	a2,s2
  400b1c:	8e220028 	lw	v0,40(s1)
  400b20:	00000000 	nop
  400b24:	10400028 	beqz	v0,400bc8 <__pf_printstuff+0x118>
  400b28:	24020030 	li	v0,48
  400b2c:	0c10049c 	jal	401270 <strlen>
  400b30:	02802021 	move	a0,s4
  400b34:	00403021 	move	a2,v0
  400b38:	02802821 	move	a1,s4
  400b3c:	0c100270 	jal	4009c0 <__pf_print>
  400b40:	02202021 	move	a0,s1
  400b44:	0c10049c 	jal	401270 <strlen>
  400b48:	02602021 	move	a0,s3
  400b4c:	00403021 	move	a2,v0
  400b50:	02202021 	move	a0,s1
  400b54:	0c100270 	jal	4009c0 <__pf_print>
  400b58:	02602821 	move	a1,s3
  400b5c:	8e220028 	lw	v0,40(s1)
  400b60:	00000000 	nop
  400b64:	14400005 	bnez	v0,400b7c <__pf_printstuff+0xcc>
  400b68:	24020030 	li	v0,48
  400b6c:	8e23002c 	lw	v1,44(s1)
  400b70:	00000000 	nop
  400b74:	1062004b 	beq	v1,v0,400ca4 <__pf_printstuff+0x1f4>
  400b78:	02202021 	move	a0,s1
  400b7c:	0c10049c 	jal	401270 <strlen>
  400b80:	02a02021 	move	a0,s5
  400b84:	00403021 	move	a2,v0
  400b88:	02202021 	move	a0,s1
  400b8c:	0c100270 	jal	4009c0 <__pf_print>
  400b90:	02a02821 	move	a1,s5
  400b94:	8e220028 	lw	v0,40(s1)
  400b98:	00000000 	nop
  400b9c:	14400012 	bnez	v0,400be8 <__pf_printstuff+0x138>
  400ba0:	02202021 	move	a0,s1
  400ba4:	8fbf0028 	lw	ra,40(sp)
  400ba8:	8fb50024 	lw	s5,36(sp)
  400bac:	8fb40020 	lw	s4,32(sp)
  400bb0:	8fb3001c 	lw	s3,28(sp)
  400bb4:	8fb20018 	lw	s2,24(sp)
  400bb8:	8fb10014 	lw	s1,20(sp)
  400bbc:	8fb00010 	lw	s0,16(sp)
  400bc0:	03e00008 	jr	ra
  400bc4:	27bd0030 	addiu	sp,sp,48
  400bc8:	8e23002c 	lw	v1,44(s1)
  400bcc:	00000000 	nop
  400bd0:	1062ffd6 	beq	v1,v0,400b2c <__pf_printstuff+0x7c>
  400bd4:	02202021 	move	a0,s1
  400bd8:	0c100291 	jal	400a44 <__pf_fill>
  400bdc:	02002821 	move	a1,s0
  400be0:	081002cb 	j	400b2c <__pf_printstuff+0x7c>
  400be4:	00000000 	nop
  400be8:	02002821 	move	a1,s0
  400bec:	8fbf0028 	lw	ra,40(sp)
  400bf0:	8fb50024 	lw	s5,36(sp)
  400bf4:	8fb40020 	lw	s4,32(sp)
  400bf8:	8fb3001c 	lw	s3,28(sp)
  400bfc:	8fb20018 	lw	s2,24(sp)
  400c00:	8fb10014 	lw	s1,20(sp)
  400c04:	8fb00010 	lw	s0,16(sp)
  400c08:	08100291 	j	400a44 <__pf_fill>
  400c0c:	27bd0030 	addiu	sp,sp,48
  400c10:	02802821 	move	a1,s4
  400c14:	02403021 	move	a2,s2
  400c18:	0c100270 	jal	4009c0 <__pf_print>
  400c1c:	02202021 	move	a0,s1
  400c20:	0c10049c 	jal	401270 <strlen>
  400c24:	02602021 	move	a0,s3
  400c28:	00403021 	move	a2,v0
  400c2c:	02202021 	move	a0,s1
  400c30:	0c100270 	jal	4009c0 <__pf_print>
  400c34:	02602821 	move	a1,s3
  400c38:	0c10049c 	jal	401270 <strlen>
  400c3c:	02a02021 	move	a0,s5
  400c40:	02202021 	move	a0,s1
  400c44:	02a02821 	move	a1,s5
  400c48:	8fbf0028 	lw	ra,40(sp)
  400c4c:	8fb50024 	lw	s5,36(sp)
  400c50:	8fb40020 	lw	s4,32(sp)
  400c54:	8fb3001c 	lw	s3,28(sp)
  400c58:	8fb20018 	lw	s2,24(sp)
  400c5c:	8fb10014 	lw	s1,20(sp)
  400c60:	8fb00010 	lw	s0,16(sp)
  400c64:	00403021 	move	a2,v0
  400c68:	08100270 	j	4009c0 <__pf_print>
  400c6c:	27bd0030 	addiu	sp,sp,48
  400c70:	02802821 	move	a1,s4
  400c74:	0c100270 	jal	4009c0 <__pf_print>
  400c78:	02202021 	move	a0,s1
  400c7c:	0c10049c 	jal	401270 <strlen>
  400c80:	02602021 	move	a0,s3
  400c84:	00403021 	move	a2,v0
  400c88:	02202021 	move	a0,s1
  400c8c:	0c100270 	jal	4009c0 <__pf_print>
  400c90:	02602821 	move	a1,s3
  400c94:	0c10049c 	jal	401270 <strlen>
  400c98:	02a02021 	move	a0,s5
  400c9c:	08100311 	j	400c44 <__pf_printstuff+0x194>
  400ca0:	02202021 	move	a0,s1
  400ca4:	0c100291 	jal	400a44 <__pf_fill>
  400ca8:	02002821 	move	a1,s0
  400cac:	081002df 	j	400b7c <__pf_printstuff+0xcc>
  400cb0:	00000000 	nop

00400cb4 <__vprintf>:
  400cb4:	27bdff68 	addiu	sp,sp,-152
  400cb8:	afbe0090 	sw	s8,144(sp)
  400cbc:	27be0030 	addiu	s8,sp,48
  400cc0:	afb10074 	sw	s1,116(sp)
  400cc4:	afa40030 	sw	a0,48(sp)
  400cc8:	00c08821 	move	s1,a2
  400ccc:	03c02021 	move	a0,s8
  400cd0:	afb00070 	sw	s0,112(sp)
  400cd4:	afbf0094 	sw	ra,148(sp)
  400cd8:	afb7008c 	sw	s7,140(sp)
  400cdc:	afb60088 	sw	s6,136(sp)
  400ce0:	afb50084 	sw	s5,132(sp)
  400ce4:	afb40080 	sw	s4,128(sp)
  400ce8:	afb3007c 	sw	s3,124(sp)
  400cec:	afb20078 	sw	s2,120(sp)
  400cf0:	afa50034 	sw	a1,52(sp)
  400cf4:	afa70038 	sw	a3,56(sp)
  400cf8:	0c100282 	jal	400a08 <__pf_endfield>
  400cfc:	afa0003c 	sw	zero,60(sp)
  400d00:	82300000 	lb	s0,0(s1)
  400d04:	00000000 	nop
  400d08:	12000017 	beqz	s0,400d68 <__vprintf+0xb4>
  400d0c:	0220a021 	move	s4,s1
  400d10:	0810034e 	j	400d38 <__vprintf+0x84>
  400d14:	00000000 	nop
  400d18:	27a50010 	addiu	a1,sp,16
  400d1c:	24060001 	li	a2,1
  400d20:	0c100270 	jal	4009c0 <__pf_print>
  400d24:	a3b00010 	sb	s0,16(sp)
  400d28:	82900001 	lb	s0,1(s4)
  400d2c:	00000000 	nop
  400d30:	1200000d 	beqz	s0,400d68 <__vprintf+0xb4>
  400d34:	26940001 	addiu	s4,s4,1
  400d38:	8fa20040 	lw	v0,64(sp)
  400d3c:	00000000 	nop
  400d40:	14400016 	bnez	v0,400d9c <__vprintf+0xe8>
  400d44:	24020025 	li	v0,37
  400d48:	1602fff3 	bne	s0,v0,400d18 <__vprintf+0x64>
  400d4c:	03c02021 	move	a0,s8
  400d50:	24020001 	li	v0,1
  400d54:	afa20040 	sw	v0,64(sp)
  400d58:	82900001 	lb	s0,1(s4)
  400d5c:	00000000 	nop
  400d60:	1600fff5 	bnez	s0,400d38 <__vprintf+0x84>
  400d64:	26940001 	addiu	s4,s4,1
  400d68:	8fa2003c 	lw	v0,60(sp)
  400d6c:	8fbf0094 	lw	ra,148(sp)
  400d70:	8fbe0090 	lw	s8,144(sp)
  400d74:	8fb7008c 	lw	s7,140(sp)
  400d78:	8fb60088 	lw	s6,136(sp)
  400d7c:	8fb50084 	lw	s5,132(sp)
  400d80:	8fb40080 	lw	s4,128(sp)
  400d84:	8fb3007c 	lw	s3,124(sp)
  400d88:	8fb20078 	lw	s2,120(sp)
  400d8c:	8fb10074 	lw	s1,116(sp)
  400d90:	8fb00070 	lw	s0,112(sp)
  400d94:	03e00008 	jr	ra
  400d98:	27bd0098 	addiu	sp,sp,152
  400d9c:	3c040040 	lui	a0,0x40
  400da0:	24841c5c 	addiu	a0,a0,7260
  400da4:	0c100478 	jal	4011e0 <strchr>
  400da8:	02002821 	move	a1,s0
  400dac:	10400031 	beqz	v0,400e74 <__vprintf+0x1c0>
  400db0:	24020030 	li	v0,48
  400db4:	1202001d 	beq	s0,v0,400e2c <__vprintf+0x178>
  400db8:	2a020031 	slti	v0,s0,49
  400dbc:	10400013 	beqz	v0,400e0c <__vprintf+0x158>
  400dc0:	2402006c 	li	v0,108
  400dc4:	24020023 	li	v0,35
  400dc8:	12020027 	beq	s0,v0,400e68 <__vprintf+0x1b4>
  400dcc:	2402002d 	li	v0,45
  400dd0:	1202004a 	beq	s0,v0,400efc <__vprintf+0x248>
  400dd4:	24020001 	li	v0,1
  400dd8:	2602ffcf 	addiu	v0,s0,-49
  400ddc:	2c420009 	sltiu	v0,v0,9
  400de0:	1040001a 	beqz	v0,400e4c <__vprintf+0x198>
  400de4:	3c040040 	lui	a0,0x40
  400de8:	8fa20054 	lw	v0,84(sp)
  400dec:	00000000 	nop
  400df0:	000218c0 	sll	v1,v0,0x3
  400df4:	00021040 	sll	v0,v0,0x1
  400df8:	00431021 	addu	v0,v0,v1
  400dfc:	02021021 	addu	v0,s0,v0
  400e00:	2442ffd0 	addiu	v0,v0,-48
  400e04:	0810034a 	j	400d28 <__vprintf+0x74>
  400e08:	afa20054 	sw	v0,84(sp)
  400e0c:	1602fff3 	bne	s0,v0,400ddc <__vprintf+0x128>
  400e10:	2602ffcf 	addiu	v0,s0,-49
  400e14:	8fa20044 	lw	v0,68(sp)
  400e18:	24030001 	li	v1,1
  400e1c:	10430039 	beq	v0,v1,400f04 <__vprintf+0x250>
  400e20:	24020002 	li	v0,2
  400e24:	0810034a 	j	400d28 <__vprintf+0x74>
  400e28:	afa30044 	sw	v1,68(sp)
  400e2c:	8fa20054 	lw	v0,84(sp)
  400e30:	00000000 	nop
  400e34:	1840008c 	blez	v0,401068 <__vprintf+0x3b4>
  400e38:	000218c0 	sll	v1,v0,0x3
  400e3c:	00021040 	sll	v0,v0,0x1
  400e40:	00431021 	addu	v0,v0,v1
  400e44:	0810034a 	j	400d28 <__vprintf+0x74>
  400e48:	afa20054 	sw	v0,84(sp)
  400e4c:	3c060040 	lui	a2,0x40
  400e50:	24841c6c 	addiu	a0,a0,7276
  400e54:	24c61c94 	addiu	a2,a2,7316
  400e58:	0c1004c0 	jal	401300 <__bad_assert>
  400e5c:	240500dc 	li	a1,220
  400e60:	0810037a 	j	400de8 <__vprintf+0x134>
  400e64:	00000000 	nop
  400e68:	24020001 	li	v0,1
  400e6c:	0810034a 	j	400d28 <__vprintf+0x74>
  400e70:	afa20068 	sw	v0,104(sp)
  400e74:	3c040040 	lui	a0,0x40
  400e78:	24841ca8 	addiu	a0,a0,7336
  400e7c:	0c100478 	jal	4011e0 <strchr>
  400e80:	02002821 	move	a1,s0
  400e84:	10400091 	beqz	v0,4010cc <__vprintf+0x418>
  400e88:	24020070 	li	v0,112
  400e8c:	1202001f 	beq	s0,v0,400f0c <__vprintf+0x258>
  400e90:	24020064 	li	v0,100
  400e94:	1202009e 	beq	s0,v0,401110 <__vprintf+0x45c>
  400e98:	24020001 	li	v0,1
  400e9c:	8fa30044 	lw	v1,68(sp)
  400ea0:	00000000 	nop
  400ea4:	10620003 	beq	v1,v0,400eb4 <__vprintf+0x200>
  400ea8:	00000000 	nop
  400eac:	14600074 	bnez	v1,401080 <__vprintf+0x3cc>
  400eb0:	24020002 	li	v0,2
  400eb4:	8fa20038 	lw	v0,56(sp)
  400eb8:	afa00048 	sw	zero,72(sp)
  400ebc:	8c430000 	lw	v1,0(v0)
  400ec0:	24420004 	addiu	v0,v0,4
  400ec4:	afa20038 	sw	v0,56(sp)
  400ec8:	afa3004c 	sw	v1,76(sp)
  400ecc:	2602ff9c 	addiu	v0,s0,-100
  400ed0:	304200ff 	andi	v0,v0,0xff
  400ed4:	2c430015 	sltiu	v1,v0,21
  400ed8:	10600015 	beqz	v1,400f30 <__vprintf+0x27c>
  400edc:	3c030040 	lui	v1,0x40
  400ee0:	00021080 	sll	v0,v0,0x2
  400ee4:	24631a20 	addiu	v1,v1,6688
  400ee8:	00431021 	addu	v0,v0,v1
  400eec:	8c440000 	lw	a0,0(v0)
  400ef0:	00000000 	nop
  400ef4:	00800008 	jr	a0
  400ef8:	00000000 	nop
  400efc:	0810034a 	j	400d28 <__vprintf+0x74>
  400f00:	afa20058 	sw	v0,88(sp)
  400f04:	0810034a 	j	400d28 <__vprintf+0x74>
  400f08:	afa20044 	sw	v0,68(sp)
  400f0c:	8fa20038 	lw	v0,56(sp)
  400f10:	afa00048 	sw	zero,72(sp)
  400f14:	24430004 	addiu	v1,v0,4
  400f18:	afa30038 	sw	v1,56(sp)
  400f1c:	8c440000 	lw	a0,0(v0)
  400f20:	00000000 	nop
  400f24:	afa4004c 	sw	a0,76(sp)
  400f28:	24020010 	li	v0,16
  400f2c:	afa20060 	sw	v0,96(sp)
  400f30:	8fa20068 	lw	v0,104(sp)
  400f34:	00000000 	nop
  400f38:	1440004d 	bnez	v0,401070 <__vprintf+0x3bc>
  400f3c:	24020001 	li	v0,1
  400f40:	24020070 	li	v0,112
  400f44:	1202004a 	beq	s0,v0,401070 <__vprintf+0x3bc>
  400f48:	24020001 	li	v0,1
  400f4c:	8fb60060 	lw	s6,96(sp)
  400f50:	3c020040 	lui	v0,0x40
  400f54:	8fb1004c 	lw	s1,76(sp)
  400f58:	8fb00048 	lw	s0,72(sp)
  400f5c:	a3a00029 	sb	zero,41(sp)
  400f60:	24571cb0 	addiu	s7,v0,7344
  400f64:	27b50028 	addiu	s5,sp,40
  400f68:	02c09821 	move	s3,s6
  400f6c:	001697c3 	sra	s2,s6,0x1f
  400f70:	02202821 	move	a1,s1
  400f74:	02002021 	move	a0,s0
  400f78:	02603821 	move	a3,s3
  400f7c:	0c1004b4 	jal	4012d0 <__umoddi3>
  400f80:	02403021 	move	a2,s2
  400f84:	02e31821 	addu	v1,s7,v1
  400f88:	90620000 	lbu	v0,0(v1)
  400f8c:	02202821 	move	a1,s1
  400f90:	02002021 	move	a0,s0
  400f94:	02603821 	move	a3,s3
  400f98:	02403021 	move	a2,s2
  400f9c:	0c1004ac 	jal	4012b0 <__udivdi3>
  400fa0:	a2a20000 	sb	v0,0(s5)
  400fa4:	00408021 	move	s0,v0
  400fa8:	02031025 	or	v0,s0,v1
  400fac:	00608821 	move	s1,v1
  400fb0:	1440ffef 	bnez	v0,400f70 <__vprintf+0x2bc>
  400fb4:	26b5ffff 	addiu	s5,s5,-1
  400fb8:	8fa20064 	lw	v0,100(sp)
  400fbc:	00000000 	nop
  400fc0:	10400006 	beqz	v0,400fdc <__vprintf+0x328>
  400fc4:	3c020040 	lui	v0,0x40
  400fc8:	24020010 	li	v0,16
  400fcc:	12c2005e 	beq	s6,v0,401148 <__vprintf+0x494>
  400fd0:	24020008 	li	v0,8
  400fd4:	12c20037 	beq	s6,v0,4010b4 <__vprintf+0x400>
  400fd8:	3c020040 	lui	v0,0x40
  400fdc:	24461bcc 	addiu	a2,v0,7116
  400fe0:	8fa20050 	lw	v0,80(sp)
  400fe4:	00000000 	nop
  400fe8:	10400023 	beqz	v0,401078 <__vprintf+0x3c4>
  400fec:	3c020040 	lui	v0,0x40
  400ff0:	3c020040 	lui	v0,0x40
  400ff4:	24451c50 	addiu	a1,v0,7248
  400ff8:	03c02021 	move	a0,s8
  400ffc:	0c1002ac 	jal	400ab0 <__pf_printstuff>
  401000:	26a70001 	addiu	a3,s5,1
  401004:	0c100282 	jal	400a08 <__pf_endfield>
  401008:	03c02021 	move	a0,s8
  40100c:	0810034a 	j	400d28 <__vprintf+0x74>
  401010:	00000000 	nop
  401014:	8fa20038 	lw	v0,56(sp)
  401018:	2403fff8 	li	v1,-8
  40101c:	24420007 	addiu	v0,v0,7
  401020:	00431024 	and	v0,v0,v1
  401024:	8c470004 	lw	a3,4(v0)
  401028:	8c460000 	lw	a2,0(v0)
  40102c:	24420008 	addiu	v0,v0,8
  401030:	afa20038 	sw	v0,56(sp)
  401034:	04c10040 	bgez	a2,401138 <__vprintf+0x484>
  401038:	2402000a 	li	v0,10
  40103c:	00071823 	negu	v1,a3
  401040:	0003282b 	sltu	a1,zero,v1
  401044:	00061023 	negu	v0,a2
  401048:	00451023 	subu	v0,v0,a1
  40104c:	2404ffff 	li	a0,-1
  401050:	afa40050 	sw	a0,80(sp)
  401054:	afa3004c 	sw	v1,76(sp)
  401058:	afa20048 	sw	v0,72(sp)
  40105c:	2402000a 	li	v0,10
  401060:	081003cc 	j	400f30 <__vprintf+0x27c>
  401064:	afa20060 	sw	v0,96(sp)
  401068:	0810034a 	j	400d28 <__vprintf+0x74>
  40106c:	afb0005c 	sw	s0,92(sp)
  401070:	081003d3 	j	400f4c <__vprintf+0x298>
  401074:	afa20064 	sw	v0,100(sp)
  401078:	081003fe 	j	400ff8 <__vprintf+0x344>
  40107c:	24451bcc 	addiu	a1,v0,7116
  401080:	1462ff93 	bne	v1,v0,400ed0 <__vprintf+0x21c>
  401084:	2602ff9c 	addiu	v0,s0,-100
  401088:	8fa20038 	lw	v0,56(sp)
  40108c:	2403fff8 	li	v1,-8
  401090:	24420007 	addiu	v0,v0,7
  401094:	00431024 	and	v0,v0,v1
  401098:	8c450004 	lw	a1,4(v0)
  40109c:	8c440000 	lw	a0,0(v0)
  4010a0:	24420008 	addiu	v0,v0,8
  4010a4:	afa20038 	sw	v0,56(sp)
  4010a8:	afa5004c 	sw	a1,76(sp)
  4010ac:	081003b3 	j	400ecc <__vprintf+0x218>
  4010b0:	afa40048 	sw	a0,72(sp)
  4010b4:	3c020040 	lui	v0,0x40
  4010b8:	081003f8 	j	400fe0 <__vprintf+0x32c>
  4010bc:	24461cc8 	addiu	a2,v0,7368
  4010c0:	24020008 	li	v0,8
  4010c4:	081003cc 	j	400f30 <__vprintf+0x27c>
  4010c8:	afa20060 	sw	v0,96(sp)
  4010cc:	24020073 	li	v0,115
  4010d0:	12020028 	beq	s0,v0,401174 <__vprintf+0x4c0>
  4010d4:	24020063 	li	v0,99
  4010d8:	12020037 	beq	s0,v0,4011b8 <__vprintf+0x504>
  4010dc:	00000000 	nop
  4010e0:	a3b00011 	sb	s0,17(sp)
  4010e4:	3c050040 	lui	a1,0x40
  4010e8:	24a51bcc 	addiu	a1,a1,7116
  4010ec:	03c02021 	move	a0,s8
  4010f0:	00a03021 	move	a2,a1
  4010f4:	27a70011 	addiu	a3,sp,17
  4010f8:	0c1002ac 	jal	400ab0 <__pf_printstuff>
  4010fc:	a3a00012 	sb	zero,18(sp)
  401100:	0c100282 	jal	400a08 <__pf_endfield>
  401104:	03c02021 	move	a0,s8
  401108:	0810034a 	j	400d28 <__vprintf+0x74>
  40110c:	00000000 	nop
  401110:	8fa30044 	lw	v1,68(sp)
  401114:	00000000 	nop
  401118:	1062000e 	beq	v1,v0,401154 <__vprintf+0x4a0>
  40111c:	00000000 	nop
  401120:	1060000c 	beqz	v1,401154 <__vprintf+0x4a0>
  401124:	24020002 	li	v0,2
  401128:	1062ffba 	beq	v1,v0,401014 <__vprintf+0x360>
  40112c:	00003821 	move	a3,zero
  401130:	00003021 	move	a2,zero
  401134:	2402000a 	li	v0,10
  401138:	afa7004c 	sw	a3,76(sp)
  40113c:	afa60048 	sw	a2,72(sp)
  401140:	081003cc 	j	400f30 <__vprintf+0x27c>
  401144:	afa20060 	sw	v0,96(sp)
  401148:	3c020040 	lui	v0,0x40
  40114c:	081003f8 	j	400fe0 <__vprintf+0x32c>
  401150:	24461cc4 	addiu	a2,v0,7364
  401154:	8fa20038 	lw	v0,56(sp)
  401158:	00000000 	nop
  40115c:	8c430000 	lw	v1,0(v0)
  401160:	24420004 	addiu	v0,v0,4
  401164:	00603821 	move	a3,v1
  401168:	000337c3 	sra	a2,v1,0x1f
  40116c:	0810040d 	j	401034 <__vprintf+0x380>
  401170:	afa20038 	sw	v0,56(sp)
  401174:	8fa30038 	lw	v1,56(sp)
  401178:	00000000 	nop
  40117c:	8c670000 	lw	a3,0(v1)
  401180:	00000000 	nop
  401184:	10e00013 	beqz	a3,4011d4 <__vprintf+0x520>
  401188:	3c020040 	lui	v0,0x40
  40118c:	3c050040 	lui	a1,0x40
  401190:	24a51bcc 	addiu	a1,a1,7116
  401194:	24620004 	addiu	v0,v1,4
  401198:	03c02021 	move	a0,s8
  40119c:	00a03021 	move	a2,a1
  4011a0:	0c1002ac 	jal	400ab0 <__pf_printstuff>
  4011a4:	afa20038 	sw	v0,56(sp)
  4011a8:	0c100282 	jal	400a08 <__pf_endfield>
  4011ac:	03c02021 	move	a0,s8
  4011b0:	0810034a 	j	400d28 <__vprintf+0x74>
  4011b4:	00000000 	nop
  4011b8:	8fa20038 	lw	v0,56(sp)
  4011bc:	00000000 	nop
  4011c0:	8c430000 	lw	v1,0(v0)
  4011c4:	24420004 	addiu	v0,v0,4
  4011c8:	afa20038 	sw	v0,56(sp)
  4011cc:	08100439 	j	4010e4 <__vprintf+0x430>
  4011d0:	a3a30011 	sb	v1,17(sp)
  4011d4:	08100463 	j	40118c <__vprintf+0x4d8>
  4011d8:	24471c54 	addiu	a3,v0,7252
  4011dc:	00000000 	nop

004011e0 <strchr>:
  4011e0:	80830000 	lb	v1,0(a0)
  4011e4:	00052e00 	sll	a1,a1,0x18
  4011e8:	00801021 	move	v0,a0
  4011ec:	1060000c 	beqz	v1,401220 <strchr+0x40>
  4011f0:	00052e03 	sra	a1,a1,0x18
  4011f4:	14a30006 	bne	a1,v1,401210 <strchr+0x30>
  4011f8:	24420001 	addiu	v0,v0,1
  4011fc:	03e00008 	jr	ra
  401200:	2442ffff 	addiu	v0,v0,-1
  401204:	10a3000c 	beq	a1,v1,401238 <strchr+0x58>
  401208:	00000000 	nop
  40120c:	24420001 	addiu	v0,v0,1
  401210:	80430000 	lb	v1,0(v0)
  401214:	00000000 	nop
  401218:	1460fffa 	bnez	v1,401204 <strchr+0x24>
  40121c:	00000000 	nop
  401220:	14a00003 	bnez	a1,401230 <strchr+0x50>
  401224:	00000000 	nop
  401228:	03e00008 	jr	ra
  40122c:	00000000 	nop
  401230:	03e00008 	jr	ra
  401234:	00001021 	move	v0,zero
  401238:	03e00008 	jr	ra
  40123c:	00000000 	nop

00401240 <strerror>:
  401240:	3c020040 	lui	v0,0x40
  401244:	00042880 	sll	a1,a0,0x2
  401248:	24421a80 	addiu	v0,v0,6784
  40124c:	3c030040 	lui	v1,0x40
  401250:	2c840041 	sltiu	a0,a0,65
  401254:	00a22821 	addu	a1,a1,v0
  401258:	10800002 	beqz	a0,401264 <strerror+0x24>
  40125c:	24621ccc 	addiu	v0,v1,7372
  401260:	8ca20000 	lw	v0,0(a1)
  401264:	03e00008 	jr	ra
  401268:	00000000 	nop
  40126c:	00000000 	nop

00401270 <strlen>:
  401270:	80820000 	lb	v0,0(a0)
  401274:	00000000 	nop
  401278:	1040000a 	beqz	v0,4012a4 <strlen+0x34>
  40127c:	00002821 	move	a1,zero
  401280:	24a50001 	addiu	a1,a1,1
  401284:	00851021 	addu	v0,a0,a1
  401288:	80430000 	lb	v1,0(v0)
  40128c:	00000000 	nop
  401290:	1460fffc 	bnez	v1,401284 <strlen+0x14>
  401294:	24a50001 	addiu	a1,a1,1
  401298:	24a5ffff 	addiu	a1,a1,-1
  40129c:	03e00008 	jr	ra
  4012a0:	00a01021 	move	v0,a1
  4012a4:	03e00008 	jr	ra
  4012a8:	00a01021 	move	v0,a1
  4012ac:	00000000 	nop

004012b0 <__udivdi3>:
  4012b0:	27bdffe0 	addiu	sp,sp,-32
  4012b4:	afbf0018 	sw	ra,24(sp)
  4012b8:	0c10053b 	jal	4014ec <__qdivrem>
  4012bc:	afa00010 	sw	zero,16(sp)
  4012c0:	8fbf0018 	lw	ra,24(sp)
  4012c4:	00000000 	nop
  4012c8:	03e00008 	jr	ra
  4012cc:	27bd0020 	addiu	sp,sp,32

004012d0 <__umoddi3>:
  4012d0:	27bdffd8 	addiu	sp,sp,-40
  4012d4:	27a20018 	addiu	v0,sp,24
  4012d8:	afbf0020 	sw	ra,32(sp)
  4012dc:	0c10053b 	jal	4014ec <__qdivrem>
  4012e0:	afa20010 	sw	v0,16(sp)
  4012e4:	8fa3001c 	lw	v1,28(sp)
  4012e8:	8fa20018 	lw	v0,24(sp)
  4012ec:	8fbf0020 	lw	ra,32(sp)
  4012f0:	00000000 	nop
  4012f4:	03e00008 	jr	ra
  4012f8:	27bd0028 	addiu	sp,sp,40
  4012fc:	00000000 	nop

00401300 <__bad_assert>:
  401300:	27bdfee0 	addiu	sp,sp,-288
  401304:	00c03821 	move	a3,a2
  401308:	afb00118 	sw	s0,280(sp)
  40130c:	3c060040 	lui	a2,0x40
  401310:	27b00018 	addiu	s0,sp,24
  401314:	24c622d0 	addiu	a2,a2,8912
  401318:	afa40010 	sw	a0,16(sp)
  40131c:	afa50014 	sw	a1,20(sp)
  401320:	02002021 	move	a0,s0
  401324:	afbf011c 	sw	ra,284(sp)
  401328:	0c10050c 	jal	401430 <snprintf>
  40132c:	24050100 	li	a1,256
  401330:	0c10049c 	jal	401270 <strlen>
  401334:	02002021 	move	a0,s0
  401338:	00403021 	move	a2,v0
  40133c:	02002821 	move	a1,s0
  401340:	0c10017b 	jal	4005ec <write>
  401344:	24040002 	li	a0,2
  401348:	0c100518 	jal	401460 <abort>
  40134c:	00000000 	nop

00401350 <__snprintf_send>:
  401350:	10c00012 	beqz	a2,40139c <__snprintf_send+0x4c>
  401354:	00004021 	move	t0,zero
  401358:	8c870008 	lw	a3,8(a0)
  40135c:	8c820004 	lw	v0,4(a0)
  401360:	00a81821 	addu	v1,a1,t0
  401364:	00e2102b 	sltu	v0,a3,v0
  401368:	1040000a 	beqz	v0,401394 <__snprintf_send+0x44>
  40136c:	25080001 	addiu	t0,t0,1
  401370:	8c820000 	lw	v0,0(a0)
  401374:	90630000 	lbu	v1,0(v1)
  401378:	00471021 	addu	v0,v0,a3
  40137c:	a0430000 	sb	v1,0(v0)
  401380:	8c870008 	lw	a3,8(a0)
  401384:	00000000 	nop
  401388:	24e20001 	addiu	v0,a3,1
  40138c:	00403821 	move	a3,v0
  401390:	ac820008 	sw	v0,8(a0)
  401394:	14c8fff1 	bne	a2,t0,40135c <__snprintf_send+0xc>
  401398:	00000000 	nop
  40139c:	03e00008 	jr	ra
  4013a0:	00000000 	nop

004013a4 <vsnprintf>:
  4013a4:	27bdffd8 	addiu	sp,sp,-40
  4013a8:	afb00020 	sw	s0,32(sp)
  4013ac:	00a01021 	move	v0,a1
  4013b0:	00808021 	move	s0,a0
  4013b4:	3c040040 	lui	a0,0x40
  4013b8:	24a3ffff 	addiu	v1,a1,-1
  4013bc:	afbf0024 	sw	ra,36(sp)
  4013c0:	24841350 	addiu	a0,a0,4944
  4013c4:	27a50010 	addiu	a1,sp,16
  4013c8:	1440000c 	bnez	v0,4013fc <vsnprintf+0x58>
  4013cc:	afb00010 	sw	s0,16(sp)
  4013d0:	3c040040 	lui	a0,0x40
  4013d4:	24841350 	addiu	a0,a0,4944
  4013d8:	afa00014 	sw	zero,20(sp)
  4013dc:	0c10032d 	jal	400cb4 <__vprintf>
  4013e0:	afa00018 	sw	zero,24(sp)
  4013e4:	00401821 	move	v1,v0
  4013e8:	8fbf0024 	lw	ra,36(sp)
  4013ec:	8fb00020 	lw	s0,32(sp)
  4013f0:	00601021 	move	v0,v1
  4013f4:	03e00008 	jr	ra
  4013f8:	27bd0028 	addiu	sp,sp,40
  4013fc:	afa30014 	sw	v1,20(sp)
  401400:	0c10032d 	jal	400cb4 <__vprintf>
  401404:	afa00018 	sw	zero,24(sp)
  401408:	00401821 	move	v1,v0
  40140c:	8fa20018 	lw	v0,24(sp)
  401410:	00000000 	nop
  401414:	02021021 	addu	v0,s0,v0
  401418:	a0400000 	sb	zero,0(v0)
  40141c:	8fbf0024 	lw	ra,36(sp)
  401420:	8fb00020 	lw	s0,32(sp)
  401424:	00601021 	move	v0,v1
  401428:	03e00008 	jr	ra
  40142c:	27bd0028 	addiu	sp,sp,40

00401430 <snprintf>:
  401430:	27bdffe0 	addiu	sp,sp,-32
  401434:	27a2002c 	addiu	v0,sp,44
  401438:	afa7002c 	sw	a3,44(sp)
  40143c:	00403821 	move	a3,v0
  401440:	afbf0018 	sw	ra,24(sp)
  401444:	0c1004e9 	jal	4013a4 <vsnprintf>
  401448:	afa20010 	sw	v0,16(sp)
  40144c:	8fbf0018 	lw	ra,24(sp)
  401450:	00000000 	nop
  401454:	03e00008 	jr	ra
  401458:	27bd0020 	addiu	sp,sp,32
  40145c:	00000000 	nop

00401460 <abort>:
  401460:	27bdffe8 	addiu	sp,sp,-24
  401464:	afbf0010 	sw	ra,16(sp)
  401468:	0c10013b 	jal	4004ec <_exit>
  40146c:	240400ff 	li	a0,255

00401470 <shl>:
  401470:	18a00016 	blez	a1,4014cc <shl+0x5c>
  401474:	24020010 	li	v0,16
  401478:	00464823 	subu	t1,v0,a2
  40147c:	00803821 	move	a3,a0
  401480:	00004021 	move	t0,zero
  401484:	8ce20000 	lw	v0,0(a3)
  401488:	8ce30004 	lw	v1,4(a3)
  40148c:	00c21004 	sllv	v0,v0,a2
  401490:	3042ffff 	andi	v0,v0,0xffff
  401494:	01231806 	srlv	v1,v1,t1
  401498:	00431025 	or	v0,v0,v1
  40149c:	25080001 	addiu	t0,t0,1
  4014a0:	ace20000 	sw	v0,0(a3)
  4014a4:	14a8fff7 	bne	a1,t0,401484 <shl+0x14>
  4014a8:	24e70004 	addiu	a3,a3,4
  4014ac:	00051880 	sll	v1,a1,0x2
  4014b0:	00831821 	addu	v1,a0,v1
  4014b4:	8c620000 	lw	v0,0(v1)
  4014b8:	00000000 	nop
  4014bc:	00c21004 	sllv	v0,v0,a2
  4014c0:	3042ffff 	andi	v0,v0,0xffff
  4014c4:	03e00008 	jr	ra
  4014c8:	ac620000 	sw	v0,0(v1)
  4014cc:	00001821 	move	v1,zero
  4014d0:	00831821 	addu	v1,a0,v1
  4014d4:	8c620000 	lw	v0,0(v1)
  4014d8:	00000000 	nop
  4014dc:	00c21004 	sllv	v0,v0,a2
  4014e0:	3042ffff 	andi	v0,v0,0xffff
  4014e4:	03e00008 	jr	ra
  4014e8:	ac620000 	sw	v0,0(v1)

004014ec <__qdivrem>:
  4014ec:	27bdff80 	addiu	sp,sp,-128
  4014f0:	00c71025 	or	v0,a2,a3
  4014f4:	afb20060 	sw	s2,96(sp)
  4014f8:	afbf007c 	sw	ra,124(sp)
  4014fc:	afbe0078 	sw	s8,120(sp)
  401500:	afb70074 	sw	s7,116(sp)
  401504:	afb60070 	sw	s6,112(sp)
  401508:	afb5006c 	sw	s5,108(sp)
  40150c:	afb40068 	sw	s4,104(sp)
  401510:	afb30064 	sw	s3,100(sp)
  401514:	afb1005c 	sw	s1,92(sp)
  401518:	afb00058 	sw	s0,88(sp)
  40151c:	00a04821 	move	t1,a1
  401520:	8fb20090 	lw	s2,144(sp)
  401524:	14400018 	bnez	v0,401588 <__qdivrem+0x9c>
  401528:	00804021 	move	t0,a0
  40152c:	3c031000 	lui	v1,0x1000
  401530:	8c640000 	lw	a0,0(v1)
  401534:	24020001 	li	v0,1
  401538:	14800002 	bnez	a0,401544 <__qdivrem+0x58>
  40153c:	0044001b 	divu	zero,v0,a0
  401540:	0007000d 	break	0x7
  401544:	00001012 	mflo	v0
  401548:	12400003 	beqz	s2,401558 <__qdivrem+0x6c>
  40154c:	00401821 	move	v1,v0
  401550:	ae450004 	sw	a1,4(s2)
  401554:	ae480000 	sw	t0,0(s2)
  401558:	8fbf007c 	lw	ra,124(sp)
  40155c:	8fbe0078 	lw	s8,120(sp)
  401560:	8fb70074 	lw	s7,116(sp)
  401564:	8fb60070 	lw	s6,112(sp)
  401568:	8fb5006c 	lw	s5,108(sp)
  40156c:	8fb40068 	lw	s4,104(sp)
  401570:	8fb30064 	lw	s3,100(sp)
  401574:	8fb20060 	lw	s2,96(sp)
  401578:	8fb1005c 	lw	s1,92(sp)
  40157c:	8fb00058 	lw	s0,88(sp)
  401580:	03e00008 	jr	ra
  401584:	27bd0080 	addiu	sp,sp,128
  401588:	0086102b 	sltu	v0,a0,a2
  40158c:	10400008 	beqz	v0,4015b0 <__qdivrem+0xc4>
  401590:	00000000 	nop
  401594:	1240010c 	beqz	s2,4019c8 <__qdivrem+0x4dc>
  401598:	00000000 	nop
  40159c:	00001821 	move	v1,zero
  4015a0:	00001021 	move	v0,zero
  4015a4:	ae490004 	sw	t1,4(s2)
  4015a8:	08100556 	j	401558 <__qdivrem+0x6c>
  4015ac:	ae480000 	sw	t0,0(s2)
  4015b0:	10860046 	beq	a0,a2,4016cc <__qdivrem+0x1e0>
  4015b4:	00a7102b 	sltu	v0,a1,a3
  4015b8:	00e08821 	move	s1,a3
  4015bc:	01001821 	move	v1,t0
  4015c0:	00c08021 	move	s0,a2
  4015c4:	30c7ffff 	andi	a3,a2,0xffff
  4015c8:	3108ffff 	andi	t0,t0,0xffff
  4015cc:	312affff 	andi	t2,t1,0xffff
  4015d0:	3226ffff 	andi	a2,s1,0xffff
  4015d4:	00031c02 	srl	v1,v1,0x10
  4015d8:	00092c02 	srl	a1,t1,0x10
  4015dc:	00101402 	srl	v0,s0,0x10
  4015e0:	00112402 	srl	a0,s1,0x10
  4015e4:	afa00010 	sw	zero,16(sp)
  4015e8:	afa30014 	sw	v1,20(sp)
  4015ec:	afa80018 	sw	t0,24(sp)
  4015f0:	afa5001c 	sw	a1,28(sp)
  4015f4:	afaa0020 	sw	t2,32(sp)
  4015f8:	afa20028 	sw	v0,40(sp)
  4015fc:	afa7002c 	sw	a3,44(sp)
  401600:	afa40030 	sw	a0,48(sp)
  401604:	144000f6 	bnez	v0,4019e0 <__qdivrem+0x4f4>
  401608:	afa60034 	sw	a2,52(sp)
  40160c:	14e00033 	bnez	a3,4016dc <__qdivrem+0x1f0>
  401610:	27a20028 	addiu	v0,sp,40
  401614:	148000f7 	bnez	a0,4019f4 <__qdivrem+0x508>
  401618:	27a2002c 	addiu	v0,sp,44
  40161c:	14c00002 	bnez	a2,401628 <__qdivrem+0x13c>
  401620:	0066001b 	divu	zero,v1,a2
  401624:	0007000d 	break	0x7
  401628:	00001010 	mfhi	v0
  40162c:	00021400 	sll	v0,v0,0x10
  401630:	00481025 	or	v0,v0,t0
  401634:	00004812 	mflo	t1
	...
  401640:	14c00002 	bnez	a2,40164c <__qdivrem+0x160>
  401644:	0046001b 	divu	zero,v0,a2
  401648:	0007000d 	break	0x7
  40164c:	00001810 	mfhi	v1
  401650:	00031c00 	sll	v1,v1,0x10
  401654:	00651825 	or	v1,v1,a1
  401658:	00003812 	mflo	a3
	...
  401664:	14c00002 	bnez	a2,401670 <__qdivrem+0x184>
  401668:	0066001b 	divu	zero,v1,a2
  40166c:	0007000d 	break	0x7
  401670:	00001010 	mfhi	v0
  401674:	00021400 	sll	v0,v0,0x10
  401678:	00001812 	mflo	v1
  40167c:	12400008 	beqz	s2,4016a0 <__qdivrem+0x1b4>
  401680:	01422025 	or	a0,t2,v0
  401684:	14c00002 	bnez	a2,401690 <__qdivrem+0x1a4>
  401688:	0086001b 	divu	zero,a0,a2
  40168c:	0007000d 	break	0x7
  401690:	ae400000 	sw	zero,0(s2)
  401694:	00001010 	mfhi	v0
  401698:	ae420004 	sw	v0,4(s2)
  40169c:	00000000 	nop
  4016a0:	14c00002 	bnez	a2,4016ac <__qdivrem+0x1c0>
  4016a4:	0086001b 	divu	zero,a0,a2
  4016a8:	0007000d 	break	0x7
  4016ac:	00091400 	sll	v0,t1,0x10
  4016b0:	00031c00 	sll	v1,v1,0x10
  4016b4:	00e28025 	or	s0,a3,v0
  4016b8:	02001021 	move	v0,s0
  4016bc:	00002012 	mflo	a0
  4016c0:	00838825 	or	s1,a0,v1
  4016c4:	08100556 	j	401558 <__qdivrem+0x6c>
  4016c8:	02201821 	move	v1,s1
  4016cc:	1040ffbb 	beqz	v0,4015bc <__qdivrem+0xd0>
  4016d0:	00e08821 	move	s1,a3
  4016d4:	08100565 	j	401594 <__qdivrem+0xa8>
  4016d8:	00000000 	nop
  4016dc:	afa20050 	sw	v0,80(sp)
  4016e0:	24170003 	li	s7,3
  4016e4:	27be002c 	addiu	s8,sp,44
  4016e8:	8fa30014 	lw	v1,20(sp)
  4016ec:	24020004 	li	v0,4
  4016f0:	146000c4 	bnez	v1,401a04 <__qdivrem+0x518>
  4016f4:	00579823 	subu	s3,v0,s7
  4016f8:	081005c1 	j	401704 <__qdivrem+0x218>
  4016fc:	27b40014 	addiu	s4,sp,20
  401700:	0060a021 	move	s4,v1
  401704:	8e820004 	lw	v0,4(s4)
  401708:	2673ffff 	addiu	s3,s3,-1
  40170c:	1040fffc 	beqz	v0,401700 <__qdivrem+0x214>
  401710:	26830004 	addiu	v1,s4,4
  401714:	24020004 	li	v0,4
  401718:	00532023 	subu	a0,v0,s3
  40171c:	2483ffff 	addiu	v1,a0,-1
  401720:	046000bc 	bltz	v1,401a14 <__qdivrem+0x528>
  401724:	00001821 	move	v1,zero
  401728:	27a60038 	addiu	a2,sp,56
  40172c:	00042880 	sll	a1,a0,0x2
  401730:	00c51021 	addu	v0,a2,a1
  401734:	2442fffc 	addiu	v0,v0,-4
  401738:	24630001 	addiu	v1,v1,1
  40173c:	ac400000 	sw	zero,0(v0)
  401740:	1464fffd 	bne	v1,a0,401738 <__qdivrem+0x24c>
  401744:	2442fffc 	addiu	v0,v0,-4
  401748:	8fcb0000 	lw	t3,0(s8)
  40174c:	34028000 	li	v0,0x8000
  401750:	0162102b 	sltu	v0,t3,v0
  401754:	00c5b021 	addu	s6,a2,a1
  401758:	104000ac 	beqz	v0,401a0c <__qdivrem+0x520>
  40175c:	01601821 	move	v1,t3
  401760:	0000a821 	move	s5,zero
  401764:	34048000 	li	a0,0x8000
  401768:	00031840 	sll	v1,v1,0x1
  40176c:	0064102b 	sltu	v0,v1,a0
  401770:	1440fffd 	bnez	v0,401768 <__qdivrem+0x27c>
  401774:	26b50001 	addiu	s5,s5,1
  401778:	1aa00009 	blez	s5,4017a0 <__qdivrem+0x2b4>
  40177c:	02f32821 	addu	a1,s7,s3
  401780:	02a03021 	move	a2,s5
  401784:	0c10051c 	jal	401470 <shl>
  401788:	02802021 	move	a0,s4
  40178c:	03c02021 	move	a0,s8
  401790:	26e5ffff 	addiu	a1,s7,-1
  401794:	0c10051c 	jal	401470 <shl>
  401798:	02a03021 	move	a2,s5
  40179c:	8fcb0000 	lw	t3,0(s8)
  4017a0:	8fa20050 	lw	v0,80(sp)
  4017a4:	00177080 	sll	t6,s7,0x2
  4017a8:	8c580008 	lw	t8,8(v0)
  4017ac:	02c06821 	move	t5,s6
  4017b0:	02804821 	move	t1,s4
  4017b4:	028e6021 	addu	t4,s4,t6
  4017b8:	00007821 	move	t7,zero
  4017bc:	3416ffff 	li	s6,0xffff
  4017c0:	8d240000 	lw	a0,0(t1)
  4017c4:	8d230004 	lw	v1,4(t1)
  4017c8:	8d260008 	lw	a2,8(t1)
  4017cc:	11640081 	beq	t3,a0,4019d4 <__qdivrem+0x4e8>
  4017d0:	00041400 	sll	v0,a0,0x10
  4017d4:	00621025 	or	v0,v1,v0
  4017d8:	15600002 	bnez	t3,4017e4 <__qdivrem+0x2f8>
  4017dc:	004b001b 	divu	zero,v0,t3
  4017e0:	0007000d 	break	0x7
  4017e4:	00002810 	mfhi	a1
  4017e8:	00003812 	mflo	a3
	...
  4017f4:	00f80018 	mult	a3,t8
  4017f8:	00051400 	sll	v0,a1,0x10
  4017fc:	00c21025 	or	v0,a2,v0
  401800:	00001812 	mflo	v1
  401804:	0043182b 	sltu	v1,v0,v1
  401808:	10600006 	beqz	v1,401824 <__qdivrem+0x338>
  40180c:	00000000 	nop
  401810:	24e7ffff 	addiu	a3,a3,-1
  401814:	00ab2821 	addu	a1,a1,t3
  401818:	02c5102b 	sltu	v0,s6,a1
  40181c:	1040fff6 	beqz	v0,4017f8 <__qdivrem+0x30c>
  401820:	00f80018 	mult	a3,t8
  401824:	1ae00017 	blez	s7,401884 <__qdivrem+0x398>
  401828:	00004021 	move	t0,zero
  40182c:	8fa20050 	lw	v0,80(sp)
  401830:	01802021 	move	a0,t4
  401834:	004e3021 	addu	a2,v0,t6
  401838:	02e02821 	move	a1,s7
  40183c:	3c0a0001 	lui	t2,0x1
  401840:	8cc20000 	lw	v0,0(a2)
  401844:	8c830000 	lw	v1,0(a0)
  401848:	00e20018 	mult	a3,v0
  40184c:	24a5ffff 	addiu	a1,a1,-1
  401850:	24c6fffc 	addiu	a2,a2,-4
  401854:	00001012 	mflo	v0
  401858:	00621823 	subu	v1,v1,v0
  40185c:	00681823 	subu	v1,v1,t0
  401860:	00031402 	srl	v0,v1,0x10
  401864:	01421023 	subu	v0,t2,v0
  401868:	3063ffff 	andi	v1,v1,0xffff
  40186c:	ac830000 	sw	v1,0(a0)
  401870:	3048ffff 	andi	t0,v0,0xffff
  401874:	14a0fff2 	bnez	a1,401840 <__qdivrem+0x354>
  401878:	2484fffc 	addiu	a0,a0,-4
  40187c:	8d240000 	lw	a0,0(t1)
  401880:	00000000 	nop
  401884:	00881023 	subu	v0,a0,t0
  401888:	3044ffff 	andi	a0,v0,0xffff
  40188c:	00021c02 	srl	v1,v0,0x10
  401890:	10600018 	beqz	v1,4018f4 <__qdivrem+0x408>
  401894:	ad240000 	sw	a0,0(t1)
  401898:	1ae00012 	blez	s7,4018e4 <__qdivrem+0x3f8>
  40189c:	00004021 	move	t0,zero
  4018a0:	8fa20050 	lw	v0,80(sp)
  4018a4:	01802021 	move	a0,t4
  4018a8:	004e3021 	addu	a2,v0,t6
  4018ac:	02e02821 	move	a1,s7
  4018b0:	8c820000 	lw	v0,0(a0)
  4018b4:	8cc30000 	lw	v1,0(a2)
  4018b8:	01021021 	addu	v0,t0,v0
  4018bc:	00431021 	addu	v0,v0,v1
  4018c0:	3043ffff 	andi	v1,v0,0xffff
  4018c4:	24a5ffff 	addiu	a1,a1,-1
  4018c8:	ac830000 	sw	v1,0(a0)
  4018cc:	00024402 	srl	t0,v0,0x10
  4018d0:	2484fffc 	addiu	a0,a0,-4
  4018d4:	14a0fff6 	bnez	a1,4018b0 <__qdivrem+0x3c4>
  4018d8:	24c6fffc 	addiu	a2,a2,-4
  4018dc:	8d240000 	lw	a0,0(t1)
  4018e0:	00000000 	nop
  4018e4:	01041021 	addu	v0,t0,a0
  4018e8:	3042ffff 	andi	v0,v0,0xffff
  4018ec:	ad220000 	sw	v0,0(t1)
  4018f0:	24e7ffff 	addiu	a3,a3,-1
  4018f4:	25ef0001 	addiu	t7,t7,1
  4018f8:	026f102a 	slt	v0,s3,t7
  4018fc:	ada70000 	sw	a3,0(t5)
  401900:	25290004 	addiu	t1,t1,4
  401904:	25ad0004 	addiu	t5,t5,4
  401908:	1040ffad 	beqz	v0,4017c0 <__qdivrem+0x2d4>
  40190c:	258c0004 	addiu	t4,t4,4
  401910:	12400022 	beqz	s2,40199c <__qdivrem+0x4b0>
  401914:	00000000 	nop
  401918:	12a00016 	beqz	s5,401974 <__qdivrem+0x488>
  40191c:	02f32821 	addu	a1,s7,s3
  401920:	0265102a 	slt	v0,s3,a1
  401924:	10400011 	beqz	v0,40196c <__qdivrem+0x480>
  401928:	00051080 	sll	v0,a1,0x2
  40192c:	00051880 	sll	v1,a1,0x2
  401930:	24020010 	li	v0,16
  401934:	00553823 	subu	a3,v0,s5
  401938:	02833021 	addu	a2,s4,v1
  40193c:	8cc2fffc 	lw	v0,-4(a2)
  401940:	8cc30000 	lw	v1,0(a2)
  401944:	00e21004 	sllv	v0,v0,a3
  401948:	02a31806 	srlv	v1,v1,s5
  40194c:	3042ffff 	andi	v0,v0,0xffff
  401950:	24a5ffff 	addiu	a1,a1,-1
  401954:	00621825 	or	v1,v1,v0
  401958:	0265202a 	slt	a0,s3,a1
  40195c:	acc30000 	sw	v1,0(a2)
  401960:	1480fff6 	bnez	a0,40193c <__qdivrem+0x450>
  401964:	24c6fffc 	addiu	a2,a2,-4
  401968:	00051080 	sll	v0,a1,0x2
  40196c:	00541021 	addu	v0,v0,s4
  401970:	ac400000 	sw	zero,0(v0)
  401974:	8fa20014 	lw	v0,20(sp)
  401978:	8fa40018 	lw	a0,24(sp)
  40197c:	00021400 	sll	v0,v0,0x10
  401980:	8fa3001c 	lw	v1,28(sp)
  401984:	00448025 	or	s0,v0,a0
  401988:	8fa20020 	lw	v0,32(sp)
  40198c:	00031c00 	sll	v1,v1,0x10
  401990:	00628825 	or	s1,v1,v0
  401994:	ae510004 	sw	s1,4(s2)
  401998:	ae500000 	sw	s0,0(s2)
  40199c:	8fa2003c 	lw	v0,60(sp)
  4019a0:	8fa40040 	lw	a0,64(sp)
  4019a4:	00021400 	sll	v0,v0,0x10
  4019a8:	8fa30044 	lw	v1,68(sp)
  4019ac:	00448025 	or	s0,v0,a0
  4019b0:	8fa20048 	lw	v0,72(sp)
  4019b4:	00031c00 	sll	v1,v1,0x10
  4019b8:	00628825 	or	s1,v1,v0
  4019bc:	02201821 	move	v1,s1
  4019c0:	08100556 	j	401558 <__qdivrem+0x6c>
  4019c4:	02001021 	move	v0,s0
  4019c8:	00001821 	move	v1,zero
  4019cc:	08100556 	j	401558 <__qdivrem+0x6c>
  4019d0:	00001021 	move	v0,zero
  4019d4:	00602821 	move	a1,v1
  4019d8:	08100605 	j	401814 <__qdivrem+0x328>
  4019dc:	3407ffff 	li	a3,0xffff
  4019e0:	27a20024 	addiu	v0,sp,36
  4019e4:	24170004 	li	s7,4
  4019e8:	27be0028 	addiu	s8,sp,40
  4019ec:	081005ba 	j	4016e8 <__qdivrem+0x1fc>
  4019f0:	afa20050 	sw	v0,80(sp)
  4019f4:	24170002 	li	s7,2
  4019f8:	27be0030 	addiu	s8,sp,48
  4019fc:	081005ba 	j	4016e8 <__qdivrem+0x1fc>
  401a00:	afa20050 	sw	v0,80(sp)
  401a04:	081005c5 	j	401714 <__qdivrem+0x228>
  401a08:	27b40010 	addiu	s4,sp,16
  401a0c:	081005e8 	j	4017a0 <__qdivrem+0x2b4>
  401a10:	0000a821 	move	s5,zero
  401a14:	00042880 	sll	a1,a0,0x2
  401a18:	081005d2 	j	401748 <__qdivrem+0x25c>
  401a1c:	27a60038 	addiu	a2,sp,56
