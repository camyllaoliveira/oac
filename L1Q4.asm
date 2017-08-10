main:.
	addi $a0, $zero, -1	# a0 = ...
	addi $a1, $zero, 5	# a1 = ...
	bgt $a0, $a1, error	# se a0 > a1, vá para error
	add $v0, $zero, $a0	# v0 = valor inicial de a0
	
sum:
	bgt $a1, $a0, sumrecursive	# se a0 < a1, chamada de sumrecursiva
	j exit

sumrecursive:
	add $v0, $v0, $a1		# v0 += a1
	subi $a1, $a1, 1		# a1--
	j sum				# chamada de sum
	
error:
	addi $v1, $zero, 1	# v1 = 1
	break			# encerra com erro
	
exit:
