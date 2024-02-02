global ft_atoi_base

; -----------------------
section .data
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
    mov     r9,             rsi
    xor     rdx,            rdx

.loop_is_valid:
    mov     dl,            BYTE [r9]
    test    dl,            dl
    jz      .has_enough_ch

; .is_sign:
    cmp     dl,             43  ; '+'
    je      .error
    cmp     dl,             45  ; '-'
    je      .error

; .is_unique:
    mov     rax,            r9
    mov     al,             BYTE [rax + 1]
    test    al,             al
    jz      .loop_is_valid  ; end while(base[j]) // TODO

; .is_double:
    cmp     dl,             al
    je      .error

; .is_ws:
    cmp     rdx,            64
    jae     .error
    mov     rax,            ws_bitmask
    bt      rax,            rdx
    jc      .error
    inc     r9

    jmp     .loop_is_valid

.has_enough_ch:
    sub     r9,             rsi
    cmp     r9,             2
    jb      .error

; .convert:
    xor     rax,            rax

.loop_sign:
    mov     dl,             [rdi]
    test    dl,             dl
    jz      .convert_value

; .is_sign2:
    cmp     dl,             43  ; '+'
    je      .error
    cmp     dl,             45  ; '-'
    je      .error

; .is_negative:
    cmp     rdx,             45
    jne     .skip_negation
    neg     eax
    jmp .error2

.skip_negation:
    inc     rdi
    jmp     .loop_sign

.convert_value:
    mov     dl,             BYTE [rdi]
    test    dl,             dl
    jmp     .end

.is_base:
    mov     r8,             rsi

.loop_check_base:
    mov     cl,             BYTE [r8]
    test    cl,             cl
    jz      .end                        ; not in base -> End condition

    cmp     cl,             dl
    je      .get_index
    inc     r8
    jmp     .loop_check_base

.get_index:
    ; val
    sub     r8,             rsi
    mul     r9d
    add     eax,            r8d
    inc     rdi
    jmp     .convert_value

.error:
    xor     rax,            rax
    jmp     .end ; REMOVE

.error2:
    mov     rax, 42

.end:
    ret