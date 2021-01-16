	.data
	.text
		.globl	codificastring

codificastring:
	
	#a0 string
	#a1 chave
	Ciclo:
		lb $t1, 0($a0)
		beq $t1, 0, Fim
		xor $t1, $t1, $a1
		sb $t1, 0($a0)
		addi $a0, $a0, 1
	j Ciclo
	
	Fim:
	jr	$ra


