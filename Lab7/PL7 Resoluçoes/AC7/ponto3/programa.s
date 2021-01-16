		.data

		.text
		.globl	programa
programa:

	# Codigo da função aqui
	#a0 é vec
	#deveriam ser guardados todos os $s e $a antes de serem alterados para a chamada de funcao.
	#para seguir a convenção. 
	#para o problema em questao não é necessario para ser funcional
	lw $a1, 4($a0) #carregar valores nos argumentos
	lw $a2, 8($a0)
	lw $a3, 12($a0)
	lw $s0, 16($a0)
	lw $a0, 0($a0)
	addiu $sp, $sp, -8 #alocar 8 bytes na stack
	sw $s0, 4($sp) #guardar no byte alocado mais acima
	sw $ra, 8($sp) #guardar return address desta funcao
	jal PolyCalc #chamada de funcao que altera registo $ra
	lw $ra, 8($sp) #recuperar return address
	jr	$ra #retornar

PolyCalc:
	lw $s0, 4($sp) #s0 = x5 espero eu
	add $t1, $a0, $a1 #t1 = x1 + x2
	li $t0, 5 
	mul $t0, $t1
	mflo $t1 #t1 = 5(x1+x2)
	li $t0, 3
	mul $t0, $a3
	mflo $t0 #t0 = 3*x4
	mul $t0, $s0
	mflo $t2 # t2 = 3*x4*x5
	sub $t2, $a2, $t2 #t2 = x3 - 3*x4*x5
	mul $t1, $t2
	mflo $v0
	jr	$ra
