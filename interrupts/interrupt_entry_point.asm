; interrupt entry point

[extern isr_handler]

interrupt_routine: 
	
	pusha ; push everything to the stack
	; save data segment descriptor 
	mov ax, ds 
	push eax 

	; move to kernel DS
	mov ax, 0x10 
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax



	call isr_handler ; implemented in C 


	; interrupt complete, come back to old state
	pop eax 
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	popa 
	
	; shift the esp up by 8 bytes 
	; to erase the EFLAG and interrupt ID data
	add esp, 8
	sti 
	iret ; ret from interrupt routine 



global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31




; isrs
; refer to intel manual to see which ones
; push error codes and which dont

isr0: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 0 ; interrupt number 
	jmp interrupt_routine

isr1: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 1 ; interrupt number 
	jmp interrupt_routine

isr2: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 2 ; interrupt number 
	jmp interrupt_routine

isr3: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 3 ; interrupt number 
	jmp interrupt_routine

isr4: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 4 ; interrupt number 
	jmp interrupt_routine

isr5: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 5 ; interrupt number 
	jmp interrupt_routine


isr6: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 6 ; interrupt number 
	jmp interrupt_routine

isr7: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 7 ; interrupt number 
	jmp interrupt_routine

isr8: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!
	push byte 8 ; interrupt number 
	jmp interrupt_routine

isr9: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 9 ; interrupt number 
	jmp interrupt_routine

isr10: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!

	push byte 10 ; interrupt number 
	jmp interrupt_routine

isr11: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!

	push byte 11 ; interrupt number 
	jmp interrupt_routine

isr12: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!

	push byte 12 ; interrupt number 
	jmp interrupt_routine

isr13: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!

	push byte 13 ; interrupt number 
	jmp interrupt_routine

isr14: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes an error code!

	push byte 14 ; interrupt number 
	jmp interrupt_routine

isr15: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 15 ; interrupt number 
	jmp interrupt_routine


isr16: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 16 ; interrupt number 
	jmp interrupt_routine


isr17: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 
		; pushes error code !
	push byte 0
	push byte 17 ; interrupt number 
	jmp interrupt_routine

isr18: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 18; interrupt number 
	jmp interrupt_routine

isr19: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 19 ; interrupt number 
	jmp interrupt_routine

isr20: 
	cli ; clear interrupt flag
		; prevent race conditions while handling 

	push byte 0 ; push a dummy error code 
	push byte 20 ; interrupt number 
	jmp interrupt_routine

isr21: 
	cli ; clear interrupt flag
		; prevent race conditions while handling  
	push byte 21; interrupt number 
	jmp interrupt_routine


isr22:
   cli
   push byte 0
   push byte 22
   jmp interrupt_routine


isr23:
   cli
   push byte 0
   push byte 23
   jmp interrupt_routine


isr24:
   cli
   push byte 0
   push byte 24
   jmp interrupt_routine


isr25:
   cli
   push byte 0
   push byte 25
   jmp interrupt_routine


isr26:
   cli
   push byte 0
   push byte 26
   jmp interrupt_routine


isr27:
   cli
   push byte 0
   push byte 27
   jmp interrupt_routine


isr28:
   cli
   push byte 0
   push byte 28
   jmp interrupt_routine


isr29:
   cli
   push byte 0
   push byte 29
   jmp interrupt_routine


isr30:
   cli
   push byte 0
   push byte 30
   jmp interrupt_routine


isr31:
   cli
   push byte 0
   push byte 31
   jmp interrupt_routine