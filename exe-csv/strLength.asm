.text
main:
	la $a0, prompt
	jal PromptString
	
	# Index counter
	li $t0, 0
	
	start_loop:
		lb $t1, input($t0)
		beq $t1, '\0', end_loop
		
		addi $t0, $t0, 1
		
		j start_loop
	end_loop:
	
	la $a0, output
	subiu $t0, $t0, 1
	move $a1, $t0
	jal PrintInt
	
	jal Exit

.data
	input: .space 21
	inputSize: .word 20
	prompt: .asciiz "Enter a string: "
	output: .asciiz "Length of string: "
	

.include "../utils.asm"