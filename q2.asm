.data
    message: .string "Input: \n"
    out: .string "f(x) equals to "

.text
.globl	main

main:
    
   
    
            la a0, message	        # prepare to print string 
        li a7, 4			# print string
        ecall


           li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall

 
    add      a0, a0,x0         #input=0
    jal      function           #return to function
    add      t0, a7,x0          #mv 
      
     la a0, out	        # prepare to print string 
        li a7, 4			# print string
        ecall
        
        
        

    add      a0, t0,x0     #move
        li a7, 1			# Print integer. (the value is taken from a0)
        ecall 
        li        a7, 10  
        ecall 

j exit
 


function:
    addi    sp, sp, -8
    sw      ra, 4(sp)
    sw      a0, 0(sp)
    slti    t0, a0, 1
    beq     t0, zero, block   #if x=0
    addi    a7, zero, 5    # f(0)=5
    addi    sp, sp, 8
    jalr    x0,0(x1)

block:
   
    addi    a0, a0, -1 
    jal     function
    lw      ra, 4(sp)
    lw      a0, 0(sp)
    addi    sp, sp, 8
    add     t1,a7, a7 
    add     a7 ,t1 , a0
    li      t1 , 0
    jalr    x0,0(x1)
    
    exit:
