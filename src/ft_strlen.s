global ft_strlen

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

ft_strlen:
    mov     rax, rdi            ; uint64_t rax = rdi;

.loop:
    mov     cl,     BYTE [rax]  ; uint8_t cl = *(uint8_t*)rax;
    test    cl,     cl          ; if (cl & cl)
    jz      .end                ;   break;
    inc     rax                 ; ++rax;
    jmp     .loop               ; continue;

.end:
    sub     rax, rdi            ; rax = rdi;
    ret