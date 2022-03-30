/** 
 * Read and write data to/from a port
 *
**/

unsigned char port_byte_in (unsigned short port) {
    /**
     * @brief
     * Use the "IN" instruction to read a byte from port data
     */

    unsigned char result;

    __asm ("in %%dx, %%al" : "=a" (result) : "d" (port));
    return result;
}

void port_byte_out (unsigned short port, unsigned char data) {
    /**
     * @brief 
     * Use "out" instruction to write a byte to I/O port data
     */
    __asm ("out %%al, %%dx" : : "a" (data), "d" (port));
}

unsigned char port_word_in (unsigned short port) {
    /**
     * @brief 
     * Use the "IN" instruction to read a word of port data
     */

    unsigned short result;

    __asm ("in %%dx, %%ax" : "=a" (result) : "d" (port));
}

void port_word_out (unsigned short port, unsigned short data) {
    /**
     * @brief 
     * Use "out" instruction to write a byte to I/O port data
     */
    __asm ("out %%ax, %%dx" : : "a" (data), "d" (port));
}