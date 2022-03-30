# LameOS 

I started this project to get a better understanding of x86 architecture for hardware-software co-design. For my study and implementation, I refer to, 
1.   [Intel Software Development Manual](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html).
2.   [This](https://github.com/cfenollosa/os-tutorial) amazing guide by [cfenollosa](https://github.com/cfenollosa).
3. [OS Dev Manual](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell

## Tasks
- [x]    Bootsector assembly code. 
- [x]    Shift from 16 bit real mode to 32 bit protected mode
- [x]    Simple Kernel in C to write to video memory address 
- [x]    Implement VGA drivers and build simple putc and puts functionality to print on screen.
- [x]    Setup IDT and handle interrupts      

## Requirements 
To run the project, you will require: 
1.    [Qemu](https://www.qemu.org/) for emulation 
2.    [nasm](https://www.nasm.us/) - Netwide Assembler

## Executing the project 

Once you have the above requirement installed, simply run
```bash
$ make 
```

If there are no errors, this means the everything has been compiled and linked correctly. This will generate an `os-img.bin` file. You may then run,

```bash
$ make run
```
This should pop up a window and start booting up the system. 

Once you are done, you can execute,
```bash
$ make clean
```
to clean the directly of `.bin` and `.o` files. 