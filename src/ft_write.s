global ft_write

; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

; extern int *__errno_location (void) __THROW __attribute__ ((__const__));
extern __errno_location

; ssize_t write(int fildes, const void *buf, size_t nbyte);
ft_write:
    mov     rax,        1                   ; uint64_t rax = 1;
    syscall                                 ; syscall(rax);  // Call write
    cmp     rax,        0                   ; if (rax >= 0)
    jge     .end                            ;   return rax;
    neg     rax                             ; rax = -rax;
    mov     rcx,        rax                 ; rcx = rax;
    call    __errno_location    wrt ..plt   ; rax = &errno;
    mov     [rax],      rcx                 ; *rax = rcx;
    mov     rax,        -1                  ; rax = -1;

.end:
    ret