#													    [Off]   Byte: 0000 0000
# No Adress do Display cabe 1 Byte = 8 bits (2^7=128 | 2^6=64 | 2^5=32 | 2^4=16 | 2^3=8 | 2^2=4 | 2^1=2 | 2^0=1) -> 0 0 0 0 0 0 0 0
#													   Local:   7 6 5 4 3 2 1 0
#					     Nota: Todos os segmentos ativados [On] -> Byte: 1111 1111
#	 _		   _0	
#	|_|		5| _6 |1
#	|_|.		4| _ |2   .7
#			   3
#
#	bit 0 -> segmento a | bit 1 -> segmento b | bit 2 -> segmento c | bit 3 -> segmento d 
#	bit 4 -> segmento e | bit 5 -> segmento f | bit 6 -> segmento g | bit 7 -> segmento h (ponto) 
#


.text

	li $s0, 0xFFFF0010			# Endereço da Memoria para acesso ao display da direita (de 8 segmentos)
	li $s1, 0xFFFF0011			# Endereço da Memoria para acesso ao display da esquerda (de 8 segmentos)
	li $s2, 8
	li $t1, 0
	li $t0, 1
	
BitaBit:
	
	sw $t0, ($s0)
	
	sll $t0, $t0, 1
	
	add $t1, $t1, 1
	blt $t1, $s2, BitaBit
	
	
	li $t1, 0
	li $t0, 0
	sw $t0, ($s0)
	
	li $t0, 1
	blt $t1, $s2, BitaBit			# Ciclo Infinito