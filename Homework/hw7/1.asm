	.text
main:	la $t0,num1	# pointer to first word
	la $t7,num1	# again
comp: 	lw $t1,0($t0)	# load word at address
	lw $t2,4($t0)	# load next word
	beqz $t2,print	# if word = 0, we're done
	ble $t1,$t2,count # #'s in order, skip
	jal rev		# #'s not in order, swap
	j comp		# 
count: 	addi $t0,$t0,4	# increment pointer
	j comp		# compare next two #'s
	
rev: 	sub $sp,$sp,4 	# decrement stack pointer
	sw $ra,($sp) 	# store ra on stack
	sw $t1,4($t0) 	# switch words
	sw $t2,0($t0)
	beq $t0,$t7,goback # if at first word, skip
	sub $t0,$t0,4	# decrement pointer
	lw $t1,0($t0)	# load word 1
	lw $t2,4($t0)	# load word 2
	ble $t1,$t2,goback # if in order, skip
	jal rev		# not in order, swap
goback:	addi $t0,$t0,4	# increment pointer
	lw $ra,($sp)	# load from stack
	addi $sp,$sp,4	# increment stack pointer
	jr $ra		# jump to ra

print:	li $t0,0	# $t0 is offset
ploop:	li $v0,1	# print integer
	lw $a0,num1($t0)# load word at offset addr
	beqz $a0,done	# if word is 0, done
	syscall
	addi $t0,$t0,4	# increment pointer
	jal pnl		# print newline
	j ploop		# print next number

pnl:	li $a0,0xA	# load newline char
	li $v0,11	# print char
	syscall
	jr $ra		# return to caller

done:	li $v0,10	# end program
	syscall

	.data
num1: 	.word 53875
num2: 	.word 36429
num3: 	.word 88641
num4: 	.word 95437
num5:	.word 25153
num6:	.word 42398
num7:	.word 0
