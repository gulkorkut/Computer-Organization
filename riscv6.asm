.data
    message: .ascii "Input: \n"
    out: .ascii "f(x) equals to "
    

.text
.globl	main

main:
    
    li        a0, 4
    la        a0, message
    ecall

    li        a0, 5
    ecall
 
    add      a0, a0,x0
    jal      function      
    add      t0, a0,x0     
    
    li        a0, 4
    la        a0, out
    ecall

    li        a0, 1        
    add      a0, t0,x0      
    ecall      

    li        a0, 10       
    ecall



function:
    addi    sp, sp, -8
    sw      ra, 4(sp)
    sw      a0, 0(sp)
    slti    t0, a0, 1
    beq     t0, zero, block
    addi    a0, zero, 5    
    addi    sp, sp, 8
    jr ra

block:
   
    addi    a0, a0, -1 
    jal     function
    lw      ra, 4(sp)
    lw      a0, 0(sp)
    addi    sp, sp, 8
    add     t1,a0 a0 
    add     a0 ,t1 , a0
    li      t1 , 0
    jr      ra