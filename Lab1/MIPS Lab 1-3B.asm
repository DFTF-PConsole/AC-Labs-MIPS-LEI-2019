.text

main:
	li $t0, 0
	li $t1, 0
	li $s0, 0
	li $s1, 1
	
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	move $t0, $s0
	move $t1, $s0

	factorial:

		sub $t0, $t0, 1
		mul $t1, $t1, $t0

		blt $s1, $t0, factorial		# SE 1 < x
	
	li $v0, 1
	move $a0, $t1
	syscall
		
	
	




