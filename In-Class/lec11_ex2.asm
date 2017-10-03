	.data
str: 	.asciiz "Hello, world!\n"	# define str as "Hello, world!\n"
	.text
main:	la $a0,str			# load str into a0
	li $v0,4			# load print into v0
	syscall				# execute instruction in v0
	li $v0,10			# load end into v0
	syscall				# execute instruction in v0
