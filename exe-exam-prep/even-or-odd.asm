# Program File: even-or-odd.asm
# Author: Angela Denise Almazan
# Purpose: Identify if an integer is even or odd

.text
main:
	# Prompt user for an integer N
	la $a0, prompt
	jal PromptInt
	
	move $s0, $v0 # Save integer N on $s0
	li $t0, 2 # Load immediate int(2) for odd-even checking
	
	div $s0, $t0 # Perform division
	
	# lo contains quotient, hi contains remainder
	mfhi $s1
	
	seq $t1, $s1, $zero 		# seq --> set equal
	
	# Simple if-else conditional
	beqz $t1, else # (proceeds to an else statement
		#if block
		la $a0, even
		jal PrintString
		b end_if
		
		#else block
		else:
		la $a0, odd
		jal PrintString
	end_if:
	
	# Exits the program
	jal Exit
.data
	prompt: .asciiz "Enter an integer N: "
	even: .asciiz "Integer is even."
	odd: .asciiz "Integer is odd."

.include "../utils.asm"
