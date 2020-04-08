section .text
global strcspn

strcspn:
    mov     rax,0
    mov     rcx,0

    .boucle:
    mov     dl,byte [rdi+rax]
    cmp     dl,0
    je      .end

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
    je      .end

    inc     rcx
    jmp     .checker


    .end:
    ret