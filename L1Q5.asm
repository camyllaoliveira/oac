# caso teste com num = 2 dando erro
.data
num1:	.word -9
num2: 	.word 3
result: .space 4

.text
main: 
	lw $s0, num1		# s0 = num1
	lw $s1, num2		# s1 = num2
	and $t0, $s0, $s1	# t0 = (num1 && num2)
	bnez $t0, l1		# se t0 != 0, vá para l1
	sw $zero, result	# result = 0
	j exit
		
l1: 	
	move $a0, $s0		# a0 = num1
	move $a1, $s1		# a1 = num2

l2:	blt $a1, $a0, swap      # se num2 < num1, vá para swap
	j bfor			# vá para o bfor
	
swap:
	move $t4, $a0		# t4 = a0
	move $a0, $a1		# a0 = num2
	move $a1, $t4		# a1 = t4
	j bfor

bfor: 	
	bltz $a0, mod		# se a0 < 0, vá para mod
	add $t1, $zero, $a0	# inicia nosso contador com o valor do menor numero
	j for	

for:
	beq $t1, $zero, multneg	# se t1 == 0, fim do loop
	add $v0, $v0, $a1	# v0 += a1
	subi $t1, $t1, 1	# t1-- 
	j for		# vá para o teste do loop

mod: 	# complemento de 2 para tornar o numero negativo em positivo
 	not $a0, $a0		# a0 = !a0 (complemento de 1 - inverter os bits)
 	addi $a0, $a0, 1	# a0 = a0 + 1 (soma 1)
	j l2			# vá para l2 (testar quem é o maior depois de módulo )

	# multiplica o resultado por -1 	
multneg:
	slt $t0, $s0, $zero	# se num1 < 0, t0 = 1
	slt $t1, $s1, $zero	# se num2 < 0, t1 = 1
	xor $t2, $t0, $t1	# t2 = 1, se tiver que multiplicar por (-1)
	beqz $t2, end		# se t2 != 0, vá para end
	not $v0, $v0		# nega v0
	addi $v0, $v0, 1	# soma 1
	j end			# vá para end
	
end: 
	sw $v0, result		# result = v0

exit:
