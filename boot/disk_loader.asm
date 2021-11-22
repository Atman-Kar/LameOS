; load 'dh' number of sectors from drive number 'dl' into ES:BX
disk_loader:

	pusha 
	push dx

	mov ah, 0x02 ; BIOS read sector func
	mov al, dh ; read dh sectors
	mov ch, 0x00 ; selecter cylinder number - starts with base of 0
	mov dh, 0x00 ; select head number - starts with base of 0
	mov cl, 0x02 ; select sector to start reading from
	int 0x13 ; BIOS int 
	; if disk error is present, carry flag gets set to 1
	jc disk_error

	; after the int, BIOS sets 'al' to number of sectors read
	pop dx ; get back those old d reg contents 
	cmp al, dh ; see if corrent number of secs have been read out 
	jne sector_error
	popa
	ret


disk_error:
	mov bx, DISK_ERROR_MSG
	call print
	call print_newline
	jmp disk_hang
	

sector_error:
	mov bx, SECTOR_ERROR_MSG
	call print
	call print_newline

disk_hang:
	jmp $

DISK_ERROR_MSG:
	db "ERROR: DISK READ INCORRECTLY", 0

SECTOR_ERROR_MSG:
	db "ERROR: SECTORS READ INCORRECTLY", 0