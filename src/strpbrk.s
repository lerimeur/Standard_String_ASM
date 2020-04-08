section .text
global strpbrk

strpbrk:
    mov     rax,0
    mov     rcx,0

    .boucle:
    mov     dl,byte [rdi+rax]
    cmp     dl,0
    je      .not_find

    jmp     .checker
    .suite_boucle:

    mov     rcx,0
    inc     rax
    jmp     .boucle

    .checker:
    mov     bl,byte [rsi + rcx]
    cmp     bl,0
    je      .suite_boucle

    cmp     bl,dl
    je      .find

    inc     rcx
    jmp     .checker

    .not_find:
    mov     rax,0
    jmp     .end

    .find:
    mov     rcx,rax
    mov     rax,rdi
    add     rax,rcx

    .end:
    ret