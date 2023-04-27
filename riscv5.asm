.global _start
_start:
          

        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
     
      #li a0, 6
        li a7, 1			# Print integer. (the value is taken from a0)
        ecall
            
        addi a7, zero, 93        #Exit process 
        addi a0, zero, 13
        ecall 
.data	
helloworld: 
	.ascii "Merhaba\n"

str1:         
	.space 255
