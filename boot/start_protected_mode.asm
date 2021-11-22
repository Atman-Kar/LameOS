; code to start the protected mode 
[bits 16]
switch_to_pm:
	; make the switch to protected mode 

	cli ; ignore interrupts until interrupt vector for protected mode is set up

	lgdt [gdt_descriptor] ; load the GDT descriptor table 

	; set the control reg in the cpu
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax 

	; do a far jmp
	; flushes out any pipelining ops in CPU
	; sets the cs as CODE_SEG_REL offset addr? 
	jmp CODE_SEG_REL:init_pm


[bits 32]
; init regs and stack in pm
init_pm:
	
	mov ax, DATA_SEG_REL
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	; send the stack bp completely up top 
	mov ebp, 0x90000
	mov esp, ebp 

	call BEGIN_PM