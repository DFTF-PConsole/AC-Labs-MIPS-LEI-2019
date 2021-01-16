# COPYRIGHT © DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.
#
#
# void bin_img_asm(unsigned char *ptr, int w, int h);

.data
	
.text
	.globl	bin_img_asm
		# $a0 -> *ptr
		# $a1 -> w
		# $a2 -> h
		# limiar ???? -> $a3
	
bin_img_asm:
# CALCULA O LIMIAR (MEDIA):
	li $s0, 0					# x - CONTADOR >> h (height - Altura)
	li $s1, 0					# y - CONTADOR >> w (width - Largura)
	li $s2, 0					# k >> pre-calcular (endereço) para ponteiro
	li $s3, 0					# z >> valor que esta o ponteiro a apontar
	li $s4, 255					# valor -> 255 | $zero -> 0
	move $s5, $a0					# COPY: Endereço do Ponteiro inicial
	li $a3, 0					# SOMATORIO
	li $t0, 0					# CONTADOR TOTAL
	
	CicloH0:
		li $s1, 0				# INICIAOCAO: y = 0
			
		CicloW0:				# *** k=(x*w+y) >> para ponteiro: ***
			mul $s2, $s0, $a1		# k ($s2) = x*w
			add $s2, $s2, $s1		# k ($s2) = k + y
			move $s5, $a0			# Restaurar - Endereço do Ponteiro inicial
			add $s5, $s5, $s2		# Ponteiro Afinado
			lbu $s3, 0($s5)			# z = *ponteiro (valor)
			add $a3, $a3, $s3		# SOMATORIO
			
			add $t0, $t0, 1			# CONTADOR++
			add $s1, $s1, 1			# y++
			blt $s1, $a1, CicloW0		# SALTA CicloW: SE y < w
		add $s0, $s0, 1				# x++
		blt $s0, $a2, CicloH0			# SALTA CicloH: SE x < h
	
	div $a3, $t0					# SOMATORIO / CONTADOR
	mflo $a3					# $a3 ou LIMIAR = parte inteira (SOMATORIO / CONTADOR)

# MODIFICA A IMAGEM:
	li $s0, 0					# x - CONTADOR >> h (height - Altura)
	li $s1, 0					# y - CONTADOR >> w (width - Largura)
	li $s2, 0					# k >> pre-calcular (endereço) para ponteiro
	li $s3, 0					# z >> valor que esta o ponteiro a apontar
	li $s4, 255					# valor -> 255 | $zero -> 0
	move $s5, $a0					# COPY: Endereço do Ponteiro inicial
	
	CicloH:
		li $s1, 0				# INICIAOCAO: y = 0
			
		CicloW:					# *** k=(x*w+y) >> para ponteiro: ***
			mul $s2, $s0, $a1		# k ($s2) = x*w
			add $s2, $s2, $s1		# k ($s2) = k + y
			move $s5, $a0			# Restaurar - Endereço do Ponteiro inicial
			add $s5, $s5, $s2		# Ponteiro Afinado
			lbu $s3, 0($s5)			# z = *ponteiro (valor)
			ble $s3, $a3, LessLimiar	# SALTA SE: z <= Limiar 
			bgt $s3, $a3, GreaterLimiar	# SALTA SE: z > Limiar 
			Atalho:
			add $s1, $s1, 1			# y++
			blt $s1, $a1, CicloW		# SALTA CicloW: SE y < w
		add $s0, $s0, 1				# x++
		blt $s0, $a2, CicloH			# SALTA CicloH: SE x < h
		j fim					# JUMP -> fim
	
	LessLimiar:
	sb $zero, 0($s5)				# Store Byte: *ponteiro = 0
	j Atalho					# JUMP -> Atalho
	
	GreaterLimiar:
	sb $s4, 0($s5)					# Store Byte: *ponteiro = 255
	j Atalho					# JUMP -> Atalho
	
fim:
jr $ra 							# VOLTA: Jump Register | Return Adress	
