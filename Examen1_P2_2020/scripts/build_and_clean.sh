#!/bin/bash

if [ $1"x" == "x" ]; then
    echo "Missing input file name"
    exit 1
fi

if [ $2"x" == "x" ]; then
    echo "Missing output file name"
    exit 1
fi

ASM_BROOM="asmbroom"
GCC="/opt/gcc-mips-9.1/bin/mips-elf-gcc"
TEMP_FILE=$(mktemp)
INPUT_FILE=$1
OUTPUT_FILE=$2

$GCC -EB -fno-delayed-branch -O1 -S -o $TEMP_FILE $INPUT_FILE
if [ $? -ne 0 ]; then
    exit 1
fi

$ASM_BROOM $TEMP_FILE $OUTPUT_FILE
