	.data
	
	.text
	.globl	oddnumber

	
oddnumber:
	# a0 = array
	# a1 = n_elementos_array
	#Codigo da função oddnumber aqui!
	li $v0, 0	# COntador de Impares
	li $t1, 0 	#Iterador
	
	Ciclo:
		lb $t0, 0($a0)
		andi $t0, $t0, 1
		seq $t2, $t0, 1
		add $v0, $v0, $t2
		addi $t1, $t1, 1
		addi $a0, $a0, 4
	blt $t1, $a1, Ciclo
	
	jr	$ra

