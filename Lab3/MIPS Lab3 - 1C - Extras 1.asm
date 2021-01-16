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
#	bit 4 -> segmento e | bit 5 -> segmento f | bit 6 -> segmento g | bit 7 -> ponto
#
#	Decimal		HEX	 Nº Segmento(7654 3210)	  Display - Binário (0000 0000)	 Display - Decimal	Display - Hexadecimal
#	0		0x00		--54 3210		0011 1111			063			0x3F
#	1		0x01		---- -21-		0000 0110			006			0x06
#	2		0x02		-6-4 3-10		0101 1011			091			0x5B
#	3		0x03		-6-- 3210		0100 1111			079			0x4F
#	4		0x04		-65- -21-		0110 0110			102			0x66
#	5		0x05		-65- 32-0		0110 1101			109			0x6D
#	6		0x06		-654 32-0		0111 1101			125			0x7D
#	7		0x07		---- -210		0000 0111			007			0x07
#	8		0x08		-654 3210		0111 1111			127			0x7F
#	9		0x09		-65- 3210		0110 1111			111			0x6F
#	10		0x0A		-654 -210		0111 0111			119			0x77
#	11		0x0B		-654 32--		0111 1100			124			0x7C
#	12		0x0C		--54 3--0		0011 1001			057			0x39
#	13		0x0D		-6-4 321-		0101 1110			094			0x5E
#	14		0x0E		-654 3--0		0111 1001			121			0x79
#	15		0x0F		-654 ---0		0111 0001			113			0x71

.data

ListaDigitos: .word 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113


.text

.globl main

main:
	li $s0, 0xFFFF0010			# Endereço da Memoria para acesso ao display da direita (de 7 segmentos)
	li $s1, 0xFFFF0011			# Endereço da Memoria para acesso ao display da esquerda (de 7 segmentos)
	li $s2, 16
	li $t1, 0
	li $t0, 0
	li $t2, 0
	
	la $s3, ListaDigitos
	move $t2, $s3
	
	CicloDigitos:
	
		lb $t0, ($t2)
		sb $t0, 1($s0)
	
		
		addi $t2, $t2, 4
		addi $t1, $t1, 1
		blt $t1, $s2, CicloDigitos
# Extra:	
	move $t2, $s3
	li $t1, 0
	blt $t1, $s2, CicloDigitos	# Ciclo Infinito
	
