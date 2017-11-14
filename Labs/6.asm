# Connor Ness and Steven Paisley
# CE2310
# Lab 6

	.text
# initialize counter to 0 and print instructions to user
main:	li $t0,0
	j prtmsg

# take input from keyboard
read:	beq $t0,30,done		# if 30 characters have been added, finish program
	li $v0,12		# capture character input
	syscall
	beq $v0,0x50,prt	# if P, print current string
	bgt $v0,0x7A,prtmsg	# if not lowercase letter, print instructions
	blt $v0,0x61,prtmsg
	addi $t0,$t0,1		# increment character counter
	li $t1,0		# initialize pointer offset to 0
ins:	lb $t2,str($t1)		# load byte from string and offset
	bgt $v0,$t2,cnt		# if input > byte, look at next byte
	jal trikld		# otherwise, shift chars down
	sb $v0,str($t1)		# store input in string
	j prtmsg		# print instructions to user
cnt:	addi $t1,$t1,1		# increment string pointer offset
	j ins			# analyze next character in string
	
trikld:	addi $sp,$sp,-8		# decrement stack pointer two words
	sw $ra,($sp)		# store current return address in stack
	sb $t2,7($sp)		# store current character in stack
	addi $t1,$t1,1		# increment string pointer offset
	lb $t2,str($t1)		# load character from string
	beqz $t2,triklu		# if char is null (at end of str), unwind
	jal trikld		# otherwise, look at next char
triklu:	lb $t2,7($sp)		# load char from stack
	sb $t2,str($t1)		# save char to position in str
	lw $ra,($sp)		# load last $ra from stack
	addi $sp,$sp,8		# increment stack two words
	addi $t1,$t1,-1		# decrement string pointer offset
	jr $ra			# jump to return address

# print instructions to user and get input
prtmsg:	la $a0,instr
	li $v0,4
	syscall
	j read

# print current string
prt:	li $a0,0xA		# newline for readability
	li $v0,11
	syscall
	la $a0,str		# print str
	li $v0,4
	syscall
	j prtmsg		# print instructions

# program ends when 30 characters have been entered
done:	li $v0,4
	la $a0,fin		# print end message
	syscall
	la $a0,str		# print string
	syscall
	li $v0,10		# end program
	syscall

	.data
instr:	.asciiz "\nPlease enter a lowercase letter, or capital P to print the current string!\n"
fin:	.asciiz	"We're out of space, here is the final string: "
str:	.asciiz "abcdefghijklmnopqrstuvwxyz"
	.space 30