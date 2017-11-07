	.text
main:	la $t0,num1
	la $t7,num1
comp: 	lw $t1,0($t0)
	lw $t2,4($t0)
	beqz $t2,print
	ble $t1,$t2,count
	jal rev
	j comp
count: 	addi $t0,$t0,4
	j comp
	
rev: 	sub $sp,$sp,4 
	sw $ra,($sp) 
	sw $t1,4($t0) 
	sw $t2,0($t0)
	beq $t0,$t7,goback 
	sub $t0,$t0,4
	lw $t1,0($t0)
	lw $t2,4($t0)
	ble $t1,$t2,goback
	jal rev
goback:	addi $t0,$t0,4
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

print:	li $t0,0
ploop:	li $v0,1
	lw $a0,num1($t0)
	beqz $a0,done
	syscall
	addi $t0,$t0,4
	jal pnl
	j ploop

pnl:	li $a0,0xA
	li $v0,11
	syscall
	jr $ra

done:	li $v0,10
	syscall

	.data
num1: 	.word 53875
num2: 	.word 36429
num3: 	.word 88641
num4: 	.word 95437
num5:	.word 25153
num6:	.word 42398
num7:	.word 0
