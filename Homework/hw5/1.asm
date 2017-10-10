	.text
main:	li $t3,8	# load 8 into $t3
	li $t4,31	# load 31 into $t4
	li $t5,14	# load 14 into $t5
	# multiply $t3 * $t4, store in $t0
	mul $t0,$t3,$t4
	# and $t4 + $t5, store in $t1
	and $t1,$t4,$t5
	# or $t1 with $t0, store in $a0
	or $a0,$t1,$t0
	# print contents of $a0 as integer
	li $v0,1
	syscall
	# print newline
	li $a0,0xA # 0xA is CR/LF
	li $v0,11  # 11 prints single char
	syscall
	# load contents of $t0 into $a0
	la $a0,($t0)
	# print as integer
	li $v0,1
	syscall
	# newline
	li $a0,0xA
	li $v0,11
	syscall
	# load contents of $t1 into $a0
	la $a0,($t1)
	# print as integer
	li $v0,1
	syscall
	# exit program
	li $v0,10
	syscall
