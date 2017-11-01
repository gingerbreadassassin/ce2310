# Connor Ness and Steven Paisley
# CE2310
# Lab 5
	.data
str1:	.ascii ""
buff1:	.space 30
str2:	.ascii ""
buff2:	.space 30
abcs:	.asciiz "abcdefghijklmnopqrstuvwxyz"
ldr:	.asciiz "The alphabetized string is: "
prompt:	.asciiz "Please enter some characters: "

	.text
	# prompt user for input
main:	la $a0,prompt
	li $v0,4
	syscall
	# read string input
	la $a0,str1
	li $a1,15
	li $v0,8
	syscall
	
	# keep track of place in strings
	la $t0,abcs	# key
	la $t1,str1	# input
	la $t2, str2	# output
	
	# check if user's input contains newline
chknl:	lb $t3,0($t1)	# load character from input
	li $a0,0xA 	# 0xA is CR/LF
	addi $t1,$t1,1	# increment memory address
	beqz $t3,nonl	# if null character, no newline
	beq $t3,$a0,ynl # contains newline
	j chknl		# check whole string
		
	# if does not contain newline, print one	
nonl:	la $t1,str1	# reset address to string1
	li $v0,11  	# 11 prints single char
	syscall
	j oloop1
	
	# if does contain newline, don't print another
ynl:	la $t1,str1	# reset address to string1

	# Outer loop part 1
oloop1:	lb $t3,0($t0)	# loads character into register
	beqz $t3,over	# if null character, checked whole key
	j iloop		# jump to inner loop

	# Inner loop
iloop:	lb $t4,0($t1)	# loads character from stored user input
	beqz $t4,oloop2	# if null, check next key
	bne $t3,$t4,iinc# if x!=y, check next char
	sb $t3,0($t2)	# if x==y, save character to new string
	addi $t2,$t2,1	# and increment new string place
iinc:	addi $t1,$t1,1
	j iloop
	
	# Outer loop part 2
oloop2:	addi $t0,$t0,1	# increments place in key
	la $t1,str1	# reset place in string1
	j oloop1	# rinse, wash, repeat	

	# when finished sorting
over:	la $a0,ldr	# print leading text
	li $v0,4
	syscall
	la $a0,str2	# print sorted string
	syscall
	li $v0,10	# quit
	syscall
