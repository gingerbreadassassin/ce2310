	.data
inval:	.asciiz "\nPlease enter a lowercase letter, or capital P to print the current string!\n"
fin:	.asciiz	"We're out of space, here is the final string: "
str:	.asciiz "abcdefghijklmnopqrstuvwxyz"
sp:	.space 30

	.text
main:	li $t0,0
	j notake

read:	beq $t0,30,done
	li $v0,12
	syscall
	beq $v0,0x50,prt
	bgt $v0,0x7A,notake
	blt $v0,0x61,notake
	addi $t0,$t0,1

notake:	la $a0,inval
	li $v0,4
	syscall
	j read

prt:	li $a0,0xA
	li $v0,11
	syscall
	la $a0,str
	li $v0,4
	syscall
	li $a0,0xA
	li $v0,11
	syscall
	j read
	
done:	li $v0,4
	la $a0,fin
	syscall
	la $a0,str
	syscall
	li $v0,10
	syscall