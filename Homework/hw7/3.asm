	.text
main: 	la $t0,str
	la $t7,str
comp: 	lb $t1,0($t0)
	lb $t2,1($t0)
	beqz $t2,done
	ble $t1,$t2,count
	jal rev
	j comp
count: 	addi $t0,$t0,1
	j comp
done: 	la $a0,str
	li $v0,4
	syscall
	li $v0,10 
	syscall
	

rev: 	sub $sp,$sp,4 
	sw $ra,($sp) 
	sb $t1,1($t0) 
	sb $t2,0($t0)
	beq $t0,$t7,goback 
	sub $t0,$t0,1 
	lb $t1,0($t0) 
	lb $t2,1($t0)
	ble $t1,$t2,goback 
	jal rev 
goback:	addi $t0,$t0,1 
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra


	.data
str:	.asciiz "Hello, world!\n"
