# This was previously done using the mul instruction, but it's more interesting (to me) to use a loop

.data
	ask_number_begin: .asciiz "Enter a number:\n"
	ask_factor: .asciiz "\nEnter a multiplying factor:\n"
	result_string: .asciiz "\nThe number multipled by the factor is:\n"
	
	ask_repeat: .asciiz "\nWould you like to try again? (0 = yes)\n"
	
	number: .word 0
	factor: .word 0
	result: .word 0
	current_iteration: .word 0
	repeat: .word 1

.text
	main:
		lw $t0 number
		lw $t1 factor
		lw $t2 result
		lw $t3 current_iteration
		lw $t4 repeat
		
		li $t0 0 # Handles resetting the variables in case the user repeats
		li $t1 0
		li $t2 0
		li $t3 0
		li $t4 1
	
		li $v0 4 # printf("%s", ask_number_begin);
		la $a0 ask_number_begin
		syscall
		
		li $v0 5 # scanf("%d", number);
		syscall
		move $t0 $v0
		
		li $v0 4 # printf("%s", ask_factor);
		la $a0 ask_factor
		syscall
		
		li $v0 5 # scanf("%d", factor);
		syscall
		move $t1 $v0
		
		sw $t0 number # Store the two numbers
		sw $t1 factor
		
	loop:
		beq $t1 $t3 end_loop # if (factor == current_iteration) goto end_loop
		add $t2 $t2 $t0 # result += number
		add $t3 $t3 1 # current_iteration += 1
		
		sw $t2 result
		sw $t3 current_iteration
		
		j loop
		
	end_loop:
		li $v0 4 # printf("%s", result_string);
		la $a0 result_string
		syscall
		
		li $v0 1 # printf("%d", result)
		move $a0 $t2
		syscall
		
		# HANDLE REPEAT
		li $v0 4 # printf("%s", ask_repeat);
		la $a0 ask_repeat
		syscall
		
		li $v0 5 # scanf("%d", repeat);
		syscall
		move $t4 $v0
		
		beqz $t4 main # if (repeat == 0) goto main
		
		li $v0 10
		syscall