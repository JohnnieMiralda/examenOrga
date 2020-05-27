#!/bin/bash

EASY_ASM="/home/johnnie/Documents/orga2/EasyAsm24Mayo2020/run_easyasm_vga.sh"
TEMP_FILE=$(mktemp)
echo "Generating file $TEMP_FILE"

for file in $*; do
    echo "; $file " >> $TEMP_FILE
    cat $file >> $TEMP_FILE
    echo "; End of $file" >> $TEMP_FILE
done
$EASY_ASM --run $TEMP_FILE
