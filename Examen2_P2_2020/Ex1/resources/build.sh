#!/bin/bash

GCC_ROOT="/opt/gcc-mips-9.1/bin"
GAS="$GCC_ROOT/mips-elf-as"

$GAS -o Ex1.elf Ex1.asm

if [ $? -ne 0 ]; then
    exit 1
fi

./elf2mif Ex1.elf Ex1_code.hex data.hex 256 256
rm -f data.hex

echo "v2.0 raw" > code.hex
cat Ex1_code.hex >> code.hex

rm -f Ex1_code.hex
