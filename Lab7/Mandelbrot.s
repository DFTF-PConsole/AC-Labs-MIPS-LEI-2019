# COPYRIGHT @ DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

.data
	
.text
	.globl	Mandelbrot
	
#Codigo da função aqui!
	Mandelbrot:
		li $s0, 0			# Contador
		move $s1, $a0			# f - Incial
		move $s2, $a0			# z0 
		
		Ciclo: 		 		# While $s0 < n
			addi $s0, $s0, 1	# Contador ++
			
			addi $sp, $sp, -32	# 2 arg + 3 var + $ra = 6 -> 6*4 = 24 | 
						# (...) 24 e multiplo de 8 -> +1DW fica 32 (8 words)
			
			#Backup - Stack:
			sw $a0, 0($sp)  	# z0->a1 na Stack
			sw $a1, 4($sp)  	# n na Stack
			sw $s0, 8($sp)  	# contador na Stack
			sw $s1, 12($sp)  	# $s1 na Stack
			sw $ra, 16($sp)  	# $ra na Stack
			sw $s2, 20($sp)		# z0 na Stack
						
			# move $fp, $sp -> Nao e necessario guargar o frame atual da Stack 
			# (...) porque nao se alocara mais memoria em funcoes futuras
			
			move $a0, $s1		# Paramentros da Funcao a ser chamada
			jal Pow			# Jump and Link - Jump para Pow, e Link $ra
			
			#Restauro - Stack:
			lw $a0, 0($sp)  	# z0 na Stack
			lw $a1, 4($sp)  	# n na Stack
			lw $s0, 8($sp)  	# contador na Stack
			lw $s1, 12($sp)  	# $s1 na Stack
			lw $ra, 16($sp)  	# $ra na Stack
			lw $s2, 20($sp)		# z0 na Stack	
			
			addi $sp, $sp, 32	# Elimina Stack
			
			add $s1, $s2, $v0	# f = x**2 + z0
			
			blt $s0, $a1, Ciclo	# Ciclo -> Se: Contador ($s0) < n ($a1)
			
	move $v0, $s1	# Return - Variavel Final
	jr $ra		# Retorna a funcao main -> Ficheiro: Lab7_4,c 

			Pow:
				mul $a0, $a0	# z**2 ou z*z
				mflo $v0	# Return variavel
				jr $ra		# Retorna de onde veio
				




#Stack: Alinhamento ao Double Word (Multiplos de 8), mas pode-se mover em word em word (4)
# Notas:
# z(0) = z0
# z(n+1) = z**2(n) + z0

# Linguagem C - Lab7_4:
# z = Mandelbrot (int z0, int n);
# printf ("Z(%d) = %d\n",n,z);