# void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar);

	.data
	
	.text
	.globl	bin_img
	
bin_img:
	#O c�digo da fun��o aqui	
	move $s0, $a0 #s0 � pointer
	mul $a1, $a2
	mflo $s1 #s1 tem resultado da multiplicacao de width por height
	li $t0, 0 #t0 � contador
	li $s2, 0
	li $s3, 255
	while:
		lbu $t1, 0($s0) #t1 � valor a testar, load byte unsigned
		blt $t1, $a3, lower                                                                                                                                     		
		sb $s3, 0($s0)
		j end_if
		lower:
		sb $s2, 0($s0)
		end_if:
		addi $s0, $s0, 1
		addi $t0, $t0, 1
		blt $t0, $s1, while
fim:
	jr	$ra

