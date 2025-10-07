# Purpose: Solve for factorial of an integer N
# Author: Angela Denise Almazan

.text
main:
	# Prompt for N
	la $a0, prompt
	jal PromptInt
	move $t0, $v0
	
	# Print output 
	la $a0, output1
	move $a1, $t0
	jal PrintInt
	
	la $a0, output2
	
	li $t3, 1
	start_loop:
		# Set not equal curr number vs. zero
		# Store in register t2
		sne $t1, $t0, 1
		subiu $t2, $t0, 1
		
		beqz $t1, end_loop
		
		j factorial

	factorial:
		move $t2, $t3
		mul $t2, $t2, $t0
		subiu $t0, $t0, 1
		
		move $t3, $t2
		j start_loop
	
	end_loop:
	
	move $a1, $t3
	jal PrintInt
	
	jal Exit

.data
	prompt: .asciiz "Enter N to get its factorial: "
	output1: .asciiz "The factorial of "
	output2: .asciiz " is: "

.include "../utils.asm"