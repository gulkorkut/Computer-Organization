.data
length:	.word	1	
array:	.word	0 : 150	
newline:	.string	"\n"	
space:	.string "  "		
	
message:	.string	"Array Size: "
number:	.string	"\nNumber: "

.text
.globl	main

main:		
	
	la a0, message	        # prepare to print string 
        li a7, 4			# print string
        ecall

	
									
	li	a7, 5			
	ecall	
				
	la	s9, length		
	sw	a0, 0(s9)		#array lenght
	li	t0, 0			
	lw	s8, length		
	la	s9, array
	li  s0, 1
	li  s1, 4		

input_loop:

	beq	t0, s8, out
	li	a7, 4	
			
	
	
		
        la a0, number	        # prepare to print string 
        			# print string
        ecall

	
	
	li	a7, 5			
	ecall	
	
							
	sw	a0, 0(s9)	   #numbers stored in array
	add	t0, t0, s0	
	add	s9, s9, s1		
	j	input_loop	

out:

	add	t0, s0	,x0          # move 
	lw	    s8, length		
			

outer_loop:

	la	s9, array		
	beq	t0, s8, endout	
	mv	t1, t0		

inner_loop:

	slli	t2, t1, 2	#multiply by 4
	la	s9, array		
	add	s9, s9, t2		
	beq	zero, t1, endin
	lw	t3, 0(s9)		
	lw	t4, -4(s9)		
	bge	t3, t4, endin	
	lw	t5, 0(s9)
	sw	t4, 0(s9)
	sw	t5, -4(s9)
	addi	t1, t1, -1
	j	inner_loop		

endin:

	add	t0, t0, s0		
	j	outer_loop		

endout:	

	
        la a0, newline	        # prepare to print string 
        li a7, 4			# print string
        ecall

				
	li	t0, 0
	lw	s8, length
	la	s9, array
	
print_loop:

	beq	t0, s8, complete
	
	li	a7, 1
	lw	a0, 0(s9)
	ecall
	
	li	a7, 4
	la	a0, space
	ecall
	add 	s9, s9, s1
	add 	t0, t0, s0
	j	print_loop
	
complete:
	li	a7, 10			
	ecall
