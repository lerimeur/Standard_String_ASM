section .text
global strstr

strstr:
    mov     rax,0
    mov     r8,0

    .boucle:
    mov     dl,byte [rdi+rax]
    cmp     dl,0
    je      .not_find

    cmp     dl,byte [rsi + r8]
    je      .checker

    inc     rax
    jmp     .boucle

    .checker:
    cmp     byte [rsi+r8],0
    je      .find
    
    mov     r10, rdi
    add     r10,rax
    
    inc     r8

    mov     dl, byte [r10+r8]
    
    cmp     dl, byte [rsi+r8]
    je      .checker
    
    mov     r8,0
    inc     rax
    jmp     .boucle

    .not_find:
    mov     rax,0
    jmp     .end

    .find:
    mov     rcx,rax
    mov     rax,rdi
    add     rax,rcx

    .end:
    ret