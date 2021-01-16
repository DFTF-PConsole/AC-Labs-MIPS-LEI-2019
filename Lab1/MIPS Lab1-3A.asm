

# * EM LINGUAGEM C *
# 
# #include <stdio.h>
# #include <stdlib.h>
# int main()
# {
#     int x, y, temp;
#     x = temp = y = 0;
#     printf("Qual o seu numero?: ");
#     scanf(" %d", &x);
#     y = (3*x) - 1;
#     for (temp = 0 ; temp <= y; temp++)
#     {
#         printf("%d \n", temp);
#     }
#     return 1;
# }

.data
enter: .asciiz "\n"

.text
main:
				# x $s0
				# y $s1
	li $t1, 0 		# temp
	
	# Ler Numero
	li $v0, 5
	syscall
	move $s0, $v0
	
	mul $t0, $s0, 3
	move $s1, $t0
	
	
	print:
	
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, enter
		syscall
	
		addi $t1, $t1, 1
		
		blt $t1, $s1, print
	
	
	