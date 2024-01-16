global ft_strlen

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

ft_strlen:
    mov     rax, rdi        ; uint64_t rax = rdi;

; Tests if *rax == 0
.loop:
    mov     cl, BYTE [rax]  ; uint8_t cl = *(uint8_t*)rax;
    test    cl, cl          ; uint8_t result = cl & cl;
    jz      .end            ; if (result == 0) goto .end;
    inc     rax             ; ++rax;
    jmp     .loop           ; continue;

.end:
    sub     rax, rdi        ; rax = rdi;
    ret                     ; return rax;