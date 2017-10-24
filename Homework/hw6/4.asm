	.text
main:	la $t0,v
	lw $t1,v
	li $t3,5

load:	subi $t3,$t3,1
	beqz $t3,close
	addi $t0,$t0,4
	lw $t2,($t0)
	bgt $t2,$t1,load
	move $t1,$t2
	j load
	
close:	la $a0,ldr
	li $v0,4
	syscall
	la $a0,($t1)
	li $v0,34
	syscall
	li $v0,10
	syscall
	
	.data
v:	.word 0x6966abce
w:	.word 0x89c7d12e
x:	.word 0x7ff9348c
y:	.word 0x445e279a
z:	.word 0x123ac45d
ldr:	.asciiz "The smallest number = "
