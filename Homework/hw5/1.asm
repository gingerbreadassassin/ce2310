	.text
main:	li $t3,8
	li $t4,31
	li $t5,14
	mul $t0,$t3,$t4
	and $t1,$t4,$t5
	or $a0,$t1,$t0
	# li $a0,11
	li $v0,1
	syscall
	li $a0,0xA
	li $v0,11
	syscall
	la $a0,($t0)
	li $v0,1
	syscall
	li $a0,0xA
	li $v0,11
	syscall
	la $a0,($t1)
	li $v0,1
	syscall
	li $v0,10
	syscall