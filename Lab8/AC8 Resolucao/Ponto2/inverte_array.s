		.data

		.text
		.globl	inverte_array
inverte_array:

	# Codigo da fun��o aqui
	move $s0, $a0 #s0 � ponteiro de primeiro elemento
	li $t0, 4
	mul $a1, $t0
	mflo $t1
	addi $t1, $t1, -4
	add $t1, $s0, $t1 # t1 � o ponteiro do ultimo elemento do array
	#t2 � valor da esquerda, t3 � valor da direita	
	while:
		lw $t2, 0($s0)
		lw $t3, 0($t1)
		sw $t2, 0($t1)
		sw $t3, 0($s0)
		addi $s0, $s0, 4
		addi $t1, $t1, -4
	blt $s0, $t1, while
	jr	$ra
