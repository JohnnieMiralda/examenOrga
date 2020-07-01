call main
#stop

swap:
    ; TODO
    mov ebp, [esp+4]
    mov eax, ebp
    imul 
    mov eax, 
    ret

partition:
    ; TODO
    mov ebp , [esp+4]
    //low en 56
    //high en 60
    mov eax, 4
    mov ebx, [ebp+60]
    imul ebx
    mov ebx, [ebp+eax] // pivote

    mov ecx, [ebp+56]
    dec ecx // i

    mov edx, [ebp+56]

    for:

        if:
        mov eax, 4 // arr[j]
        imul 


        mov ecx, [ebp+60]
        dec ecx
        cmp edx, ecx
        je fin_for
        j for
    fin_for:

    ret

main:
    sub esp, 52
    #set dword [esp] = [56, 1, 12, 87, 65, 65, 73, 91, 75, 29, 33, 100, 55]

    push 12
    push 0
    push esp

    call partition
    add esp, 12

    #show dword [esp][13] signed decimal

    add esp, 52
    ret

