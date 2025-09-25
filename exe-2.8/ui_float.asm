# Program File: ui_float.asm
# Author: Angela Denise Almazan
# Purpose: Read and print a single precision floating point integer

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 6
	syscall
	
	li $v0, 2
	mov.s $f12, $f0 # Like move
	syscall 
	
	# Exit program
	li $v0, 10
	syscall

.data 
	prompt: .asciiz "Enter a float: "
