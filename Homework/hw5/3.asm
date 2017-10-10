	.data
str:	.asciiz "Answer="
data1:	.word 40
data2:	.word 30
data3:	.word 20
data4:	.word 10
data5:	.word 5
ans:	.word 0

	.text
main:	# sub data2 from data1
	lw $t1,data1
	lw $t2,data2
	sub $t2,$t1,$t2
	# add data3
	lw $t1,data3
	add $t2,$t1,$t2
	# multiply by data4
	lw $t1,data4
	mul $t2,$t2,$t1
	# or with data5
	lw $t1,data5
	or $t2,$t2,$t1
	# store 2's complement
	# as ans
	not $t2,$t2
	add $t2,$t2,1
	sw $t2,ans
	# print leader
	la $a0,str
	li $v0,4
	syscall
	# print ans
	la $a0,ans
	li $v0,1
	syscall
	# exit
	li $v0,10
	syscall
