section .text
global strchr

strchr:
    mov     rcx,0

    .start:
    movsx   edx,byte [rdi + rcx]
    cmp     edx,0
    je      .null

    cmp     edx,esi
    je      .find

    inc     rcx

    jmp     .start
    .null:
    mov     rax,0
    jmp     .end

    .find:
    mov     rax,rdi
    add     rax,rcx

    .end:
    ret