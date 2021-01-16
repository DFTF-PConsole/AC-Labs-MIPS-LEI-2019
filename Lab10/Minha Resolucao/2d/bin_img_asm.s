# COPYRIGHT © DÁRIO FÉLIX (DFTF@PConsole#)

# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

# void bin_img_asm(unsigned char *ptr, int w, int h);

###############################################################################################################
#	1. INSTRUCTION FETCH -> 2. INSTRUCTION DECODE -> 3. ALU -> 4. MEMORY ACCESS -> 5. REGISTER WRITE      #
#		-        ||Ler Regist, Instruct e <,> || +,/,*,<,> || Loads e Stores ||  Escrever Registos    #
###############################################################################################################

.data
	
.text
	.globl	bin_img_asm
		# $a0 -> *ptr
		# $a1 -> w
		# $a2 -> h
		# limiar ???? -> $a3
	
bin_img_asm:
.set noreorder		#No Reorder || para tirar este set: '.set reorder'  || 'NOP' -> Se nao conseguir utilizar o slot no delayed slot

# CALCULA O LIMIAR (MEDIA):
	#li $s0, 0					 x - CONTADOR >> h (height - Altura)
	#li $s1, 0					 y - CONTADOR >> w (width - Largura)
	#li $s2, 0					 k >> pre-calcular (endereço) para ponteiro
	#li $s3, 0					 z >> valor que esta o ponteiro a apontar
	#li $s4, 255					valor -> 255 | $zero -> 0
	#move $s5, $a0					COPY: Endereço do Ponteiro inicial
	#li $a3, 0					 SOMATORIO
	#li $t0, 0					 CONTADOR TOTAL
	
	CicloH0:
		
		CicloW0:				#  *** k=(x*w+y) >> para ponteiro: ***
			mul $s2, $s0, $a1		#[2,3,5]  k ($s2) = x*w
			move $s5, $a0			#[2,5]  Restaurar - Endereço do Ponteiro inicial
			add $s2, $s2, $s1		#[2,3,5]  k ($s2) = k + y
	
			add $s5, $s5, $s2		#[2,3,5]  Ponteiro Afinado
			add $t0, $t0, 1			#[2,3,5]  CONTADOR++
			lbu $s3, 0($s5)			#[4,5]  z = *ponteiro (valor)

			add $s1, $s1, 1			#[2,3,5]  y++
			add $t1, $t1, $s3		#[2,3,5]  SOMATORIO
			
			blt $s1, $a1, CicloW0		#[2(3)]  SALTA CicloW: SE y < w
			nop
		add $s0, $s0, 1				#[2,3,5]  x++	

		blt $s0, $a2, CicloH0			#[2(3)]  SALTA CicloH: SE x < h
		li $s1, 0				#[5]  INICIAOCAO: y = 0
		nop
		
	
	div $t1, $t0					#[2,3]  SOMATORIO / CONTADOR
	mflo $a3					#[2,5]  $a3 ou LIMIAR = parte inteira (SOMATORIO / CONTADOR)

# MODIFICA A IMAGEM:
	li $s0, 0					#[5]  x - CONTADOR >> h (height - Altura)
	li $s1, 0					#[5]  y - CONTADOR >> w (width - Largura)
	#li $s2, 0					[5]  k >> pre-calcular (endereço) para ponteiro
	#li $s3, 0					[5]  z >> valor que esta o ponteiro a apontar
	li $s4, 255					#[5]  valor -> 255 | $zero -> 0
	#move $s5, $a0					[2,5]  COPY: Endereço do Ponteiro inicial
	
	CicloH:
		
			
		CicloW:					#  *** k=(x*w+y) >> para ponteiro: ***
			mul $s2, $s0, $a1		#[2,3,5]  k ($s2) = x*w
			move $s5, $a0			#[2,5]  Restaurar - Endereço do Ponteiro inicial
			add $s2, $s2, $s1		#[2,3,5]  k ($s2) = k + y

			add $s1, $s1, 1			#[2,3,5]  y++
			
			add $s5, $s5, $s2		#[2,3,5]  Ponteiro Afinado
			
			lbu $s3, 0($s5)			#[4,5]  z = *ponteiro (valor)
			ble $s3, $a3, LessLimiar	#[2(3)]  SALTA SE: z <= Limiar
			nop
			sb $s4, 0($s5)					#[2,4]  Store Byte: *ponteiro = 255
			Atalho:
			blt $s1, $a1, CicloW		#[2(3)]  SALTA CicloW: SE y < w
			nop
		add $s0, $s0, 1				#[2,3,5]  x++
		blt $s0, $a2, CicloH			#[2(3)]  SALTA CicloH: SE x < h
		li $s1, 0				#[5]  INICIAOCAO: y = 0
		nop
		jr $ra 							#[2]  VOLTA: Jump Register | Return Adress	
		nop

	LessLimiar:
	sb $zero, 0($s5)				#[2,4]  Store Byte: *ponteiro = 0
	j Atalho					#[2]  JUMP -> Atalho
	nop
	