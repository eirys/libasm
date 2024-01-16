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
    mov     cl,         BYTE [rsi]  ; uint8_t cl = *rsi;
    mov     [rdi],      cl          ; *rdi = cl;
    test    cl,         cl          ; uint8_t result = cl & cl;
    jz      .end                    ; if (result == 0) goto .end;
    inc     rdi                     ; ++rdi;
    inc     rsi                     ; ++rsi;
    jmp     .loop                   ; goto .loop;

.end:
    ret                             ; return;