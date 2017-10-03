	.text
main:	li $t0,47
	li $t1,253
	li $t2,23
	mul $t0,$t0,$t0	# square 47 (x^2)
	mul $t1,$t1,3	# multiply 3y (3*253)
	mul $t2,$t2,10	# multiply 10z
	add $t3,$t0,$t1	# compute (x^2) + 3y
	add $t3,$t3,$t2	# compute (x^2) + 3y + 10z
	li $v0,10
	syscall
