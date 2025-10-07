# Program File: favpie.asm
# Author: Angela Denise Almazan
# Purpose: Print program and user specified strings

.text 
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, input # Load address of input buffer into $a0
	lw $a1, inputSize
	# li $a1, 20
	syscall # $a0 holds the address of the input buffer, and on syscall the string is read into the address stored in $a0
	
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 10
	syscall

.data
	prompt: .asciiz "Enter favorite pie: "
	input: .space 21
	inputSize: .word 20
	output1: .asciiz "So you like "
	output2: .asciiz "pie"
