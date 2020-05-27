bouncing_ball:
    addi $sp, $sp,-4
    sw $ra, 0($sp)
    li $s0, 0xffff0000 
    li $t1, 2
    li $t2, 160
    li $t3, 2
    li $t4, 160

    mult $t1,$a2
    mflo $t1
    mult $t2,$a0
    mflo $t2
    mult $t3,$a3
    mflo $t3
    mult $t4,$a1
    mflo $t4

    li $v0,26
    li $v1,800

    addi $t3,$t3,-2
    addi $t4,$t4,-160

    li $s0, 0xb800
    addi $s0, $s0,826
    ;move $t1, $a2 ;valor de x
    ;move $t2, $a0 ;valor de y
    ;move $t3, $a3;valor maximo de x
    ;move $t4, $a1 ;valor maximo de y



    li $t5, 2 ;cuanto se esta sumando x
    li $t6, 160 ;cuanto se esta sumando y

    j volver
    loop:

        lbu $t7, 4($s0) ;; 0x10000010
        andi $t7, $v0, 0x10
        beq $t7, $zero, salir

        beq $t1, $v0, change_x_mas
        beq $t1, $t3, change_x_menos

        beq $t2, $v1, change_y_mas
        beq $t2, $t4, change_y_menos

        
        volver:
        li $t0, 0x2300
        sh $t0, 0($s0)

        add $t1, $t1, $t5
        add $t2, $t2, $t6
        add $s0, $s0, $t5
        add $s0, $s0, $t6

        li $t0, 0xa350
        sh $t0, 0($s0)

        jal delay

    j loop

    change_x_mas:
        addi $t5, $t5, 4
        j volver
    change_x_menos:
        addi $t5, $t5, -4
        j volver
    change_y_mas:
        addi $t6, $t6, 320
        j volver
    change_y_menos:
        addi $t6, $t6, -320
        j volver
    salir:
        lw $ra, 0($sp)
        jr $ra
    #stop
    

delay:

    li $s1, 0xffff0000      ;direccion del cronometro
    lw $t7, 8($s1)          ; timer
    
    addi $t8, $t7, 100   ; end = timer + 500
    
loopw:
    lw $t7, 8($s1)          ; timer
 
bne $t7, $t8, loopw

jr $ra

;../scripts/run_asm.sh start.S main.S bouncing_ball.S