.global _start
_start:
	 la a0, message	        # prepare to print string  
          li a7, 4			# print string
          ecall
          
          li a0, 0 
          li a7,5            # take int
          ecall
          li a7, 1			# Print integer. (the value is taken from a0)
          ecall
          
        #  mv t1 , a0
	#  li t0 , 0
	  
	 la a0, char	        # prepare to print string  
          li a7, 4			# print string
          ecall
	 
outer:
	#beq t0,t1, endout
	#addi t0, t0, 1 	
	#li t2 , 0
	inner:
	
	#beq t2 , t0 , endin 
	#addi t2,t2, 1   
	#li a0, 4       
        #la a0, char
        #ecall 
       # jal a1 inner
       
       endin:

    ecall 

	endout:

    ecall
.data
	line: .ascii "\n"
	char: .ascii "*"
	message: .ascii"Value of N: "
