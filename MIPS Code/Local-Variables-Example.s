.data
	done: .asciiz "DONE!\n"

.text
	main:
		li $sp 0x7ffffffc # Initialize stack pointer
	
		jal test # Call test function
		
		li $v0 4 # printf("DONE!\n");
		la $a0 done
		syscall
		
		li $v0 10 # quit
		syscall
		
	test:
		sub $sp $sp 20 # Decrement stack pointer to store ra, fp, and local variables
		sw $ra 20($sp) # Store the return address in the stack
 		sw $fp 16($sp) # Store the frame pointer in the stack
		add $fp $sp 20 # Set the new frame pointer
		
		li $t0 0 # Set the value of 'a'
		sw $t0 12($sp) # Store 'a' in the stack
		
		li $t1 2 # Set the value of 'b'
		sw $t1 8($sp) # Store 'b' in the stack
		
		li $t2 50 # Set the value of 'c'
		sw $t2 4($sp) # Store 'c' in the stack
		
	loop:
		bge $t1 $t2 end_while # if (b >= c) goto end_while
		
		li $v0 1 # printf("%d", a);
		move $a0 $t0
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		li $v0 1 # printf("%d", b);
		move $a0 $t1
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		add $t0 $t0 $t1 # a = a + b
		add $t1 $t1 $t0 # b = b + a
		
		sw $t0 12($sp) # Store the new value of 'a' in the stack
		sw $t1 8($sp) # Store the new value of 'b' in the stack
		
		j loop
		
	end_while:
		lw $ra 20($sp) # Restore the return address
		lw $fp 16($sp) # Restore the frame pointer
		add $sp $sp 20 # Increment the stack
		jr $ra # Return to main
		