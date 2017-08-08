main:
	addi $a0, $zero, 1	# a = ...;
	addi $a1, $zero, 5	# b = ...;
	slt $a1, $a0, if	# if (b < a), goto if
	beq $a0, $a1, else	# if (a == b), goto else
	addi $t0, $a0, 1	# t0 = a + 1
	jal sum			# chamada de sum
		
if:
	addi $v1, $zero, 1	# v1 = 1;
	j exit			# fim da execução

else:
	add $v1, $a0, $a1	#  v1 = a + b
	j exit			# fim da execução
	
sum:
	beq $t0, $a1, ret	# if (t0 == b), goto ret
	addi $t0, $zero, 1	# t0++;	
	jal sum
ret:
	
				
exit:
