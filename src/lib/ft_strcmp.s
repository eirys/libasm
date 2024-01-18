global ft_strcmp

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

; int strcmp(const char *s1, const char *s2)
ft_strcmp:
    xor     eax,        eax         ; eax = 0;
    xor     ecx,        ecx         ; ecx = 0;

.loop:
    mov     al,         BYTE [rdi]  ; uint8_t al = *(uint8_t*)rdi;
    mov     cl,         BYTE [rsi]  ; uint8_t cl = *(uint8_t*)rsi;
    cmp     al,         cl          ; if (al != cl)
    jne     .end                    ;   break;
    test    al,         al          ; if (al & al)
    jz      .end                    ;   break;
    inc     rdi                     ; ++rdi;
    inc     rsi                     ; ++rsi;
    jmp     .loop                   ; continue;

.end:
    sub     eax,        ecx         ; eax -= ecx
    ret