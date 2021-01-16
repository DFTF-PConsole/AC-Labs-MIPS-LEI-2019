	.data
	
	.text
	.globl	Mandelbrot
	
Mandelbrot:
	#while i < n
	#z = square(z) + z0

	#Codigo da função aqui!
	li $s0, 0 #contador
	move $s1, $a0 #inicia resultado
	while:
		addi $s0, $s0, 1 #contador
		
		#guardar variaveis locais e argumentos na stack
		addi $sp, $sp, -24 #necessario guardar 2 argumentos, 2 variaveis locais e return addres, total de 5 words, alocação por convenção é alinhada à double word, alocam-se 6 words
		sw $a0, 4($sp) #guarda a0 na stack
		sw $a1, 8($sp) #guarda a1 na stack
		sw $s0, 12($sp) #guarda s0 na stack
		sw $s1, 16($sp)	#guarda s1 na stack
		sw $ra, 20($sp)	#guarda ra na stack
		move $fp, $sp #fp aponta a frame atual da stack, como foi alocado mais memoria tem que ser alinhado com o sp
		#carregar argumento da funcao square
		move $a0, $s1
		#chamar funcao
		jal square
		#recuperar variaveis locais e argumentos da stack
		lw $a0, 4($sp) #carrega a0 a partir do endereço da stack onde foi guardado previamente
		lw $a1, 8($sp) #carrega a1 a partir do endereço da stack onde foi guardado previamente
		lw $s0, 12($sp) #carrega s0 a partir do endereço da stack onde foi guardado previamente
		lw $s1, 16($sp)	#carrega s1 a partir do endereço da stack onde foi guardado previamente
		lw $ra, 20($sp)	#carrega ra a partir do endereço da stack onde foi guardado previamente
		addi $sp, $sp, 24 #remove memoria anteriormente alocada
		move $fp, $sp #reajusta frame pointer
		
		add $s1, $a0, $v0 #usar valor de return de square ($v0) e somar z0
		blt $s0, $a1, while #while expression
	#carregar return value
	move $v0, $s1
	jr	$ra #retornar

square:
	mul $a0, $a0
	mflo $v0
	jr $ra



