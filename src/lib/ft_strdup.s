global ft_strdup

; Import external symbols
extern malloc
extern ft_strcpy
extern ft_strlen


; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

ft_strdup:
    push    rdi                     ; stack.push(rdi);
    call    ft_strlen               ; rax = ft_strlen(rdi);
    mov     rdi,        rax         ; rdi = rax;
    call    malloc      wrt ..plt   ; rax = malloc(rdi);
    pop     rsi                     ; rsi = stack.pop();
    test    rax,        rax         ; if (rax == nullptr)
    jz      .end                    ;   return;
    mov     rdi,        rax         ; rdi = rax;
    call    ft_strcpy               ; rax = ft_strcpy(rdi, rsi);

.end:
    ret