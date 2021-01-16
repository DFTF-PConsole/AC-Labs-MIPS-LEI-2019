# YOU MAY THINK THAT THIS FUNCTION IS OBSOLETE, AND DOESN'T SEEM TO DO ANYTHING.
# AND YOU WOULD BE CORRECT. BUT WHEN WE REMOVE THIS FUNCTION, FOR SOME REASON, 
# THE WHOLE PROGRAM CRASHES AND WE CANT FIGURE OUT WHY, SO HERE IT WILL STAY.

.data					# Dados Extra-Programa -> (Sem Dados) Ex.: Para Print: usar -> frase: .ascii "abcd"

.text					# *** Inicio Programa: ***
	.globl	programa		# Nome-Funcao Principal (main) - ID Exterior (para jump)
	
# Codigo da função aqui	
	programa:		
		addi $sp, $sp, -48	# Criar Stack: 8(double word) x 5 variaveis = 40 (+ 8 = 48)
		sw $ra, 40($sp)		# Guardar $ra na Stack -> retorno adress (lab7_3.c)
		
		move $t0, $a0		# a0 -> Vetor com 5 elementos
		lw $a0, 0($t0)		# Elemento 1
		lw $a1, 4($t0)		# Elemento 2
		lw $a2, 8($t0)		# Elemento 3
		lw $a3, 12($t0)		# Elemento 4
		lw $t1, 16($t0)		# Elemento 5 -> registador temporario
		
		sw $t1, 32($sp)		# Guardar Elem. 5 na Stack

# *** Jump para Ficheiro: PolyCalc.s ***		
		jal PolyCalc 		# Jump and Link: Jump para ficheiro (PolyCalc.s) | Set $ra -> Link: Este Ficheiro (programa.s)
		
		lw $ra, 40($sp)		# Backup $ra -> LINK: (lab7_3.c)
		addi $sp, $sp, 48	# Fechar Stack

	jr $ra				# Retorno (Jump Register) - Link: lab7_3.c
	
# NOTAS: Nao se chega a usar toda a Stack...
# $sp -> Ponteiro do Stack 
# $ra -> Link de retorno para a funcao chamante[lab7_3.c] (é a que chama a funcao chamada[progama.s])
# main() -> int programa(int*) -> int PolyCalc(int,int,int,int,int)
# $v0 (e $v1) -> Registadores com valores de Return desta funcaçao (output) | aquando executado: jr $ra
