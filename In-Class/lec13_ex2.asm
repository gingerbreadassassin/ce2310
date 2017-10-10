	.text
main:	li $t0,23
	li $t1,67
	li $t2,45
	bge $t0,$t1,nxt
	move $t0,$t1
	
nxt:	bge $t0,$t2,prt
	move $t0,$t2

prt:	la $a0,($t0)
	li $v0,1
	syscall
	li $v0,10
	syscall