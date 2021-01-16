# Cor RGB: R-RED , G-GREEN, B-BLUE
# Hex: 0x00000000 (Preto), 0x 00(null) 00(R: 00[65.536] - FF[16.777.215]) 00(G: 00[65.535] - FF[]) 00(B: 00[0] - FF[255])
#
.text

	li $s0, 0x10010000			# Adress Base
	li $s1, 256				# Numero de celulas de memoria (colunas) por linha
	li $s2, 65				# Colunas(||) ou Largura(|) -> (256 = 64*4) (+1)
	li $s3, 33				# Linhas(=) ou Comprimento(-) -> (128 = 32*4) (+1)
	li $s4, 256				# Geral - Inicio - Cor Verde
	li $s5, 65536				# Geral - Inicio - Cor Vermelha
	li $s6, 1024				# Geral - Cor Verde (256*4)
	li $s7, 262144				# Geral - Inicio - Cor Vermelha

	
	li $t9, 0				# Inicio - Cor Efetiva
	li $t8, 0				# Auxiliar
	li $t7, 0				# Auxiliar
	li $t3, 0				# Inicio - Proxima Linha - Contador Total de celulas do endereço
	li $t2, 1				# Inicio - Contador de Linhas	
	move $t0, $s0				# Inicio - Copia do Adress Base
	li $t1, 1				# Inicio - Contador de COlunas

Linhas:
	li $t1, 1				# Inicio - Contador de COlunas
	
	# Cor Vermelha (0x00??--00) = N_linha * 4
	li $t9, 0
	mul $t7, $t2, 4
	mul $t7, $t7, $s5
	add $t9, $t9, $t7	
	
	Colunas:	
		sw $t9, ($t0)
		add $t0, $t0, 4
	
		# Cor Verde (0x00--??00) = N_coluna * 4
		#ERRO mul $t7, $t1, 4
		#ERRO mul $t6, $t7, $s4
		add $t9, $t9, $s6
		
	
	
		add $t1, $t1, 1 		# Soma - Proxima Coluna
		blt $t1, $s2, Colunas		# If: N_Colunas < N_Colunas_Preencher (64) -> vai para "colunas:" | Else: Continua
	
	move $t0, $s0				# Copia do Adress Base
	mul $t3, $s1, $t2
	add $t0, $t0, $t3
	
	
	
	add $t2, $t2, 1				# Soma - Proxima Linha
	blt $t2, $s3, Linhas			# If: N_Linhas < N_Linhas_Preencher (32) -> vai para "linhas:" | Else: Fim