		.data
		.text
		.globl	Polycalc

Polycalc:
	
	#a0 ARRAY (ptr)
	# SOMATORIO: xi/2i

	li $t0, 0 #cont
	li $v0, 0 #resultado
	Loop:
		lw $t1, 0($a0)
		srl $t1, $t1, $t0 	# 2**t0
		add $v0, $v0, $t1
		addi $a0, $a0, 4
		addi $t0, $t0, 1 	# Contador++
		
	blt $t0, 6, Loop
	jr	$ra


