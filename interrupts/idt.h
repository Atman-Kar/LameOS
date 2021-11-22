#ifndef IDT_H
#define IDT_H

#include "types.h"

#define CODE_SEG_OFFSET 0x08 
#define IDT_VECTOR_NUMBERS 256

typedef struct {

	u16 low_off; 
	u16 sel; 
	u8 reserved_zeros;
	u8 flags;
	u16 high_off; 

} __attribute__((packed)) idt_gate_t;


typedef struct {
	u16 idt_limit; 
	u32 idt_base;
} __attribute__((packed)) idtr_reg_t;


idt_gate_t idt_table[IDT_VECTOR_NUMBERS];
idtr_reg_t idt_reg; 


// function prototypes defined in idt.c 
void set_idt_gate(int gate_number, u32 handler);
void set_idtr();


#endif 