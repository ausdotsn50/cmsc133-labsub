.text
main:
	# Prompt for the integer to enter(1)
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Read the integer
	li $v0, 5
	syscall
	move $s0, $v0  # Move from v0 to s0 [?]
	
	# Prompt for the integer to enter(2)
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	
	
	
	
	
	

.data
	prompt: "Enter integer: "
	