section .text
global memmove

memmove:
    mov     rcx, 0
    cmp     rdx, 0
    je      .end

    .push_stack:
    cmp     rcx, rdx
    je      .pop_stack
    movsx   rbx, byte [rsi+rcx]
    push    rbx
    inc     rcx
    jmp     .push_stack

    .pop_stack:
    dec     rcx
    pop     rbx
    mov     byte[rdi+rcx], bl
    cmp     rcx, 0
    je      .end
    jmp     .pop_stack

.end:
    mov     rax, rdi
    ret