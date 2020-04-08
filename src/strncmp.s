section .text
global strncmp

strncmp:
    mov     eax, 0
    mov     rcx, 0

    .start:
    cmp     rdx,0
    je      .end

    dec     rdx

    mov     bl, byte [rdi+rcx]
    mov     r8b, byte [rsi+rcx]

    cmp     bl,r8b
    jne     .diff

    cmp     bl,0
    je      .end

    inc     rcx

    jmp     .start

    .diff:
    movsx   eax, bl
    movsx   ebx, r8b

    sub     eax, ebx

    .end:
    ret