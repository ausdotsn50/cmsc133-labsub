# Program File: hello.asm
# Author: Angela Denise Almazan
# Purpose: To print hello, world

.text 
main:
	li $v0, 4 # Load 4 into $v0 to indicate a print string
	la $a0, greeting
	syscall # Prints greeting
	
	li $v0, 10 # Load a 10 (halt) into $v0
	syscall
	
.data
	greeting: .asciiz "hello, assembly"

# Open (Help) to learn more about li $v0, 4
