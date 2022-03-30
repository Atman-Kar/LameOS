#ifndef PORTS_H
#define PORTS_H

/* Include function prototypes from ports.c */

// Write into I/O port prototypes
unsigned char port_byte_in (unsigned short port);
unsigned char port_word_in (unsigned short port);

// Read out I/O port prototypes
void port_byte_out (unsigned short port, unsigned char data);
void port_word_out (unsigned short port, unsigned char data);


#endif // PORTS_H