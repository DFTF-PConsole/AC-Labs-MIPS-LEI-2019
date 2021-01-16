# COPYRIGHT @ DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

		
.data

.text
	.globl	inverte_array
	
# Codigo da função aqui	
	inverte_array:
	# PARAMETROS IGUAIS | NAO FORAM ALTERADOS PELA FUNCAO ANTERIOR
	# $a0 -> Vetor de Interios - Apontador para o inicio
	# $a1 -> Dimensao do vetor
		
		move $s0, $a0			# INICIACAO: Ponteiro Inicial -> &vetor[0] (Elemento Inicial)
		
		mul $t0, $a1, 4			# $t0 = Dimensao do Vetor ($a1) * 4 (Word)
		sub $t0, $t0, 4		# $t0 = ($t0) - 4 (Word) [- 1 posicao]
		move $s1, $a0			# COPY: Ponteiro Inicial -> &vetor[0] (Elemento Inicial)
		add $s1, $s1, $t0		# INICIACAO: Ponteiro Final -> &vetor[DIM-1] (Elemento Final) || Ponteiro Inicial + (Dimensao - 1)
		
		li $t0, 2			# Temporario -> Load: 2
		li $t1, 1			# Temporario -> Load: 1
		
		li $t2, 0			# Contador - Inicio
		
		div $a1, $t0			# DIVISAO: DimensaoVetor/2 = LO -> Quociente e HI -> Resto
		mflo $s2			# [Move From LO] - QUOCIENTE
		mfhi $s3			# [Move From HI] - RESTO
		# RESTO: 0->Par | 1->Impar | (a dimensao do vetor)
		
		beq $s3, $zero, CicloPar	# Jump CicloPar -> SE Resto==0
		beq $s3, $t1, CicloImpar	# Jump CicloImpar -> SE Resto==1
		
		CicloPar:
			
			lw $t3, 0($s0)		
			lw $t4, 0($s1)
			sw $t4, 0($s0)
			sw $t3, 0($s1)
			
			addi $s0, $s0, 4
			addi $s1, $s1, -4
			
			addi $t2, $t2, 1
			
			blt $t2, $s2, CicloPar
			
		jr $ra	# VOLTA: Jump Register | Return Adress	
			
		CicloImpar:
			
			lw $t3, 0($s0)
			lw $t4, 0($s1)
			sw $t4, 0($s0)
			sw $t3, 0($s1)
			
			addi $s0, $s0, 4
			addi $s1, $s1, -4
			
			addi $t2, $t2, 1
			
			blt $t2, $s2, CicloImpar
			
		lw $t3, 0($s0)
		sw $t3, 0($s0)
				
		jr $ra	# VOLTA: Jump Register | Return Adress
