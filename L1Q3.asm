.data
	instr: 	.asciiz	"hArdwArE"
	outstr: .asciiz "        "
	size: 	.word 8
.text
main: 
	addi $t0, $zero, 0	# t0 = 0;
	lw $t1, size		# t1 = 8;
	addi $t1, $t1 , -1	# t1 = t1 - 1;

repeat:
	lb $t2, instr($t0)	# t2 = instr[t0];
	beq $t2, $zero, exit	# if (t2 == null), goto exit
	# verificando se o caracter é minúsculo
	# ascii table - (97-122): Minusculos; (65-90): Maiusculos
	sge $t3, $t2, 97 	# if (t2 >= 97), t3 = 1
	sle $t4, $t2, 122	# if (t2 <= 122), t4 = 1
	and $t5, $t3, $t4	# if ((t3 && t4) == 1), t5 = 1
	beq $t5, 1, toUpperCase	# if (t5 == 1), goto toUpperCase
	sge $t3, $t2, 65	# if (t2 >= 65), t3 = 1
	sle $t4, $t2, 90	# if (t2 <= 90), t4 = 1
	and $t5, $t3, $t4	# if ((t3 && t4) == 1), t5 = 1
	beq $t5, 1, toLowerCase	# if (t5 == 1), goto toLowerCase
	beq $t5, $zero, error	# if (t5 == 0), goto error
	
toUpperCase:
	subi $t2, $t2, 32	# t2 -= 32;

	j return
	

toLowerCase:
	addi $t2, $t2, 32	# t2 += 32s;
	j return

return:
	sub $t6, $t1, $t0	# t6 = t1 - t0
	sb $t2, instr($t6)	# t1 = instr[t6]
	addi $a0, $t1, 1	# a0 = t1 + 1
	bne $t0, $a0, repeat
	j exit	

error:	
	addi $v1, $zero, 1	# v1 = 1;
	break

exit:
	li $v0, 4          # We need this to call the print_string syscall  
	la $a0, outstr  # Load the text to show in console  
	syscall            # Call the print_string "method"  
