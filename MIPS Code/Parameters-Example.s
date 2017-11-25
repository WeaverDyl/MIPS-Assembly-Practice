.data
	done: .asciiz "DONE!\n"
	
.text
	main:
		li $sp 0x7ffffffc # Initialize the stack
		
		# ADD
		
		li $t0 3 # Load the argument into a register
		sw $t0 ($sp) # Load that register onto the stack
		sub $sp $sp 4 # Decrement the stack
		
		jal add_function # Call the add function
		
		add $sp $sp 4 # Return the stack to its original state
		
		move $t0 $v0 # Move the returned value into $t0
		
		li $v0 1 # printf("%d", result); (Result of add(3))
		move $a0 $t0 
		syscall
		
		li $v0 11 # printf("\n");
		li $a0 '\n'
		syscall
		
		# MULTIPLY
		
		li $t0 20 # Load the argument into a register
		sw $t0 ($sp) # Load that register onto the stack
		sub $sp $sp 4 # Decrement the stack
		
		jal multiply_function # Call multiply function
		
		add $sp $sp 4 # Return the stack to its original state
		
		move $t1 $v0 # Move the returned value into $t1
		
		li $v0 1 # printf("%d", result); (result of multiply(20))
		move $a0 $t1
		syscall
		
		li $v0 11 printf("\n");
		li $a0 '\n'
		syscall
		
		# DONE
		
		li $v0 4 # printf("DONE!\n");
		la $a0 done
		syscall
		
		li $v0 10 # Quit
		syscall
		
	add_function:
		sub $sp $sp 8 # Decrement the stack
		sw $ra 8($sp) # Store the return address on the stack
		sw $fp 4($sp) # Store the frame pointer on the stack
		add $fp $sp 8 # Set the new frame pointer
		
		lw $t0 4($fp) # Load the argument into $t0
		add $t0 $t0 $t0 # Add the argument to itself
		
		move $v0 $t0 # Move the value into $t0 so we can return it
		
		lw $ra 8($sp) # Restore the return address
		lw $fp 4($sp) # Restore the frame pointer
		add $sp $sp 8 # Increment the stack
		jr $ra # Jump back to the calling function (main, in this case)
		
	multiply_function:
		sub $sp $sp 8 # Decrement the stack
		sw $ra 8($sp) # Store the return address on the stack
		sw $fp 4($sp) # Store the frame pointer on the stack
		add $fp $sp 8 # Set the new frame pointer
		
		lw $t0 4($fp) # Load the argument into $t0
		mul $t0 $t0 $t0 # Multiply the argument by itself
		
		move $v0 $t0 # Move the value into $t0 so we can return it
		
		lw $ra 8($sp) # Restore the return addess
		lw $fp 4($sp) # Return the frame pointer
		add $sp $sp 8 # Increment the stack
		jr $ra # Jump back to the calling function (main, in this case)
	