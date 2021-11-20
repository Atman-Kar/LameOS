gdt_start:
	; start defining the global descriptor table

gdt_null: ; mandatory null descriptor - 8 bytes
	 
	dd 0x0
	dd 0x0 

; define the code segment descriptor 
gdt_code:
	
	dw 0xffff    ; first 2 bytes of segment limit 
	dw 0x0       ; first 2 bytes of base address
	db 0x0       ; next 1 byte of base address 
	db 10011010b ; define - (right to left)
				 ; Type (code, conforming, readable, accessed) - 4 bits 
				 ; Descriptor type - 1 bit
				 ; Descriptor Priviledge Level - 2 bits 
				 ; Segment Present - 1 bit

	db 11001111b ; define - (right to left)
				 ; Segment Limit - 4 bits 
				 ; Avaialble for use by system software - 1 bit 
				 ; 64 bit code segment - 1 bit 
				 ; Default operation size - 1 bit
				 ; Granularity - 1 bit 
	db 0x0		 ; Last byte of base address 	


; Similarly for data segment descriptor 
gdt_data:
	
	dw 0xffff    ; first 2 bytes of segment limit 
	dw 0x0       ; first 2 bytes of base address
	db 0x0       ; next 1 byte of base address 
	db 10010010b ; define - (right to left)
				 ; Type (code, expand down, writeable, accessed) - 4 bits 
				 ; Descriptor type - 1 bit
				 ; Descriptor Priviledge Level - 2 bits 
				 ; Segment Present - 1 bit

	db 11001111b ; define - (right to left)
				 ; Segment Limit - 4 bits 
				 ; Avaialble for use by system software - 1 bit 
				 ; 64 bit code segment - 1 bit 
				 ; Default operation size - 1 bit
				 ; Granularity - 1 bit 
	db 0x0		 ; Last byte of base address 	

gdt_end:
	; no code here
	; required for GDT Descriptor table 

gdt_descriptor:
	; define the size of the GDT table 
	dw gdt_end - gdt_start - 1

	; define start address of the GDT table 
	dd gdt_start

; define a few constants that might come in handy later 
CODE_SEG_REL equ gdt_code - gdt_start
DATA_SEG_REL equ gdt_data - gdt_start 