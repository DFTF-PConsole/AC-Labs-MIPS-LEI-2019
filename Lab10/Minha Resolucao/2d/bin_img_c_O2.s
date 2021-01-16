	.file	1 "bin_img_c.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0
	.text
	.align	2
	.globl	bin_img_c
	.set	nomips16
	.ent	bin_img_c
	.type	bin_img_c, @function
bin_img_c:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$6,$L17
	move	$9,$4

	move	$10,$0
	move	$7,$0
	move	$2,$0
	addiu	$11,$5,-1
$L3:
	blez	$5,$L6
	nop

	move	$3,$0
$L4:
	addu	$8,$9,$3
	lbu	$8,0($8)
	addiu	$3,$3,1
	bne	$3,$5,$L4
	addu	$7,$7,$8

	addiu	$2,$2,1
	addu	$2,$2,$11
$L6:
	addiu	$10,$10,1
	bne	$10,$6,$L3
	addu	$9,$9,$5

	div	$0,$7,$2
	teq	$2,$0,7
	move	$10,$0
	mflo	$7
	andi	$9,$7,0x00ff
$L7:
	blez	$5,$L10
	nop

	move	$2,$4
	move	$3,$0
$L9:
	lbu	$8,0($2)
	sltu	$8,$9,$8
	beq	$8,$0,$L8
	move	$7,$0

	li	$7,255			# 0xff
$L8:
	addiu	$3,$3,1
	sb	$7,0($2)
	bne	$3,$5,$L9
	addiu	$2,$2,1

$L10:
	addiu	$10,$10,1
	bne	$10,$6,$L7
	addu	$4,$4,$5

$L17:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	bin_img_c
	.size	bin_img_c, .-bin_img_c
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
