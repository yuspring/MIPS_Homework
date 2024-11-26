#    C bubble sort pseudo code
#
#    for (int i = 0; i < n - 1; i++) {
#        for (int j = 0; j < n - i - 1; j++) {
#            if (arr[j] > arr[j + 1]) {
#                swap(j, j+1);
#            }
#        }
#    }


.data
    array: .word 4, 1, 3, 6 ,7, 8 
    length: .word 6
    space: .asciiz " "
.text

main:
    jal sort
    j End

sort:
    # s0: i, s2: array, s3: length 
    #define array and length

    #make stack
    addi $sp, $sp , -20     
    sw $ra, 16($sp)
    sw $s3, 12($sp)
    sw $s2, 8($sp)
    sw $s1, 4($sp)
    sw $s0, 0($sp)
    la $s2, array
    lw $s3, length
    move $s0, $zero             # i = 0

loop_i:
    # t0: length temp, t1: compare temp

    addi $t0, $s3, -1           # t0 = length - 1
    slt  $t1, $s0, $t0          # if i < length - 1, t1 = 1
    beq  $t1, $zero, exit_i     # if t1 == 0, jump exit1
    move $s1, $zero             # j = 0
    j loop_j

loop_j:
    # t2: array temp, t3: arr[j] temp, t4: arr[j+1] temp

    sub  $t0, $s3, $s0          # t0 = length - i  
    addi $t0, $t0, -1           # t0 = t0 - 1 
    slt  $t1, $s1, $t0          # if j < n - i - 1, t1 = 1
    beq  $t1, $zero, exit_j     # t0 == 0, jump exit2

    # get arr[j]
    sll  $t2, $s1, 2
    add  $t2, $t2, $s2
    lw   $t3, 0($t2)

    # get arr[j+1]
    lw   $t4, 4($t2)
    
    # if arr[j] > arr[j+1], t1 = 1
    # if t1 == 0, jump next_j
    slt $t1, $t4, $t3
    beq $t1, $zero, next_j

    # if t1 == 1, swap(j,j+1)
    move $a0, $s2
    move $a1, $s1
    jal swap

next_j:
    addi $s1, $s1, 1            # j++
    j loop_j

exit_j:
    addi $s0, $s0, 1            # i++
    j loop_i                    # jump loop1

exit_i:
    jal print_array

    #clear stack
    lw $s0, 0($sp)              
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $ra, 16($sp)
    addi $sp, $sp, 20
    jr $ra

swap:
    sll $t1, $a1, 2
    add $t1, $a0, $t1
    lw  $t0, 0($t1)
    lw  $t2, 4($t1)
    sw  $t2, 0($t1)
    sw  $t0, 4($t1)
    jr $ra

print_array:
    la $t0, array               # load array
    lw $t1, length              # load length
    move $t2, $zero             # t2 = 0
    j print_loop          

print_loop:
    # if t1 < t2, jump end_print_loop
    slt $t3, $t2, $t1      
    beq $t3, $zero, end_print_loop

    # get array[t1]
    sll $t4, $t2, 2        
    add $t5, $t0, $t4      
    lw $a0, 0($t5)         

    #print number
    li $v0, 1              
    syscall                

    #print space
    la $a0, space          
    li $v0, 4              
    syscall

    addi $t2, $t2, 1            #t2++ 
    j print_loop           

end_print_loop:
    jr $ra                      

End:
    li $v0, 10
	syscall