	.text 
main:	li $t4,25
	li $t7,126
	add $t3,$t4,$t7
	and $s2,$t3,$t4
	mul $t9,$s2,$t7
	move $s5,$t9
	move $s7,$t9
	li $v0,10
	syscall