addi $s0, $zero, 1	# int a = ...;
addi $s1, $zero, -1	# int b = ...;
add $s2, $zero, $zero	# int x = 0;
beq $s0, $s1, else	# if (a == b), goto else
slt $t0, $s0, $s1	# if (a < b), t0 = 1 => if (a > b), t0 = 0
slt $t1, $s0, $zero	# if (a < 0), t1 = 1 => if (a >= 0), t1 = 0
beq $t0, $t1, else	# if (((a < b)&&(a < 0)) || ((a > b)&&(a >=0))), goto else
beq $t0, $zero, elseif	# if (t0 == 0), goto if  => if (a > b), goto if
addi $s2, $zero, 1	# x = 1;
j done

elseif:
addi $s2, $zero, 2	# x = 2;
j done

else:
addi $s2, $zero, 3	# x = 3;

done:



