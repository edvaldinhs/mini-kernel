#!/bin/bash

KERNEL_SRC="./src/kernel.yde"
BOOT_SRC="./boot/boot.s"
LINKER_SCR="./boot/linker.ld"
KERNEL_OBJ="./build/kernel.o"
BOOT_OBJ="./build/boot.o"
OUTPUT_BIN="./build/myos.bin"


set -e

if [ ! -d "build" ]; then
echo "      --- starting setup ---"
    mkdir build
fi
echo " "

echo "--- Cleaning ---"
rm -f $KERNEL_OBJ $BOOT_OBJ $OUTPUT_BIN
echo "Cleaned."
echo " "

echo "--- Compiling yde ---"
if ../yde-language/yde "$KERNEL_SRC" -o ./build/kernel; then
    echo "Compilation successful."
else
    echo "Error: yde compilation failed."
    exit 1
fi

echo " "
echo "--- Assembling ---"
if nasm -f elf32 "$BOOT_SRC" -o "$BOOT_OBJ"; then
    echo "Assembled."
else
    echo "Error: nasm assembly failed."
    exit 1
fi

echo " "
echo "--- Linking ---"
if ld -m elf_i386 -T "$LINKER_SCR" -o "$OUTPUT_BIN" "$BOOT_OBJ" "$KERNEL_OBJ"; then
    echo "Linking successful: $OUTPUT_BIN created."
else
    echo "Error: Linking failed."
    exit 1
fi

echo " "
echo "--- Initiating VNC server ---"
qemu-system-x86_64 -kernel "$OUTPUT_BIN"
