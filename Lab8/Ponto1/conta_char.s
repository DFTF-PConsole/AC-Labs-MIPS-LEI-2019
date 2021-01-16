# COPYRIGHT @ DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.



.data
	
.text
	.globl	conta_char

#Codigo da função conta_char aqui!

	
	conta_char:
		# $a0 -> Ponteiro String Inicial
		# $a1 -> Caracter - Comparar
	
		li $t0, 0
		li $v0, 0
	
		Ciclo:
			lb $t0, 0($a0)			# Copy: Ponteiro da String -> Caracter 
			bne $t0, $a1, Salta		# Salta: SE NAO E IGUAL -> $t0 != $a1
			addi $v0, $v0, 1		# Contador do Caracter ($t0 == $a1)
			
			
			Salta:
				addi $a0, $a0, 1	# Ponteiro + 1
				bne $t0, 0, Ciclo	# ASCII: '\0' -> Byte: 0000 0000 | Final da String
	
	
	
	
	jr $ra	#Jump Register -> Adress Return


