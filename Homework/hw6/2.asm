	.text
main:	la $t0,str
	li $t2,0

loop:	lb $t1,0($t0)
	beqz $t1,over
	add $t2,$t1,$t2
	addi $t0,$t0,1
	j loop
	
over:	la $a0,($t2)
	li $v0,1
	syscall
	li $v0,10
	syscall
	
	.data
str:	.asciiz "Hello, world!\n"