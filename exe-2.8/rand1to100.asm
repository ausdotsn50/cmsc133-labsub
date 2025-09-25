# Program File: rand1to100.asm
# Author: Angela Denise Almazan
# Purpose: Print a random number from 1 - 100

.text
main:
	li $v0, 4
	la $a0, intro
	syscall
	
	# Generate from 0 - 99
	li $v0, 42
	li $a0, 1 # Note that it uses load immediate and not address
	li $a1, 99 
	syscall
	
	# Adjustments for the range, put 0 - 99, add 1 always to the result
	
	# add immediate
	# addi adds the value of one register and an immediate (constant)
	addi $a0, $a0, 1 
	
	move $t0, $a0 # Move from $a0 to $t0
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
.data
	intro: .asciiz "Printing a random number from 1-100: "

# $t0 = temporary, good for quick scratch values
# $s0 = saved, good if you need the value after more syscalls or function calls
