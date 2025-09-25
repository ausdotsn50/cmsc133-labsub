# Program File: msg-dlg.asm
# Author: Angela Denise Almazan
# Purpose: Working with dialog box and message box

.text 
main:
	# To know why these are used: refer to Help (f1)
	# Input dialog string
	li $v0, 54
	la $a0, message2User
	la $a1, myString
	lw $a2, myStringSize
	syscall
	
	# Message dialog string
	li $v0, 59
	la $a0, output
	la $a1, myString
	syscall
	

	li $v0, 10
	syscall
	
.data
	message2User: .asciiz "User, type here: "
	myString: .space 31
	myStringSize: .word 30
	output: .asciiz "Hey, this is what you typed: "