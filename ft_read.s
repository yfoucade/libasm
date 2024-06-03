extern __errno_location

section .text

;---------------
; HLL prototype:
;  long ft_read(int fd, const void *buf, size_t count);
; ----
; Arguments:
;  fd, dword - rdi
;  buf, address - rsi
;  count, qword - rdx

global ft_read
ft_read:
    mov rax, 0      ; SYS_read
    syscall
    cmp rax, 0
    jl error
    ret
error:
    neg rax
    mov rbx, rax
    call __errno_location
    mov dword [rax], ebx
    mov rax, -1
    ret
