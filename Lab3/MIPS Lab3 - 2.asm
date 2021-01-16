
# Teclado Virtual - O resultado lido se houver tecla premida será o composto por o número da linha (nibble menos significativo) 
# e o número da coluna (nibble mais significativo), ou seja:
#		* Codigos: *
# BINARIO:
#					     Colunas                                      1  2  3  4
#	L		 1		2		3		4 		 ------------
#	i	1    0001 0001	    0010 0001       0100 0001       1000 0001	      1 | 0  1  2  3 |
#	n	2    0001 0010	    0010 0010       0100 0010       1000 0010	      2 | 4  5  6  7 |
#	h	3    0001 0100	    0010 0100       0100 0100       1000 0100	      3 | 8  9  A  B |
#	a	4    0001 1000	    0010 1000       0100 1000       1000 1000	      4 | C  D  E  F |
#	s										 ------------
#	
# HEXADECIMAL:
#					      Colunas
#	L		 1		2		3		4 		 ------------
#	i	1      0x11	      0x21            0x41             0x81		| 0  1  2  3 |
#	n	2      0x12	      0x22            0x42             0x82		| 4  5  6  7 |
#	h	3      0x14	      0x24            0x44             0x84		| 8  9  A  B |
#	a	4      0x18	      0x28            0x48             0x88		| C  D  E  F |
#	s										 ------------
#
# DECIMAL:
#					      Colunas
#	L		 1		2		3		4 		 ------------
#	i	1    	17	       33               65             129		| 0  1  2  3 |
#	n	2    	18	       34               66             130		| 4  5  6  7 |
#	h	3    	20	       36               68             132		| 8  9  A  B |
#	a	4    	24	       40               72             136		| C  D  E  F |
#	s										 ------------
#

.data

	ListaDigitos: .word 0, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113
	ListaCodigos: .word 0, 17, 33, 65, 129, 18, 34, 66, 130, 20, 36, 68, 132, 24, 40, 72, 136

#NaoUsado	TesteLinhas: .word 1, 2, 4, 8		# (Bits: 0001 >> 1000 | 1,2,4,8 -> Linha: 1,2,3,4)

#NaoUsado	Linha1: .word 17, 33, 65, 129
#NaoUsado	Linha2: .word 18, 34, 66, 130
#NaoUsado	Linha3: .word 20, 36, 68, 132
#NaoUsado	Linha4: .word 24, 40, 72, 136

.text

	.globl main
	
	main:
	
	li $s0, 0xFFFF0010		# Adress [Store] Display Direita
	li $s1, 0xFFFF0011		# Adress [Store] Display Esquerda
	li $s2, 0xFFFF0012		# Adress [Store] Linha a Testar do Teclado
	li $s3, 0xFFFF0014		# Adress [Load] Valor da Tecla (Coluna/Linha)
	
	li $t0, 1			# Reset | Valor da Linha a Testar
	li $t1, 1			# Reset | Contador da linha a testar
	li $t2, 0			# Valor Codigo efetivo
	li $t3, 0			# Reset | Contador do digito
	li $t4, 0 			# Valor do codigo na lista a testar
	li $t6, 0
	li $t8, 0
	
	la $t5, ListaCodigos
	la $t7, ListaDigitos
	



		
	CicloLinha:
		sb $t0, ($s2)			# Store Valor da Linha a Testar no Adress
	
		lw $t2, ($s3)
		
		li $t3, 0			# Reset | Contador do digito
		la $t5, ListaCodigos
		
		CicloCodigo:
			lb $t4, ($t5)
		
			beq $t2, $t4, Display
			
			add $t3, $t3, 1
			add $t5, $t5, 4
			blt $t3, 17, CicloCodigo
	
		sll $t0, $t0, 1
		addi $t1, $t1, 1
		
		blt $t1, 5, CicloLinha
		beq $t1, 5, main
		
		#PreDisplay:
		#$t9
		Display:
			#move $t9, 
			mul $t8, $t3, 4
			add $t7, $t7, $t8
			lb $t6, ($t7)
			sb $t6, ($s0)
			
		
	beq $zero, $zero, main
	
	
