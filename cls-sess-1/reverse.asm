.text
main:
	# Prints prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Read the 3-char string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# Output the string entered to verify
	# li $v0, 4
	# syscall
	
	# Output the text in reverse
	add $t0, $zero, $zero   # counter

readingloop:

        lb  $a0, input($t0)   # Read each character

        beq $a0, '\0', readingexit  # Make sure the string is not yet over

        addiu   $t0, $t0, 1     # i ++

j readingloop
readingexit:


reversingloop:
        li  $v0, 11     # Print a character you have read    
       
        subiu $t0, $t0, 1 # i--
        lb  $a0, input($t0)   
        syscall

        beq $t0, 0, reversingexit # Make sure the string 
                                       # Hasn't reached the first letter yet

j reversingloop
reversingexit:

	
	# Exit the program
	li $v0, 10
	syscall
	
	
.data
	input: .space 4
	inputSize: .word 
	prompt: .asciiz "Enter exactly 3 characters: "
	
