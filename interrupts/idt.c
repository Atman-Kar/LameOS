/* 

	Functions to set up the interrupt vector table 

*/

#include "idt.h"

void set_idt_gate(int gate_number, u32 handler) {

	/*
		gate_number - refers to a gate descriptor number (0-255)
		handler - offset on code segment where interrupt handling takes place
	*/
 
	idt_table[gate_number].low_off = (u16) (handler & 0xFFFF); 
	idt_table[gate_number].sel = (u16) CODE_SEG_OFFSET; 
	idt_table[gate_number].reserved_zeros = (u8) 0;
	idt_table[gate_number].flags = (u8) 0x8E;
	idt_table[gate_number].high_off = (u16) ((handler >> 16) & 0xFFFF); 
}

// set idtr ? 

void set_idtr() {
	idt_reg.idt_base = (u32) &idt_table;
	idt_reg.idt_limit = IDT_VECTOR_NUMBERS * sizeof(idt_gate_t)  - 1;

	// load idt_reg data into the idtr
	__asm__ __volatile__ ("lidtl (%0)" : : "r" (&idt_reg)); 

}