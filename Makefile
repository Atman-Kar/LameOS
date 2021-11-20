# our C files
C_SOURCES = $(wildcard kernel/*.c)

# our header files

# object files
OBJ = ${C_SOURCES:.c=.o}

CFLAGS = -m32 -fno-pie -ffreestanding

os-img.bin: boot/boot_sector.bin kernel.bin
		cat $^ > os-img.bin  

kernel.bin: boot/kernel_entry.o ${OBJ}
		ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

run: os-img.bin
		powershell.exe qemu-system-x86_64 os-img.bin

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	powershell.exe nasm $< -f elf -o $@

%.bin: %.asm
	powershell.exe nasm $< -f bin -o $@


clean:
	rm -rf *.bin *.o boot/*.bin kernel/*.bin boot/*.o kernel/*.o