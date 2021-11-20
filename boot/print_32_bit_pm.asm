[bits 32]
; set to 32 bits protected mode

; Write into addr of video mem - 0xb8000
VIDEO_MEM equ 0xb8000
; Set foreground and background color 
WHITE_ON_BLACK equ 0x0f

; print null terminated string pointed to by edx
print_pm:
	pusha 
	mov edx, VIDEO_MEM

print_32_pm_loop:
	mov al, [ebx] ; store character pointed to by ebx
	mov ah, WHITE_ON_BLACK ; store fore/back ground color

	cmp al, 0
	je print_32_done

	mov [edx], ax ; move current character into VIDEO_MEM location
	add ebx, 1 ; go to the next char 
	add edx, 2 ; go 2 addr later, as 2 bytes filled
	jmp print_32_pm_loop 


print_32_done:
	popa 
	ret 
