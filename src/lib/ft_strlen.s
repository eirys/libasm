global ft_strlen

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text
ft_strlen:
    mov     rax, rdi

.test:
    mov     cl, BYTE [rax]
    test    cl, cl
    jz      .end
    inc     rax
    jmp     .test

.end:
    sub     rax, rdi
    ret