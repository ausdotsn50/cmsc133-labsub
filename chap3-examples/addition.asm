# Program File: addition.asm
# Author: Angela Denise Almazan
# Purpose: Addition example

.text
main:
	li $t0, 100
	li $t1, 200
	add $t2, $t1, $t0 	# t2 = t1 + t0
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	# Illustrate adding with immediater
	# addi $t2, $t2, 50
	# add $t2, $t2, 50		# In code "log" add is changed to addi
	
	li $v0, 10
	syscall