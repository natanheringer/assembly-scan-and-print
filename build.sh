#!/bin/bash

# Assemble the assembly file into an object file
nasm -f elf64 print-data.asm -o print-data.o

# Link the object file into an executable
ld print-data.o -o print-data

echo "Build complete. Run with ./print-data"
