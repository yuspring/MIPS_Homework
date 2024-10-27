main:
	li $s0, 5
	li $s1, 5
	li $s2, 0
	li $s3, 10
	li $s4, 10
	bne $s3,$s4, Not_Equal
	j Equal	

Equal:
	add $s2, $s0, $s1
	j End

Not_Equal:
	sub $s2, $s0, $s1
	j End

End:
	li $v0, 10
	syscall
