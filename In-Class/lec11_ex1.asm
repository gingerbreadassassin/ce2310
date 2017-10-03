	.text
main:	li $t0,23
	li $t1,37
	add $t2,$t0,$t1
	mul $t3,$t2,$t0
	sub $t4,$t3,$t1
	and $t5,$t4,$t0
	or $t6,$t3,$t5
	move $t7,$t6
	li $v0,10
	syscall