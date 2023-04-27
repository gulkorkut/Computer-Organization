.data
strng:  .string "*"
space:  .string " "
line:  .string "\n"
.text 
#s2 = i
#s3 = j
#s4 = n (number of star step)
#t0,t1,t2 = temp size

  li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
     
      #li a0, 6
        #li a7, 1			# Print integer. (the value is taken from a0)
        #ecall
            
        

main:	
	add s2, x0, x0        # i =0
	add s3, x0, x0        # j = 0
	li a7, 1
	add  s4, s4, a0       # size = n


condition:
	add s3, x0, x0        #  j
	j forloop2

printSpace:		
	la a0, space   
	li a7, 4
	ecall
	j forloop2

printstrng:
	la a0, strng  #to print stars
	li a7, 4       
	ecall
	j forloop2	



forloop1:
	la a0, line        #print new line
	li a7, 4
	ecall

	addi	s2, s2, 1		   #i = i+1
	addi	t0, s4, 1		   #t0 = n+1
	blt   s2, t0, condition    #for(i < n+1) -> i<= n
	j exit		
			 
forloop2:
	addi s3, s3, 1	      #j = j+1
	addi t2, s2, 1	      #t2=1+i

	bge   s3, t2, forloop1   #for(j < i+i )
	sub  t1, s4, s2	      #t1=n-i
	   			
        j printstrng	

exit:
    	li a7, 10
    	ecall 
