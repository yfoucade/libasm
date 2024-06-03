extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

section .text

;---------------
; HLL prototype:
;  char *ft_strdup(const char *s);
; ----
; Arguments:
;  s, address - rdi

global ft_strdup
ft_strdup:
    call ft_strlen
    mov rbx, rdi
    mov rdi, rax
    inc rdi
    call malloc
    cmp rax, 0
    jle error
    mov rsi, rbx
    mov rdi, rax
    call ft_strcpy
    ret
error:
    neg rax
    mov rbx, rax
    call __errno_location
    mov dword [rax], ebx
    mov rax, -1
    ret
