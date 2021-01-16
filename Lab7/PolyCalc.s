# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

.data

.text
	.globl	PolyCalc

		
# Codigo da função aqui
	PolyCalc:
		lw $s0, 32($sp)		# a0=x1 |a1=x2 |a2=x3 |a3=x4 |32(Stack)->s0=x5
		
	# f=5(x1+x2)(x3-3x4x5) |f=5(a0+a1)(a2-3a3v0)
							
		add $t0, $a0, $a1	# (x1+x2)	
		li $t1, 5			
		mul $t2, $t1, $t0	# 5(x1+x2) - Final $t2
		mul $t3, $s0, $a3	# x4x5
		li $t1, 3
		mul $t4, $t3, $t1	# 3x4x5
		sub $t1, $a2, $t4	# (x3-3x4x5) Final $t1
		mul $t0, $t2, $t1	# f = 5(x1+x2)(x3-3x4x5) - Final $t0
		
		move $v0, $t0		# Move para Variavel de Return
		
# *** Jump Register -> Register Adress ***
	
	jr $ra		# Voltar a funcao: programa no ficheiro programa.s
