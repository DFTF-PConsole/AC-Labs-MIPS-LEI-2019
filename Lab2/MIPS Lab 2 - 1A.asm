
.text
	li $s0, 0x00FFFF00		# Cor Amarela
	li $s1, 0x10010000		# Adress Base
	li $s2, 64			# Colunas(||) ou Largura(|) -> (256 = 64*4)
	li $s3, 32			# Linhas(=) ou Comprimento(-) -> (128 = 32*4)
	li $s4, 30			# Numero de Colunas a preencher
	li $s5, 20			# Numero de Linhas a preencher
	li $s6, 256			# Numero de celulas de memoria (colunas) por linha
	
	li $t4, 0			# Variavel auxiliar
	li $t3, 0			# Inicio - Proxima Linha - Contador Total de celulas do endereço
	li $t2, 1			# Inicio - Contador de Linhas	
	move $t0, $s1			# Inicio - Copia do Adress Base
	li $t1, 1			# Inicio - Contador de COlunas

Linhas:
	li $t1, 1			# Inicio - Contador de COlunas
	
	Colunas:	
		sw $s0, ($t0)
		add $t0, $t0, 4
	
		add $t1, $t1, 1 	# Soma - Proxima Coluna
		blt $t1, $s4, Colunas	# If: N_Colunas < N_Colunas_Preencher (30) -> vai para "colunas:" | Else: Continua
	
	move $t0, $s1			# Copia do Adress Base
	mul $t3, $s6, $t2
	add $t0, $t0, $t3
	
	add $t2, $t2, 1			# Soma - Proxima Linha
	blt $t2, $s5, Linhas		# If: N_Linhas < N_Linhas_Preencher (20) -> vai para "linhas:" | Else: Fim
	
	
	
	