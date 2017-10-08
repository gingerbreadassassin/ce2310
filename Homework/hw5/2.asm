	.data
t:	.word 100
u:	.word 54
v:	.word 37
w:	.word 23
x:	.word 0
y:	.word 0
z:	.word 0

	.text
main:	lw $t1,t
	lw $t2,u
	or $t3,$t1,$t2
	sw $t3,x
	lw $t1,v
	lw $t2,w
	xor $t3,$t1,$t2
	sw $t3,y
	lw $t1,x
	add $t3,$t1,$t3
	sw $t3,z
	lw $t1,x
	lw $t2,y
	mul $t3,$t1,$t2
	lw $t1,z
	mul $t3,$t1,$t3
	la $a0,($t3)
	li $v0,1	
	syscall
	li $v0,10
	syscall