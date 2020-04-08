section .text
global memset

memset:
    mov     rcx,0
    mov     rax,rdi

    cmp     rdx,0
    je      .end
    .start:

    mov     byte [rax + rcx], sil

    inc     rcx

    cmp     rdx,rcx
    jne     .start
    .end:
    ret