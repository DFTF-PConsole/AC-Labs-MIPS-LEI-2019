		.data

		.text
		.globl	programa

programa:
	# Prologo
	addi $sp, $sp, -24
	sw $ra, 20($sp)


	# corpo do codigo
	add $t1, $a0, $0
	# passagem de parametros a0-a3
	lw $a0, 0($t1)
	lw $a1, 4($t1)
	lw $a2, 8($t1)
	lw $a3, 12($t1)
	
	lw $t0, 16($t1)
	# guardar na pilha o 5º argumento
	sw $t0, 16($sp)

	jal PolyCalc


	# Epilogo
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	# REtorno
	jr	$ra
