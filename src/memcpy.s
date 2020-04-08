section .text
global memcpy

memcpy:
    mov     rcx,0

    .start:
    cmp     rcx,rdx
    je      .end
    mov     al, byte [rsi + rcx]
    mov     byte [rdi+rcx],al

    inc rcx

    jmp .start

    .end:
    mov     rax,rdi
    ret