.text
main:
	addi $a0, $zero, 5
	jal fact
	j End
	
fact:
	addi $sp, $sp, -8 
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, L1
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra

L1:
	addi $a0, $a0, -1
	jal fact
	lw $a0, 0($sp)
	mul $v0, $a0, $v0
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

End:
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall


