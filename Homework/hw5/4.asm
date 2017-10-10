	.data
data1:	.word 0x63f2e3
data2:	.word 0x9100ab72

	.text
main:	lw $t0,data1
	bgezal $t0,next
	lw $t0,data2
	bgezal $t0,next
	li $v0,10
	syscall
	
	
next:	la $a0,($t0)
	li $v0,1
	syscall
	jr $ra