main:
	li $s0, 0
	li $s1, 10
	li $s2, 5
	li $s3, 10
	li $s4, 10
	beq $s3,$s4, Equal
	j Not_Equal	

Equal:
	add $s0, $s1, $s2
	j End

Not_Equal:
	sub $s0, $s1, $s2
	j End

End:
	li $v0, 10
	syscall
