main:
	addiu	$sp,$sp,-24
	sw	$ra,20($sp)
	li	$v1,48038			
	li	$a0,-15694			
	li	$a1,51238			
$L2:
	addiu	$v0,$v1,-108
$L3:
	sh	$a0,0($v0)
	addiu	$v0,$v0,2
	bne	$v0,$v1,$L3
	addiu	$v1,$v1,160
	bne	$v1,$a1,$L2
	li	$a3,67			
	li	$a2,13			
	li	$a1,25			
	li	$a0,5			
	jal	bouncing_ball
	move	$v0,$zero
	lw	$ra,20($sp)
	addiu	$sp,$sp,24
	jr	$ra
