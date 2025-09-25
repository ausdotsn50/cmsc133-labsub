.text
main:
	la $a0, prompt
	jal PrintString


.data
	prompt: .asciiz "Enter an integer N: "

.include "utils.asm"