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
	
	
	li $s0, 0x10010000
	li $s2, 0x00FF00FF
	li $s1, 0x000000FF
	li $s3, 64
	li $s4, 32
	li $s5, 256
	
	
	li $t0, 0
	li $t1, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	move $t2, $s0
	
#Cor Azul
	
LinhasAzu:
	add $t1, $t1, 1
	li $t0, 0
	
	ColunasAzu:
		add $t0, $t0, 1
		
		sw $s2, ($t2)
		
		add $t2, $t2, 4
		
		blt $t0, $s3, ColunasAzu
		
	move $t2, $s0
	add $t3, $t3, $s5
	add $t2, $t2, $t3
	
	blt $t1, $s4, LinhasAzu