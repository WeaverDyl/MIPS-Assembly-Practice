.data
	x: .word 0
	y: .word 0
	done: .asciiz "DONE!\n"

.text
	main:
		li $sp 0x7ffffffc # initialize the stack pointer
	
		li $t0 2 # x = 2
		sw $t0 x 
		
		li $t1 3 # y = 3
		sw $t1 y
		
		li $v0 1 # printf("%d", x);
		lw $a0 x
		syscall
		
		li $v0, 11 # printf(" ");
		li $a0, 32
		syscall
		
		li $v0 1 # printf("%d", y);
		lw $a0 y
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		jal dec_x # Call dec_x()
		
		li $v0 4 # printf("DONE!\n");
		la $a0 done
		syscall
		
		li $v0 10 # quit
		syscall
		
	dec_x:
		#prologue
		sub $sp $sp 8 # decrement the stack pointer`
		sw $ra 8($sp) # store the return address in the stack pointer
		sw $fp 4($sp) # store the frame pointer in the stack pointer
		add $fp $sp 8 # set new frame pointer
		
		sub $t0 $t0 1 # x--;
		sw $t0 x
		
		li $v0 1 # printf("%d", x);
		lw $a0 x
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		jal dec_y # Call dec_y
		
		# epilogue
		lw $ra 8($sp) # restore the old frame pointer
		lw $fp 4($sp) # restore the old frame pointer
		add $sp $sp 8 # increment the stack pointer
		jr $ra	      # return to the return address (caller)
		
	dec_y:
		#prologue
		sub $sp $sp 8 # decrement the stack pointer`
		sw $ra 8($sp) # store the return address in the stack pointer
		sw $fp 4($sp) # store the frame pointer in the stack pointer
		add $fp $sp 8 # set new frame pointer
		
		sub $t1 $t1 1 # y--;
		sw $t1 y
		
		li $v0 1 # printf("%d", y);
		lw $a0 y
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		# epilogue
		lw $ra 8($sp) # restore the old frame pointer
		lw $fp 4($sp) # restore the old frame pointer
		add $sp $sp 8 # increment the stack pointer
		jr $ra	      # return to the return address (caller)
		
		
		
	
