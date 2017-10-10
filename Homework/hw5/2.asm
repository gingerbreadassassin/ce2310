	.data
t:	.word 100
u:	.word 54
v:	.word 37
w:	.word 23
x:	.word 0
y:	.word 0
z:	.word 0

	.text
main:	# load t and u
	lw $t1,t
	lw $t2,u
	# or t and u
	or $t3,$t1,$t2
	# store as x
	sw $t3,x
	# load v and w
	lw $t1,v
	lw $t2,w
	# xor v and w
	xor $t3,$t1,$t2
	# store as y
	sw $t3,y
	# load x
	lw $t1,x
	# add y and x
	add $t3,$t1,$t3
	# store as z
	sw $t3,z
	#load x and y
	lw $t1,x
	lw $t2,y
	# print x*y*z
	mul $t3,$t1,$t2
	lw $t1,z
	mul $t3,$t1,$t3
	la $a0,($t3)
	li $v0,1
	syscall
	# exit
	li $v0,10
	syscall
