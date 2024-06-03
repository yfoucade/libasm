section .text

;---------------
; HLL prototype:
;  char *ft_strcpy(char *dest, char *src);
; ----
; Arguments:
;  dest, address - rdi
;  src, address - rsi

global ft_strcpy
ft_strcpy:
    mov rax, rdi                ; result
copy:
    cmp byte [rsi], 0     ; end of src string ?
    je  end
    mov dl, byte [rsi]
    mov byte [rdi], dl
    inc rdi
    inc rsi
    jmp copy
end:
    mov byte [rdi], 0
ret
