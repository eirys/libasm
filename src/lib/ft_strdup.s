global ft_strdup

extern malloc                   ; import malloc
extern ft_strcpy                ; import ft_strcpy
extern ft_strlen                ; import ft_strlen


; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

ft_strdup:
    push    rdi                 ; stack.push(rdi);
    call    ft_strlen           ; rax = ft_strlen(rdi);
    mov     rdi,        rax     ; rdi = rax;
    call    malloc  wrt ..plt   ; rax = malloc(rdi);
    ; check TODO osef
    mov     rdi,        rax     ; rdi = rax;
    pop     rsi                 ; rsi = stack.pop();
    call    ft_strcpy           ; rax = ft_strcpy(rdi, rsi);
    ret