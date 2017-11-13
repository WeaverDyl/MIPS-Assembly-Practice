.data
begin: .asciiz "Enter a number:\n"
middle: .asciiz "\nEnter a multiplying factor:\n"
ending: .asciiz "\nYour number multiplied by the factor is:\n"

ask_repeat: .asciiz "\n\nWant to try again? (0 = yes, anything else = no)\n"
goodbye: .asciiz "\n\nGoodbye!\n"

.text

main: 
	  li $v0 4 # Begin printing the string begin
	  la $a0 begin # Load the address of the string
	  syscall # Print it
	  
	  li $v0 5 # Begin reading an int
	  syscall # Read the int
	  
	  move $t0 $v0 # Move the int from $v0 to $t0
	  
	  li $v0 4 # Begin printing the string middle
	  la $a0 middle # Load the address of the string
	  syscall # Print it
	  
	  li $v0 5 # Begin reading factor
	  syscall # Read the factor
	  
	  move $t1 $v0 # Move the factor into $t1
	  
	  mul $t0 $t0 $t1 # Multiply $t0 by the factor specified
	  
	  li $v0 4 # Begin printing the ending string
	  la $a0 ending # Load the address of the string
	  syscall # Print it
	  
	  li $v0 1 # Begin printing the int
	  move $a0 $t0 # Move the int to print into $a0
	  syscall # Print it
	  
	  j ask_to_repeat # Ask user if they want to repeat
	  
ask_to_repeat: 
	  li $v0 4 # Begin printing the string begin
	  la $a0 ask_repeat # Load the address of the string
	  syscall # Print it
	  
	  li $v0 5 # Begin reading answer
	  syscall # Read the answer
	  
	  move $t0 $v0 # Move the answer to $t0
	  
	  beqz $t0 main # Branch to main if answer was 0
	  
	  li $v0 4 # Begin printing the string goodbye
	  la $a0 goodbye # Load the address of the string
	  syscall # Print it

	  li $v0 10 # Quit
	  syscall