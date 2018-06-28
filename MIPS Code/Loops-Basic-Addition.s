.data
	x: .word 0
	y: .word 0
	sum: .word 0

.text
	main:
		lw $t0 x
		lw $t1 y
		lw $t2 sum
	
		li $v0 5 		# scanf("%d", &x);
		syscall
		move $t0 $v0
		
		li $v0 5 		# scanf("%d", &y);
		syscall
		move $t1 $v0
		
		sw $t0 x
		sw $t0 y
		
	loop:
		bgt $t0 $t1 end_loop 	# if (x > y) goto end_loop
		
		add $t2 $t2 $t0
		add $t0 $t0 1
		
		j loop
		
	end_loop:
		sw $t0 x
		sw $t1 y
		sw $t2 sum
	
		li $v0 1 		# printf("%d", sum);
		move $a0 $t2
		syscall
		
		li $v0 12 		# printf("\n");
		li $a0 '\n'
		syscall
		
		li $v0 10 		# return 0;
		syscall
