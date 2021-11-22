print:
	
	pusha ; copy all reg data to stack first


start:

	mov al, [bx] ; copy data at pointer location to al
	cmp al, 0 ; check to see if it is the null pointer or not 
	je end_print ; if 0, terminal print function

	mov ah, 0x0e ; teletype
	int 0x10 ; display char on monitor
	inc bx
	jmp start ; loop back


end_print:

	popa ; pop all the contents back into the reg
	ret ; pop and return to previous address 
