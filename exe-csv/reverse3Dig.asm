# Purpose: Reverse read a 3-digit number
# Author: Angela Denise Almazan

# Two approaches thought of:
	# String
	# Division (and modulo)

.text
main:
	la $a0, prompt
	jal PromptInt
	
	move $t1, $v0		# Input integer
	addi $t4, $t4, 10	# For division
	
	start_loop:
		sne $t0, $t1, 0
		beqz $t0, end_loop
		
		div $t1, $t4
		
		mflo $t2
		mfhi $t3
		
		move $t1, $t2
		move $a0, $t3
		
		li $v0, 1
		syscall
		
		j start_loop
		
	end_loop:
	
	jal Exit

.data
	prompt: .asciiz "Enter a 3-digit integer: "
	
.include "../utils.asm"