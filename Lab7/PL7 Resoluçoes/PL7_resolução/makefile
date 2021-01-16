exe: PolyCalc.o lab8_3.o programa.o
	gcc -o exe lab8_3.o programa.o PolyCalc.o
PolyCalc.o: PolyCalc.s
	gcc -c PolyCalc.s
lab8_3.o: lab8_3.c
	gcc -c lab8_3.c
programa.o: programa.s
	gcc -c programa.s