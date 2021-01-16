	.data

	.text
	.globl	PolyCalc

PolyCalc:
	# Prologo
	lw $t4, 16($sp)

	# corpo codigo

	add $t0, $a0, $a1
	addi $t1, $0, 5
	mul $t0, $t0, $t1
	addi $t1, $0, 3
	mul $t3, $a3, $t4
	mul $t3, $t3, $t1
	sub $t2, $a2, $t3

	mul $v0, $t0, $t2


	#Epilogo
	#Retorno
	jr $ra
