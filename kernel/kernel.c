#include "../interrupts/isr.h"
#include "../interrupts/idt.h"
#include "../drivers/screen.h"
 
void _start () {
	isr_setup(); 									// Setup the Interrupt Service Routine Registers and Tables
	clear();										// Clear out the output screen
	reset_cursor();									// Reset the cursor to the origin of the screen 

	char str[] = "Hello, World!";					// First text !
	puts(str, 0x3);									// Use the self-built "puts" function to print string on screen
} 
