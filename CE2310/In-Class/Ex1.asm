	.text
main:	li $t0,47
	li $t1,253
	li $t2,23
	mul $t0,$t0,$t0
	mul $t1,$t1,3
	mul $t2,$t2,10
	add $t3,$t0,$t1
	add $t3,$t3,$t2
	li $v0,10
	syscall