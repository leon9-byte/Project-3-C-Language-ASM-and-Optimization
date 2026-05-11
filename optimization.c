/*
Write a C program that outputs a hex dump of the attached file in the format below in Figure 1.
The left most column is the number of bytes into the file (i.e. the address) in hex.
The middle are 16 consecutive bytes in hex separated by spaces, and the left most column is the ASCII representation of the bytes with ‘.’ replacing any non-ASCII bytes.
Compile it with optimization levels -O0, -O1 and -O3 and then compare and discuss the assembly code/data generated (using ‘-S’) by the different optimization levels. 
*/

/*

 Figure 1. Example output of your program

00002040 75 6e 74 75 20 31 33 2e 33 2e 30 2d 36 75 62 75 |untu 13.3.0-6ubu|
00002050 6e 74 75 32 7e 32 34 2e 30 34 2e 31 29 20 31 33 |ntu2~24.04.1) 13|
 
*/

#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[]) {// param not empty as we're passing file into it
    //argc = argument count, an int of how many words were typed, including the program name itself
    //should be 2 for argc -> "./optimization" and "binary.out"

    //argv = actual array of output as strings
    //argv[0] = ./optimization
    //argv[1] = "binary.out"

    // works like
    //  ./optimization binary.out

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    //With that being said, argv[1] being used allows me to not get stumped a single file not being named the same
    //and if it's in the current directory. Not sure but assumption is it should run with any files specified during runtime
    FILE *fptr = fopen(argv[1], "rb"); //rb being binary mode, when r was used it couldn't read NULL and some other stuff

    // test for NULL
    if (fptr == NULL) {
        //printf always prints to stdout
        //fprintf([param is explicit destination], "etc");
        fprintf(stderr, "Unable to open file: %s\n", argv[1]); //stderr opted for due to needing to print error messages
        return 1;
    }

    else {
        unsigned char buf[16]; //representing 16 bytes
        unsigned long offset = 0;
        size_t n;
        
        //Can't use fgets as it stops at newline
        //fread(destination_buffer, size_of_each_item, max_number_of_items, file_read_from);

        // read raw bytes without interpretation
        while ((n = fread(buf, 1, 16, fptr)) > 0) { //organized by sections of 16 with 1 byte each
            /* Left column: byte offset in hex */
            printf("%08lx ", offset); //width of 8 char's and is a long, print in lowercase HEX

            /* Middle: hex bytes, padded if last row < 16 bytes */
            for (size_t i = 0; i < 16; i++) {
                if (i < n) {
                    printf("%02x ", buf[i]); //width of 2 char's, print in lowercase HEX
                }
                else {
                    printf("   ");          /* 3 spaces for missing bytes */
                }
            }

            /* Right column: ASCII, '.' for non-printable */
            printf("|");
            for (size_t i = 0; i < n; i++)
                printf("%c", isprint(buf[i]) ? buf[i] : '.'); //I believe tunury op is allowed
            printf("|\n");

            offset += (long)n;
        }
    }

    // close file
    fclose(fptr);

    return 0;
}

/* Compile to runnable executable
    gcc optimization.c -o optimization

Compiles to assembly text file only, no executable:
    gcc -O0 -S -o optimization_O0.s optimization.c
    gcc -O1 -S -o optimization_O1.s optimization.c
    gcc -O3 -S -o optimization_O3.s optimization.c
*/

/* bash
./optimization binary.out
*/
