# COPYRIGHT @ DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

# ****************************************************************************

# O cabeÃ§alho da funÃ§Ã£o bin_img em C Ã©
#
# void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar);

.data
	
.text
	.globl	bin_img
	
# Codigo da funcao aqui	
	bin_img:
	# $a0 -> *ptr
	# $a1 -> w
	# $a2 -> h
	# $a3 -> limiar
	
	li $s0, 0					# x - CONTADOR >> h (height - Altura)
	li $s1, 0					# y - CONTADOR >> w (width - Largura)
	li $s2, 0					# k >> pre-calcular (endereço) para ponteiro
	li $s3, 0					# z >> valor que esta o ponteiro a apontar
	
	li $s4, 255					# valor -> 255 | $zero -> 0
	
	move $s5, $a0					# COPY: Endereço do Ponteiro inicial
	
		CicloH:
		li $s1, 0				# INICIAOCAO: y = 0
			
			CicloW:
			# *** k=(x*w+y) >> para ponteiro: ***
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
	jr $ra 		# VOLTA: Jump Register | Return Adress	

