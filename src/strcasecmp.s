section .text
global strcasecmp

strcasecmp:
    mov     eax,0
    mov     rcx,0
    jmp     .check

    .next:
    cmp     bl,0
    je      .end
    inc     rcx

    .check:
    mov     bl,byte [rdi + rcx]
    mov     dl,byte [rsi + rcx]

    cmp     bl,90; pour Z
    jg      .check_second

    cmp     bl,65 ; pour A
    jl      .check_second

    add     bl,32

    .check_second:
    cmp     dl,90 ; pour Z
    jg      .check_diff

    cmp     dl,65 ; pour A
    jl      .check_diff

    add     dl,32

    .check_diff:
    cmp     bl,dl
    je      .next

    .diff:
    movsx   eax,bl
    movsx   ebx, dl
    sub     eax,ebx

    .end:
    ret