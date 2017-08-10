.data
	str: .asciiz "MyStr"
	out: .asciiz "     "
.text

main:
	add $t0, $zero, $zero		# indice t0 = 0
	lb $s0, str($t0)		# s0 = str[0]	
	addi $t1, $zero, 4		# indice t4 = tamanho da string - 1

	beqz $s0, exit			# String vazia
		
	# checagem 
testLower:
	# 97 - 122: letras minúsculas
	blt $s0, 97, testUpper		# se s0 < 97, vá p testUpper
	bgt $s0, 122, noCharacter	# se s0 > 122, vá p noCharacter
	# converte para maiúsculas
	addi $s0, $s0, -32		# s0 = s0 - 32
	sb $s0, out($t1)		# out[t1] = s0
	j for			
	
testUpper:
	# 65 - 90: letras minúsculas
	blt $s0, 65, noCharacter	# se s0 < 97, vá p noCharacter
	bgt $s0, 90, noCharacter	# se s0 > 122, vá p noCharacter
	# converte para minúsculas
	addi $s0, $s0, 32		# s0 = s0 + 32
	sb $s0, out($t1)		# out[t1] = s0
	j for	

for:
	addi $t0, $t0, 1		# t0++
	lb $s0, str($t0)		# s0 = str[t0]
	beqz $s0, exit			# final da string
	addi $t1, $t1, -1		# t1--
	j testLower
	
noCharacter:
	addi $v1, $zero, 1		# v1 = 1
	break				# encerra com erro
	
exit:
	li $v0, 4
	la $a0, out
	syscall
