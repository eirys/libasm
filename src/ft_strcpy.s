global ft_strcpy

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

; Copies the content of rsi to rdi.
ft_strcpy:
    mov     rax,        rdi         ; uint8_t rax = 0;

.loop:
    mov     cl,         BYTE [rsi]  ; uint8_t cl = *(uint8_t*)rsi;
    mov     [rdi],      cl          ; *rdi = cl;
    test    cl,         cl          ; if (cl & cl)
    jz      .end                    ;   break;
    inc     rdi                     ; ++rdi;
    inc     rsi                     ; ++rsi;
    jmp     .loop                   ; continue;

.end:
    ret