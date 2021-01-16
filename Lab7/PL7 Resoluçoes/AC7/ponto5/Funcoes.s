	.data
	
	.text
	.globl	max
	.globl	min
	
max:

	#Codigo da função max aqui!
	lw $v0, 0($a0)
    	while_max:
		addi $a1, $a1, -1
		addi $a0, $a0, 4
		lw $s1, 0($a0) #$s1 variavel a ser lida de momento
		blt $s1, $v0, not_higher
		move $v0, $s1
		not_higher:	
	bgt $a1, 1, while_max
	jr	$ra

min:

	#Codigo da função min aqui!
	lw $v0, 0($a0)
    	while_min:
		addi $a1, $a1, -1
		addi $a0, $a0, 4
		lw $s1, 0($a0) #$s1 variavel a ser lida de momento
		bgt $s1, $v0, not_lower
		move $v0, $s1
		not_lower:	
	bgt $a1, 1, while_min
	jr	$ra
