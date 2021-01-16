	.data
	
	.text
	.globl	conta_char


	
conta_char:
	
	#lw $t0, k($s0) == $t0=*($s0+k)
	#sw $t0, k($s0) == *($0+k) = $t0
	
	#Codigo da função conta_char aqui!
	li,$v0,0
	While:
		lb $t0,0($a0)
		bne $t0,$a1, not_equal
		addi $v0, $v0, 1
		not_equal:
			addi $a0, $a0, 1
			bne $t0, 0, while
	jr	$ra


