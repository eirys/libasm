global ft_atoi_base

; -----------------------
section .data

    ; Empty bitmask:
    ; 0000 0000 0000 0000
    ; 0000 0000 0000 0000
    ; 0000 0000 0000 0000
    ; 0000 0000 0000 0000

    ; Bitmask for sign:
    ; `+` : 43
    ; `-` : 45
    ; 0000 0000 0000 0000
    ; 0010 1000 0000 0000
    ; 0000 0000 0000 0000
    ; 0000 0000 0000 0000
    sign_bitmask    equ 0x280000000000

    ; Bitmask for whitespaces:
    ; ` ` : 32
    ; ws  : 9 to 13
    ; 0000 0000 0000 0000
    ; 0000 0000 0000 0001
    ; 0000 0000 0000 0000
    ; 0011 1110 0000 0000
    ws_bitmask      equ 0x100003e00

; -----------------------
section .bss

; -----------------------
section .text

; int ft_atoi_base(char *str, char *base);
ft_atoi_base:

; Check base validity
.is_valid:
    mov     rcx,            rsi

.loop_is_valid:
    mov     rdx,           BYTE [rcx]
    test    dl,            dl
    jz      .has_enough_ch

; .is_sign:
    mov     rax,            sign_bitmask
    bt      rax,            rdx
    jnz     .error

; .j = i + 1
.loop_is_unique:
    mov     rax,            rcx
    mov     al,             BYTE [rax + 1]
    test    al,             al
    jz      .loop_isvalid

; .is_double:
    cmp     dl,             al
    je      .error

; .is_ws:
    mov     rax,            ws_bitmask
    bt      rax,            rdx
    jnz     .error
    inc     rcx

    jmp     .loop_isvalid

.has_enough_ch:
    sub     rcx,            rsi
    cmp     rcx,            2
    jb      .error

.convert:


; return 0:
.error:
    xor     rax,            rax

.end:
    ret