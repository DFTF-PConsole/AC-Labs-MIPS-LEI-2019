		.data

		.text
		.globl	manipula_array
manipula_array:

	# Codigo da função aqui
	move $s0, $a0 #s0 é ptr
	li $t0, 0 #t0 é contador
	while:
		lw $s1, 0($s0)
		add $s1, $s1, $s1
		sw $s1, 0($s0)
		addi $t0, $t0, 1
		addi $s0, $s0, 4
		blt $t0, $a1, while
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	jal inverte_array
	lw $ra, 4($sp)
	jr	$ra
