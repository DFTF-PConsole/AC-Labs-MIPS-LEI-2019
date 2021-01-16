

# Magenta: 0x00FF00FF
# Azul: 0x000000FF


.text
	
	li $s0, 0x10010000
	li $s1, 0x00FF00FF
	li $s2, 0x000000FF
	li $s3, 64
	li $s4, 32
	li $s5, 256
	
	
	li $t0, 0
	li $t1, 0
	move $t2, $s0
	
#Cor Azul
	
LinhasAzul:
	add $t1, $t1, 1
	li $t0, 0
	
	ColunasAzul:
		add $t0, $t0, 1
		
		sw $s2, ($t2)
		
		add $t2, $t2, 4
		
		blt $t0, $s3, ColunasAzul
		
	move $t2, $s0
	add $t3, $t3, $s5
	add $t2, $t2, $t3
	
	blt $t1, $s4, LinhasAzul
	
	
#Quadrado Magenta

# Na Linha, as colunas variam: entre 28 - 36 (de 64 -> 256/4)
# N_Linhas: entre 12 - 20 (de 32 -> 128/4)

	li $s6, 8
	li $s7, 112	# 4 * 28
	li $t0, 0
	li $t1, 0
	li $t4, 28
	li $t5, 12
	li $t7, 2816	# 11 * 256
	
	move $t2, $s0
	
	
	
	
LinhasRosa:
	add $t1, $t1, 1
	li $t0, 0
	
	add $t7, $t7, 256	# Acumulador ( + 256 )
	move $t2, $s0
	add $t2, $t2, $t7
	add $t2, $t2, $s7
	
	
	ColunasRosa:
		add $t0, $t0, 1
		
		sw $s1, ($t2)
		
		add $t2, $t2, 4
		
		blt $t0, $s6, ColunasRosa
		
	
	
	blt $t1, $s6, LinhasRosa
		