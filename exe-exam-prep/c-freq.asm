# Program File: c-freq.asm
# Author: Angela Denise Almazan
# Purpose: Counting frequency of character 'c' in a string

# All memory access in MIPS in done through some form of a load or store opertoar. These
# operators include loading/storing a: byte (lb, sb); half word (lh, sh); word (lw, sw); or double
# word (ld, sd)20

.text
main:
	# Print prompt
	la $a0, prompt
	jal PrintString
	
	# Read user-input string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# String index counter
	li $t0, 0
	
	# Character 'c' counter
	li $t1, 0
	
	# Character 'c'
	li $t2, 'c'
	
	# Loop over user-input string
	# Check for 'c' characters
	read_string:
		lb $t3, input($t0)	# Use temporary register for temporary calculations
		beq $t3, '\0', end_read # Branch(to end_read) if equal to NULL character
				
		beq $t3, $t2, increment # Branch(to increment) if character in (input) is equiv. to 'c'
		
		addiu $t0, $t0, 1     # i++ [ when in read_string ]
		b read_string # Continue the loop
	
	increment:
		addiu $t0, $t0, 1	# i++ [ when in increment ]
		addiu $t1, $t1, 1	
		b read_string
	end_read:
	
	la $a0, length
	subi $t0, $t0, 1 # Exclude null character
	move $a1, $t0
	jal PrintInt
	
	la $a0, cNum
	move $a1, $t1
	jal PrintInt
	
	jal Exit

.data
	prompt: .asciiz "Enter a string: "
	input: .space 51
	inputSize: .word 50
	
	length: .asciiz "Length: "
	cNum: .asciiz "\nFrequency of 'c': "
	
.include "../utils.asm"
