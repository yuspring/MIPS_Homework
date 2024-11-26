.data
	input_hint: .asciiz "Ender an integer:"
	output_hint: .asciiz "The output is:"

.text
main:
	
	li $v0, 4
	la $a0, input_hint
	syscall

	li $v0, 5
	syscall

	move $a0, $v0
	jal fact
	j print_num

print_num:
	move $t0, $v0
	li $v0, 4
	la $a0, output_hint
	syscall

	move $a0, $t0
	li $v0, 1
	syscall
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
	li $v0, 10
	syscall


