.text
main:
	la $a0, prompt
	jal PromptInt
	
	# Note that PromptInt stores in $v0
	move $s0, $v0
	addi $s0, $s0, 1 # Just so it exits on the (N+1)th place
	
	# Register for loop counter
	li $t0, 1
	
	# Register for sum counter
	li $t1, 0
	
	start_loop:
		sne $t2, $t0, $s0	# set not equal
		beqz $t2, end_loop 	# if $t2 is equal to 0 as returned by sne; end the loop
		
		add $t1, $t1, $t0
		addi  $t0, $t0, 1
		b start_loop
	end_loop:
	
	la $a0, output
	move $a1, $t1 # Integer should be on address a1
	jal PrintInt
	
	jal Exit

.data 
	prompt: .asciiz "Enter an integer N: "
	output: .asciiz "Sum: "

.include "../utils.asm"
