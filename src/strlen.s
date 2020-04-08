section .text
global strlen

strlen:
    mov     rax,0

    .start:
    cmp     byte [rdi + rax],0
    je      .end

    inc     rax

    jmp     .start
    .end:
    ret