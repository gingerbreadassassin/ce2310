	.data
string1: .ascii ""
buff:	 .space 30

	.text
main:	la $a0,string1
	li $a1,15
	li $v0,8
	syscall
	li $v0,4
	syscall
	li $v0,10
	syscall