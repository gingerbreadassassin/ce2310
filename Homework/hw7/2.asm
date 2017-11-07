	.data
array:	.space 3200

	.text
main:	li $t0,0
	li $t1,1
even:	beq $t0,3200,done
	sw $t1,array($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	beq $t1,21,odd
	j even

odd:	beq $t0,3200,done
	addi $t1,$t1,-1
	sw $t1,array($t0)
	addi $t0,$t0,4
	beq $t1,1,even
	j odd
	
done:	li $v0,10
	syscall