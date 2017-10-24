	.data
num1:	.word 0x21
num2:	.word 0x44
num3:	.word 0x54
num4:	.word 0x55

	.text
main:	li $t0,0
	la $t1,num1
	li $v0,11
	j store

store:	lw $s0,($t1)
	jal push
	addi $t0,$t0,1
	addi $t1,$t1,4
	beq $t0,4,prt
	j store
	
prt:	jal pop
	la $a0,($s0)
	syscall
	addi $t0,$t0,-1
	beqz $t0,end
	j prt

push:	addi $sp,$sp,-4
	sw $s0,($sp)
	jr $ra
	
pop:	lw $s0,($sp)
	addi $sp,$sp,4
	jr $ra
	
end:	li $v0,10
	syscall