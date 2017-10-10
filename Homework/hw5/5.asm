	.data
aa:	0
bb:	0
cc:	0
dd:	0
ee:	0
ff:	0
ldr:	.asciiz "Final answer= "
	.text
main:	# set aa = 1408
	li $t0,1408
	sw $t0,aa
	# set bb - 987
	li $t0,987
	sw $t0,bb
	# from aa subtract bb and store as cc
	lw $t0,aa
	lw $t1,bb
	sub $t2,$t0,$t1
	sw $t2,cc
	# multiply bb by cc and store as dd
	lw $t0,bb
	lw $t1,cc
	mul $t2,$t0,$t1
	sw $t2,dd
	# or cc and dd and store as ee
	lw $t0,cc
	lw $t1,dd
	or $t2,$t0,$t1
	sw $t2,ee
	# and dd and cc and store as ff
	lw $t0,dd
	lw $t1,ee
	and $t2,$t0,$t1
	sw $t2,ff
	la $a0,ldr
	li $v0,4
	syscall
	# print answer
	la $a0,($t1)
	li $v0,1
	syscall
	# exit program
	li $v0,10
	syscall