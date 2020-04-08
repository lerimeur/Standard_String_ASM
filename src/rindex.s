section .text
global rindex

rindex:
    mov     rcx,0

    .go_end:
    mov     dl,byte [rdi + rcx]

    cmp     dl,0
    je      .go_find

    inc     rcx
    jmp     .go_end

    .go_find:
    movsx   edx,byte [rdi + rcx]

    cmp     edx,esi
    je      .prep_return
    
    cmp     rcx,0
    je      .null

    dec     rcx
    jmp     .go_find

    .null:
    mov     rax,0
    jmp     .end

    .prep_return:
    mov     rax,rdi
    add     rax,rcx

    .end:
    ret