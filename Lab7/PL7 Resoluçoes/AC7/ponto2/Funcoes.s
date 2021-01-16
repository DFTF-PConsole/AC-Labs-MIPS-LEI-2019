	.data
	
	.text
	.globl	max
	.globl	min
	
max:

	#Codigo da função max aqui!
    		move $v0, $a0
    	ver1:
    		ble $a1, $v0, ver2
    		move $v0, $a1
    	ver2:
    		ble $a2, $v0, ver3
    		move $v0, $a2
    	ver3:
    		ble $a3, $v0, ver4
    		move $v0, $a3
    	ver4:
	jr	$ra

min:

	#Codigo da função min aqui!
		move $v0, $a0
    	see1:
    		bge $a1, $v0, see2
    		move $v0, $a1
    	see2:
    		bge $a2, $v0, see3
    		move $v0, $a2
    	see3:
    		bge $a3, $v0, see4
    		move $v0, $a3
    	see4:
	jr	$ra
