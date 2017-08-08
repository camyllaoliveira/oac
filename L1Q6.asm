# Universidade Federal de Alagoas - Instituto de Computa��o
# Lista 1 - Quest�o 6 - Organiza��o e Arquitetura de Computadores
# Professor: Erick Barboza
# Aluno(a): Camylla Oliveira Santos 
# Curso: Engenharia da Computa��o
.data

n: 	.word 1
return: .space 4

.text
main:
	lw $s0, n		# s0 = n
	move $a0, $s0		# a0 = s0
	la $v0, return		# v0 = return
	
fibonacci:
	addi $t0, $zero, 1	# t0 = zero + 1
	beqz $a0, if		# a0 == 0, v� para if
	beq $a0, , if		# a0 == 1, v� para elseif
	

if:
	addi $v0, $zero, 1 	# v0 = zero + 1
	j end

elseif:
	add $v0, $zero, $zero	# v0 = zero + zero
	j end
end: 
	
	
	
	
	