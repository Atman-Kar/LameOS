#include "screen.h"

unsigned short get_cursor_position(void);
void push_cursor_position(unsigned short jump);
void update_cursor_position_coords(int x, int y);
void putc(char character, unsigned char color);


void reset_cursor(void) {
    /* Get the cursor back to top right corner */
    update_cursor_position_coords(0, 0);
}

void clear(void){
    /* clean up the screen */
    char *video_mem = (char *) VGA_MEM_ADDR;
	for(int i =0; i < 80*25*2; i++) {
		video_mem[i] = 0;
	}
}

void puts(char *str, char color) {

    char *text = str;
    while(*text) {
        putc(*text, color);
        text++;
        push_cursor_position(2);
    }
}

void putc(char character, unsigned char color) {
    /*
        Print out a character on the screen, at the current location of the 
        cursor in the video memory.
    */

    int cur_pos = (int) get_cursor_position();              // Get the current cursor position.
    char *video_mem = (char *) VGA_MEM_ADDR;                     // The addy starts at VGA_MEM_ADDR
    video_mem[cur_pos] = character;                              // First byte is the character to be printed
    video_mem[cur_pos + 1] = color;                              // Second byte is the color of the character
}

unsigned short get_cursor_position(void) {
    /*
        Get the current position of the cursor. The position is defined as:
            pos = y * VGA_WIDTH + x 
        , where x and y are the coordinates of the cursor.

        Return : unsigned short (2 bytes) - position 
    */
    unsigned short position = 0;                                            // Define a 2 byte long var to store position value
    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_HIGH);                      // Update the CRTC Address Reg to Cursor Hi Byte Index 
    position = (position | (port_byte_in(CRTC_DATA)));                        // Read the Cursor Hi Byte from the CRTC Data Reg
    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_LOW);                       // Update the CRTC Address Reg to Cursor Lo Byte Index
    position = position << 8;
    position = position | ((unsigned short)port_byte_in(CRTC_DATA));        // Update the final position var

    return position;
}

void update_cursor_position_coords(int x, int y) {
    /*

        Update the cursor position to start writing. 
        Cursor position is updated as,
            pos = y * VGA_WIDTH + x,
        where x and y are the target coordinates of the cursor.

        Return : void 
    */

    unsigned short position = (unsigned short) ((y * VGA_WIDTH) + x);

    unsigned char position_lo = (unsigned char)(position && 0xFF);
    unsigned char position_hi = (unsigned char)((position >> 8) && 0xFF);

    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_LOW);
    port_byte_out(CRTC_DATA, position_lo);
    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_HIGH);
    port_byte_out(CRTC_DATA, position_hi);

}

void push_cursor_position(unsigned short jump) {
    /*
        Jump the cursor forward by a value "jump".

        Return : void
    
    */

    unsigned short position = get_cursor_position();
    position = position + jump;

    unsigned char position_lo = (unsigned char)(position & 0xFF);
    unsigned char position_hi = (unsigned char)((position >> 8) & 0xFF);

    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_LOW);
    port_byte_out(CRTC_DATA, position_lo);
    port_byte_out(CRTC_ADDRESS, CURSOR_LOCATION_HIGH);
    port_byte_out(CRTC_DATA, position_hi);    

}