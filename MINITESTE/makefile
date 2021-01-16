programa.out : main.o muda_num.o
	gcc main.o muda_num.o -o programa.out

main.o : main.c
	gcc -c main.c -o main.o

muda_num.o : muda_num.s
	gcc -c muda_num.s -o muda_num.o