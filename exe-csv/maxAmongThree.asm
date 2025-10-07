# Purpose: Write a program that finds the maximum among three numbers
# Author: Angela Denise Almazan

.text
main:
	# Index counter
	li $t0, 1
	
	start:
		# Exit on the 4th iteration
		sne $t1, $t0, 4
		beqz $t1, end
		
		# Ask for integer inputs
		la $a0, prompt
		jal PromptInt
		
		# (Excludes iteration 1)
		# If 2nd iteration onwards
		# Will only branch out on second iteration
		seq $t1, $t0, 1
		beqz $t1, compare
		
		# First element and "max"
		move $s1, $v0
		
		j increment

	increment:
		addiu $t0, $t0, 1
		j start
	
	compare:
		move $s0, $v0
		sle $t3, $s0, $s1
		
		beqz $t3, set_to_max
		
		j increment
	
	set_to_max:
		move $s1, $s0
		
		j increment
		
	end:
	
	la $a0, output
	move $a1, $s1
	jal PrintInt
	
	jal Exit

.data
	test: .asciiz "Test: "
	prompt: .asciiz "Enter an integer: "
	output: .asciiz "Max is: "

.include "../utils.asm"
