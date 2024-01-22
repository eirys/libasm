global ft_list_push_front

; -----------------------
section .data
    struct_size    equ 16 ; sizeof(struct list);

; -----------------------
section .bss

; -----------------------
section .text

extern malloc

; void ft_list_push_front(t_list **begin_list, void *data);
ft_list_push_front:
    ; mov     rcx,                rdi         ; rcx = rdi // with rdi = begin_list
    push    rdi
    push    rsi
    mov     rdi,                struct_size ; rdi = struct_size;
    call    malloc              wrt ..plt   ; rax = malloc(rdi);
    test    rax,                rax         ; if (rax == nullptr)
    pop     rsi                             ; rsi.reset();
    pop     rdi                             ; rdi.reset();
    jz      .end                            ;   return;
    mov     QWORD [rax],        rsi         ; *(rax) = rsi; // with rsi = data
    mov     rcx,                QWORD [rdi] ; rcx = *rdi
    mov     QWORD [rax + 8],    rcx         ; *(rax + 8) = rdx // with rdx = *begin_list
    mov     [rdi],              rax         ; *rcx = rax

.end:
    ret
