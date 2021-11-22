print_newline:
	
	pusha ; push reg vals to stack
	mov ah, 0x0e ; teletype mode
	mov al, 0x0A ; newline character ascii
	int 0x10 
	mov al, 0x0D ; carriage ret character ascii
	int 0x10 

	popa ; pop out from stack to regs
	ret ; pop ret addr and jmp

