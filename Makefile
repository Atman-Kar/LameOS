# our C files
C_SOURCES = $(wildcard kernel/*.c interrupts/*.c)

# our header files
HEADERS = $(wildcard interrupts/*.h)

# object files
OBJ = ${C_SOURCES:.c=.o interrupts/interrupt_entry_point.o}

CFLAGS = -m32 -fno-pie -ffreestanding -g

os-img.bin: boot/boot_sector.bin kernel.bin
		cat $^ > os-img.bin  

kernel.bin: boot/kernel_entry.o ${OBJ}
		ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

run: os-img.bin
		powershell.exe qemu-system-i386 os-img.bin

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	powershell.exe nasm $< -f elf -g -o $@

%.bin: %.asm
	powershell.exe nasm $< -f bin -o $@


clean:
	rm -rf *.bin *.o boot/*.bin kernel/*.bin boot/*.o kernel/*.o interrupts/*.o interrupts/*.bin