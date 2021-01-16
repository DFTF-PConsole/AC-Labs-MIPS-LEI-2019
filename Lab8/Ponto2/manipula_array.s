# COPYRIGHT @ DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.


.data

.text
	.globl	manipula_array
	
# Codigo da função aqui	
	manipula_array:
	# $a0 -> Vetor de Interios - Apontador para o inicio
	# $a1 -> Dimensao do vetor
		
		li $t0, 0			# INICIACAO: $t0 -> Contador >>> $a1 Max: Dimensao do vetor
		move $s0, $a0			# INICIACAO: Ponteiro Inicial -> &vetor[0]
		li $s1, 0			# INICIACAO: Conteudo do Endereço >>> POnteiro
		
		Ciclo:
			lw $s1, 0($s0)		# Load Word: apontado &vetor
			mul $s1, $s1, 2		# Faz DOBRO do Conteudo
			sw $s1, 0($s0)		# Store Word -> Já Com Dobro
			addi $t0, $t0, 1	# Contador + 1
			addi $s0, $s0, 4	# Ponteiro + 1 (1 Word: 4 Bytes) | vetor[x++]
			blt $t0, $a1, Ciclo	# Ciclo: SALTA SE: Contador ($t0) < Dimensao ($a1)
		
		addi $sp, $sp, -8		# Alocar STACK (8: -> Regra do Alinhamento ao Double Word [4*2] >>> 8*n) | $sp -> Stack Pointer
		sw $ra, 4($sp)			# BACKUP: Store Word ($ra - Return Adress) | Sitio: 4($sp)
		jal inverte_array		# Jump And Link: JUMP funcao inverte_array e LINK: $ra
		lw  $ra, 4($sp)			# RESTAURAR: Load Word ($ra - Return Adress) | Sitio: 4($sp)
	
	jr $ra	# VOLTA: Jump Register | Return Adress
