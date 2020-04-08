section .text
global strcmp

strcmp:
    mov     eax, 0
    mov     rcx, 0

    .start:
    mov     bl, byte [rdi+rcx]
    mov     dl, byte [rsi+rcx]

    cmp     bl,dl
    jne     .diff

    cmp     bl,0
    je      .end

    inc     rcx

    jmp     .start

    .diff:
    movsx   eax, bl
    movsx   ebx, dl

    sub     eax, ebx

    .end:
    ret