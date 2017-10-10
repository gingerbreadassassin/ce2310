	.data
str:	.asciiz "Hello, world!"
rept:	.asciiz "The total count of the letter l is "

	.text
main:	la $t0,str		# address of the H, first letter in the string,
				# the address of "str"
				
loop:	lb $t1,0($t0)		# we start the loop by loading the first letter.
	beqz $t1,over		# Since the loop is null-terminated (.asciiZ), we
				# put in a test for null (0). When we find a null
				# we know we are at the end of the loop, so we 
				# exit
	beq $t1,0x6c,cnt	# if the character is an l, go to count
incr:	addi $t0,$t0,1		# add 1 to current byte address
	j loop			# get next byte to compare
cnt:	addi $t2,$t2,1		# add one to count of letter l's in phrase
	j incr			# go back into loop
over:	la $a0,rept
	li $v0,4
	syscall
	move $a0,$t2
	li $v0,1
	syscall
	li $v0,10
	syscall