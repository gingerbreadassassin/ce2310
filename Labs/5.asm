	.data
str1:	.ascii ""
buff1:	.space 30
str2:	.ascii ""
buff2:	.space 30
abcs:	.asciiz "abcdefghijklmnopqrstuvwxyz"
ldr:	.asciiz "The alphabetized string is: "
prompt:	.asciiz "Please enter some characters: "

	.text
main:	# read string input
	la $a0,prompt
	li $v0,4
	syscall
	la $a0,str1
	li $a1,15
	li $v0,8
	syscall
	li $a0,0xA # 0xA is CR/LF
	li $v0,11  # 11 prints single char
	syscall
	
	la $t0,abcs
	la $t1,str1
	la $t2, str2
	
oloop1:	lb $t3,0($t0)
	beqz $t3,over
	j iloop
	
	
oloop2:	addi $t0,$t0,1
	la $t1,str1
	addi $t3,$t3,1
	j oloop1

iloop:	lb $t4,0($t1)
	beqz $t4,oloop2
	bne $t3,$t4,iinc
	sb $t3,0($t2)
	addi $t2,$t2,1
iinc:	addi $t1,$t1,1
	j iloop

over:	la $a0,ldr
	li $v0,4
	syscall
	la $a0,str2
	syscall
	li $v0,10
	syscall