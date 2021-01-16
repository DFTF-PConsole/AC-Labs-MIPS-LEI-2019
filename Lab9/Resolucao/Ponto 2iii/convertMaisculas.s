	.data
	
	.text
	.globl	convertMaisculas

	
convertMaisculas:
	
	# a0 recebe uma string
	#Codigo da função convertMaisculas aqui!
	
	Ciclo:
		lb $t0, 0($a0)
		beq $t0, 0, Termina 	# '\0'
		addi $a0, $a0, 1
		
		blt $t0, 0x61, Ciclo
		bgt $t0, 0x7A, Ciclo
		
		andi $t0, $t0, 0xDF
		sb $t0, -1($a0)
			
	j Ciclo				# Ciclo Infonito

	Termina:
		jr $ra

