	.text
main:	li $t0,0x73a8ef64
	li $t1,4
	la $t2,z
	bgezal $t1,loop
	jal print
	li $v0,10
	syscall	

loop:	swl $t0,($t2)
	sll $t0,$t0,8
	sub $t1,$t1,1
	sub $t2,$t2,4
	bgtz $t1,loop
	jr $ra

	.data
w:	.word 0
x:	.word 0
y:	.word 0
z:	.word 0