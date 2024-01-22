global ft_read

; extern int *__errno_location (void) __THROW __attribute__ ((__const__));
extern __errno_location
; -----------------------
section .data

; -----------------------
section .bss

; -----------------------
section .text

; ssize_t read(int fildes, void *buf, size_t nbyte);
ft_read:
    mov     rax,        0                   ; uint64_t rax = 0;
    syscall                                 ; syscall(rax); // Call read
    cmp     rax,        0                   ; if (rax >= 0)
    jge     .end                            ;   return rax;
    neg     rax                             ; rax = -rax;
    mov     rcx,        rax                 ; rcx = rax;
    call    __errno_location    wrt ..plt   ; rax = &errno;
    mov     [rax],      rcx                 ; *errno = rcx;
    mov     rax,        -1                  ; rax = -1;

.end:
    ret