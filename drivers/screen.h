#ifndef SCREEN_H
#define SCREEN_H

#include "ports.h"

#define CRTC_ADDRESS            0x3d4
#define CRTC_DATA               0x3d5
#define CURSOR_LOCATION_HIGH    0x0E
#define CURSOR_LOCATION_LOW     0x0F

#define VGA_HEIGHT              25
#define VGA_WIDTH               80
#define VGA_MEM_ADDR            0xb8000

void putc(char, unsigned char);
void clear(void);
void puts(char *, char);
void reset_cursor(void);
void push_cursor_position(unsigned short jump);

#endif