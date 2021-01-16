	.data
	
	.text
	.globl	oddnumber

	
oddnumber:
	# int oddnumber(int *ptr,int *ptr2,int *ptr3, int n);
	# a0 = array original
	# a1 = array impares
	# a2 = array pares 
	# a3 = n_elementos_array principal
	
	# v0 = n_elementos impares
	
	#Codigo da função oddnumber aqui!
	
	li $v0, 0	# COntador de Impares
	li $t1, 0 	#Iterador
	
	Ciclo:
		lw $t0, 0($a0)
		andi $t3, $t0, 1
		seq $t2, $t3, 1
		add $v0, $v0, $t2
		addi $t1, $t1, 1
		addi $a0, $a0, 4
		
		beq $t3, 0, Par
		beq $t3, 1, Impar
		Volta:
	blt $t1, $a3, Ciclo
	jr	$ra
	
Impar:
	sw $t3, 0($a1)
	addi $a1, $a1, 4
	j Volta

Par:
	sw $t3, 0($a2)
	addi $a2, $a2, 4
	j Volta



