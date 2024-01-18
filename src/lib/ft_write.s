global ft_write

extern __ernno_location
; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

; ssize_t write(int fildes, const void *buf, size_t nbyte);
ft_write:
    mov     rax,    1
    syscall


