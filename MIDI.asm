# Program File: MIDI.asm
# Author: Angela Denise Almazan
# Purpose: Play around built-in MARS MIDI

.text
main:
	li $v0, 4
	la $a0, np
	syscall
	
	li $v0, 33
	li $a0, 60 # Use li instead of la
	li $a1, 1000
	li $a2, 64
	li $a3, 100
	syscall
	
	li $v0, 10
	syscall
	
.data
	np: .asciiz "Now Playing..."

# la = load address of a label.
# li = load an immediate value.
