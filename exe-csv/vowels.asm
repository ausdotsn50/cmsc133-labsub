# Purpose: Counting vowels in a string
# Author: Angela Denise Almazan

.text
main:
	# Prompt the user to enter a string
	la $a0, prompt
	jal PromptString
	
	# Load immediate int (0)
	# --as index counter
	li $t0, 0
	li $t3, 0
	
	# vowel counter
	li $s0, 0
	
	str_loop:
		# t1 register contains curr char on inputString
		lb $t1, input($t0)
		
		# While not at the end of string
		beq $t1, '\0', end_loop
		
		# Evaluate
		inner_loop:
			lb $t2, vow_buffer($t3)
			
			beq $t1, $t2, inc_vowel
			beq $t2, '\0', end_inner
			
			j inc_inner
			
		inc_inner:
			addi $t3, $t3, 1
			j inner_loop
			
		inc_vowel:
			addi $s0, $s0, 1
			j inc_inner
		
		end_inner:
			li $t3, 0
			j increment		
	
	increment:
		addi $t0, $t0, 1
		j str_loop
	
	end_loop:
	
	la $a0, output
	move $a1, $s0
	jal PrintInt
	
	
	jal Exit
.data
	vow_buffer: .asciiz "aeiou"
	input: .space 15
	inputSize: .word 14
	prompt: .asciiz "Enter a string: "
	output: .asciiz "Vowel count: "

.include "../utils.asm"