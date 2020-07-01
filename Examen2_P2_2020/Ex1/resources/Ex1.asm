.set noreorder

.text

# Before running the program set the following registers:
# t0 = 0xffff
# t1 = 0xffff
# t2 = 0x3f21

start:
    addi $v0, $zero, 100  # $v0 = 0x64  
    lui $v1, 0xbeef       # $v1 = 0xbeef0000  
    xori $t0, $t0, 0x4110 # t0 = 0xbeef
    xor $t0, $t1, $t2     # $t0 = 0xc0de
    jal start             # ra = 0x14, pc = 0x0
