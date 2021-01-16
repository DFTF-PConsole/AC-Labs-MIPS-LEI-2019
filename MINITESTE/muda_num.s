.data


.text

.globl muda_num

muda_num:
	# a0 = ptr1, a1 = ptr2, a2 = dimensao, a3 = numero
	
	# maiores que numero e impares = numero
	
	move $s0, $a0
	li $t0, 0
	li $v0, 0
	
	Atalho1:
	lw $t1, 0($s0)
	
	ble $t1, $a3, Passa1
	andi $t2, $t1, 1
	beq $t2, $zero, Passa1
	sw $a3, 0($s0)
	addi $v0, $v0, 1
	
	Passa1:
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	blt $t0, $a2, Atalho1
	
	
	
	li $t0, 0
	move $s0, $a1
	
	Atalho2:
	lw $t1, 0($s0)
	
	ble $t1, $a3, Passa2
	andi $t2, $t1, 1
	beq $t2, $zero, Passa2
	sw $a3, 0($s0)
	addi $v0, $v0, 1

	Passa2:
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	blt $t0, $a2, Atalho2
	
	
jr $ra
