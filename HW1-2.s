.data
save:
	.word 1, 2, 2, 3, 4


.text
main:
	li $s3, 0
	li $s5, 4 
	la $s6, save
	j Loop

Loop:
	sll $t1, $s3, 2
	add $t1, $t1, $s6 
	lw $t0, 0($t1)	
	beq $t0, $s5, End
	addi $s3,$s3, 1
	j Loop

End:
	li $v0, 10
	syscall
