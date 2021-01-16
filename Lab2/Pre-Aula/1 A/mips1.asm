

.globl main

main:


	li $t0, 0x10010000 	# Armazena o Adreess inicial
	li $t1, 0x00FFFF00	# Armazena Cor Amarela (RGB: 00, R-FF, G-FF, B-00, Min: 00, Max: FF)
	
# Ecra: 256 X 128 ppp
	li $s1, 256	# Largura (Width)
	li $s2, 128	# Altura (Height)
	
# Quadrado: 30 X 20
	li $s3, 30 	# Largura
	li $s4, 20 	# Altura

# NOTAS:
# o segundo pixel da primeira linha está 4 bytes a frente em relação ao primeiro
# o primeiro pixel da segunda linha está 64 x 4 bytes adiantado em relação ao endereço base
# Resolução Efetiva 64 X 32
# Problema : Cobrir de Amarelo : 30 X 20 ppp
#
	




	.end main