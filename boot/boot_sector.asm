[org 0x7c00]

KERNEL_OFFSET equ 0x1000 ; Kernel _start
NUMBER_OF_SECTORS equ 15 ; Number of sectors 

mov [BOOT_DRIVE], dl ; save the boot drive in case dl is overwritten

mov bp, 0x8000 ; set our base pointer far away
mov sp, bp     ; stack is empty at first

mov bx, MSG_REAL_MODE
call print
call print_newline

call load_kernel ; load the kernel at 0x1000
call switch_to_pm ; go into 32 bit protected mode 

; include files 
%include "boot/print_string.asm"
%include "boot/print_32_bit_pm.asm"
%include "boot/print_newline.asm"
%include "boot/start_protected_mode.asm"
%include "boot/gdt.asm"
%include "boot/disk_loader.asm"

[bits 16]

load_kernel:
	mov bx, MSG_LOAD_KERNEL
	call print
	call print_newline

	mov bx, KERNEL_OFFSET
	mov dh, NUMBER_OF_SECTORS
	mov dl, [BOOT_DRIVE]
	call disk_loader
	ret

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PM 
	call print_pm ; print out this message using our 32 bit print method 

	call KERNEL_OFFSET

	jmp $ ; hang

MSG_REAL_MODE db "ENTERED REAL MODE", 0
MSG_LOAD_KERNEL db "KERNEL HAS BEEN LOADED", 0
MSG_PM db "ENTERED PROTECTED MODE", 0
BOOT_DRIVE db 0

; fill with a bunch of zeros
times 510 - ($ - $$) db 0

; Magic Number
dw 0xaa55