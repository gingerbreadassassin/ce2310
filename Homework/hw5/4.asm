	.data
data1:	.word 0x63f2e3
data2:	.word 0x9100ab72

	.text
main:	# load data1 into $t0
	lw $t0,data1
	# if $t0 is >= 0
	# go to next and
	# store the current 
	# program counter
	# into return address
	# (A.K.A. "link")
	bgezal $t0,next
	# load data2 into $t0
	lw $t0,data2
	# do the same as above
	bgezal $t0,next
	# quit the program
	li $v0,10
	syscall
	
	
next:	# load contents of $t0
	# into $a0
	la $a0,($t0)
	# print contents of $a0
	# as integer
	li $v0,1
	syscall
	# jump to return address
	jr $ra