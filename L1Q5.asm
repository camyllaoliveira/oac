# Universidade Federal de Alagoas - Instituto de Computação
# Lista 1 - Questão 5 - Organização e Arquitetura de Computadores
# Professor: Erick Barboza
# Aluno(a): Camylla Oliveira Santos 
# Curso: Engenharia da Computação
.data
num1:	.word 3
num2: 	.word -5
result: .space 4

.text
main: 
	lw $s0, num1	# s0 = num1
	lw $s1, num2	# s1 = num2
	j l1		# vá para l1

l1: 
	blt $s1, $s0, m1        # se s1 < s0, vá para m1
	move $a0, $s0		# a0 = s0
	move $a1, $s1		# a1 = s1
	j for			# vá para o for
	
m1:
	move $a0, $s1		# a0 = s1
	move $a1, $s0		# a1 = s0
	j for


for: 				
	move $s3, $a1		# s3 = a1 
	bltz $s3, mod		# se s3 < 0, vá para mod
		
fortst:
	beq $s3, $zero, endl	# se s3 == 0, fim do loop
	add $s4, $s4, $a0	# s4 = s4 + a1
	subi $s3, $s3, 1	# s3-- 
	j fortst		# vá para o teste do loop

mod: 
 	not $s3, $s3 		# s3 = !s3
 	addi $s3, $s3, 1	# s3 = s3 + 1
 	addi $s5, $zero, 1	# s5 = zero + 1 
	j fortst		#vá para fortst

#multiplica o resultado por -1 	
mt:
	not $s4, $s4		# nega s4
	addi $s4, $s4, 1	# soma 1
	j end			# vá para end

endl: 
	bne $s5, $zero, mt	# se s5 != 0, vá para mt
	j end
	
end: 
	sw $s4, result		# result = s4
