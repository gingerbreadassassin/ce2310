	.data
inval:	.asciiz "\nPlease enter a lowercase letter, or capital P to print the current string!\n"
fin:	.asciiz	"We're out of space, here is the final string: "
str:	.asciiz "abcdefghijklmnopqrstuvwxyz"
	.space 30

	.text
main:	li $t0,0
	li $t3,0
	j notake

read:	beq $t0,30,done
	li $v0,12
	syscall
	beq $v0,0x50,prt
	bgt $v0,0x7A,notake
	blt $v0,0x61,notake
	addi $t0,$t0,1
	li $t1,0
ins:	lb $t2,str($t1)
	beqz $t2,zed
	bgt $v0,$t2,cnt
	jal trikld
	sb $v0,str($t1)
	j notake
cnt:	addi $t1,$t1,1
	j ins
	
trikld:	addi $sp,$sp,-8
	sw $ra,($sp)
	sb $t2,7($sp)
	addi $t1,$t1,1
	addi $t3,$t3,1
	lb $t2,str($t1)
	beqz $t2,triklu
	jal trikld
triklu:	lb $t2,7($sp)
	sb $t2,str($t1)
	lw $ra,($sp)
	addi $sp,$sp,8
	addi $t1,$t1,-1
	addi $t3,$t3,-1
	jr $ra

	
zed:	sb $v0,str($t1)
	j notake

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
