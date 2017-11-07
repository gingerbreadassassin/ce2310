	.text
main:	li $t3,$t3,0
	la $t0,num1($t3)
	la $t1,num1+8($t3)
	



nwl:	li $a0,0xA
	li $v0,4
	syscall
	jr $ra


	.data
num1: 	.word 53875
num2: 	.word 36429
num3: 	.word 88641
num4: 	.word 95437
num5:	.word 25153
num6:	.word 42398
num7:	.word 0