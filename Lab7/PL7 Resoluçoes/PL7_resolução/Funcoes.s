	.data
	
	.text
	.globl	max
	.globl	min
	
max:

	# Codigo da função max aqui!
	# Copiar os valores para $a0 até $a3
	# retorno dos dois valores em $v0 e $v1
	li	$v0, 0
	add	 $v0,$a0,$zero
	blt	 $a1, $v0, a2_max
	add	 $v0, $a1, $zero
a2_max:
	blt 	$a2, $v0, a3_max
	add	$v0, $a2, $zero
a3_max:
	blt	$a3, $v0, fim_max
	add	$v0, $a3, $zero
fim_max:
	jr	$ra

min:
	#Codigo da função min aqui!

	add 	$v0, $a0, $zero
	blt	$v0, $a1, a2_min
	add	$v0, $a1, $zero
a2_min:
	blt	$v0, $a2, a3_min
	add	$v0, $a2, $zero
a3_min:
	blt	$v0, $a3, fim_min
	add	$v0, $a3, $zero
fim_min:
	jr	$ra
