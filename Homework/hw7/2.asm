	.data
array:	.space 1600	# Array of 400 integers (4 bytes each) in 20X20 array

	.text
main:	li $t0,0		# $t0 is pointer offset
	li $t1,1		# $t1 is the value to store
even:	beq $t0,1600,done	# if $t0 = 1600, we're done
	sw $t1,array($t0)	# store $t1 in array
	addi $t0,$t0,4		# increment array pointer
	addi $t1,$t1,1		# increment value
	beq $t1,21,odd		# go to next row
	j even			# loop back

odd:	beq $t0,1600,done	# if $t0 = 1600, we're done
	addi $t1,$t1,-1		# decrement value
	sw $t1,array($t0)	# store value in array
	addi $t0,$t0,4		# increment array pointer
	beq $t1,1,even		# go to next row
	j odd			# loop back
	
done:	li $v0,10
	syscall
