.text
main:
	li $v0, 4 
	la $a0, prompt # This loads address of first character
	syscall
	
	li $v0, 8
	la $a0, input # $a0 tells the system where to put the string
	
	# Required to tell the system the max characters of the text
	lw $a1, inputSize # $a1 tells the system the maximum length (prevents buffer overflow)
	# Alternative li $a1, 20
	syscall
	
	# Output the first text
	li $v0, 4
	la $a0, output
	syscall
	
	# Output the second text
	li $v0, 4
	la $a0, input
	syscall
	
	# Exit the program
	li $v0, 10
	syscall
	
.data 
	prompt: .asciiz "Enter a string: "
	
	# memory (RAM)
	# hold input from the user
	# just like declaring an array
	input: .space 21	# equivalent to saving 20 characters for data
	inputSize: .word 20
	
	output: .asciiz "You typed: "
	