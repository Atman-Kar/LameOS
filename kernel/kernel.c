#include "../interrupts/isr.h"
#include "../interrupts/idt.h"

#define VIDEO_MEM_ADDR 0xb8000


void clean () {
	/* clean up the screen */
	char *video_mem = (char *) VIDEO_MEM_ADDR;
	for(int i =0; i < 80*25*2; i++) {
		video_mem[i] = 0;
	}
}
 
/* entry function. Prints hello world as of now */
void _start () {
	clean();

	// char *video_mem = (char *) VIDEO_MEM_ADDR;
	// char *text = "Hello World!";
	// while (*text) {
	// 	*video_mem = *text;
	// 	video_mem++;
	// 	*video_mem = 0x3;
	// 	text++;
	// 	video_mem++;		
	// }

	isr_setup();

	__asm __volatile__("int $10");
	// __asm__ __volatile__("int $12");
	// __asm__ __volatile__("int $1");
        
} 
