# Program File: sleep.asm
# Author: Angela Denise Almazan
# Purpose: Test built-in sleep in MARS

.text 
main:
	li $v0, 4
	la $a0, sleep
	syscall
	
	li $v0, 32
	li $a0, 4000
	syscall
	
	li $v0, 4
	la $a0, exit
	syscall
	
	li $v0, 10
	syscall

.data
	sleep: .asciiz "Sleeping..."
	exit: .asciiz "\nExiting..."
