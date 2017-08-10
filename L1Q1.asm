addi $s0, $zero, 2 	  # int a = 2;
addi $s1, $zero, 1	  # int b = 1;
add $s2, $zero, $zero	# int m = 0;
add $s2, $zero, $s0	  # m = a;
slt $t0, $s1, $s2	    # if ( b < m ), t0 = 1; else t0 = 0
beq $t0, $zero, else	# if (t0 == 0), goto else
add $s2, $zero, $s1	  # m = b;
j exit			          # goto exit
else:
add $s2, $zero, $zero	# m = 0; # else m = 0;
exit:

