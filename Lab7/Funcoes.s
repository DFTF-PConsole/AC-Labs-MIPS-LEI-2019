.data
	
.text
	.globl	max
	.globl	min
	
# Copiar os valores para $a0 at� $a3 - paramentros de entrada da funcao
# retorno dos dois valores em $v0 e $v1 - Neste caso apenas v0
	
	
	max:		#Codigo da fun��o max aqui!
	move $v0, $a0
	blt $a1, $v0, Max2
	move $v0, $a1
	
		Max2:
		blt $a2, $v0, Max3
		move $v0, $a2
		
			Max3:
			blt $a3, $v0, MaxFinal
			move $v0, $a3
			
	MaxFinal:
	jr $ra

# * * * * * *

	min:		#Codigo da fun��o min aqui!
	move $v0, $a0
	blt $v0, $a1, Min2
	move $v0, $a1
	
		Min2:
		blt $v0, $a2, Min3
		move $v0, $a2
		
			Min3:
			blt $v0, $a3, MinFinal
			move $v0, $a3
			
	MinFinal:
	jr $ra
