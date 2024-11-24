main:
	addi $s0, $zero, 5
	jal fact
	j End
	
fact:
	addi $sp, $sp, -8 
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	slti $t0, $s0, 1
	beq $t0, $zero, L1
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra

L1:
	addi $s0, $s0, -1
	jal fact
	lw $s0, 4($sp)
	mul $v0, $a0, $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra

End:
	li $v0, 10
	syscall


