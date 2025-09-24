.text
main:
	li $v0, 4
	la $a0, prompt # Load prompt address to address $a0
	syscall # Print prompt
	# Syscall says read argument0 and print the string because (li $v0,4)
	
	li $v0, 5 # Load immediate 5, for reading integer
	syscall # Call reading integer
	move $s0, $v0 # Move from register $v0 to register $s0(saved values)
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1 # Load immediate 1, for printing integer
	move $a0, $s0 # Prev. stored in $s0 is the integer input
	syscall # $a0 would be printed
	
	# Exit the program
	li $v0, 10
	syscall

.data
	prompt: .asciiz "Enter an integer: "
	output: .asciiz "Output: "
