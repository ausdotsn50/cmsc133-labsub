# Prompts the user for a string and character then prints the character frequency.

.text
main: 
	# Prompt for the string
	li $v0, 4
	la $a0, promptStr
	syscall
	
	# Read string and store to buffer
	li $v0, 8
	la $a0, buffer
	li $a1, 50
	syscall
	
	# Prompt for a character
	li $v0, 4
	la $a0, promptChr
	syscall
	
	# Read character
	li $v0, 12
	syscall
	move $t0, $v0
	
	# Initialize counter and index
	li $t1, 0	# frequency counter
	li $t2, 0	# index
loop:
	lb $t3, buffer($t2)		# load the character to $t3 at index $t2 of the string
	beq $t3, '\0', print_result	# when string is empty
	
	beq $t3, $t0, incrementF 	# if character at index $t2 is equal to character $t0
	j next
	
incrementF:
	addiu $t1, $t1, 1
	
next:
	addiu $t2, $t2, 1
	j loop
	
print_result:
	li $v0, 4
	la $a0, result
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.data
promptStr: .asciiz "Enter a string: "
promptChr: .asciiz "\nEnter a character to count: "
result: .asciiz "\nFrequency: "
buffer: .space 50