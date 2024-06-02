section .text

;---------------
; HLL prototype:
;  qword ft_strlen(char *s);
; ----
; Arguments:
;  s, address - rdi

global ft_strlen
ft_strlen:
    mov rax, 0                  ; result
counter:
    cmp byte [rdi + rax], 0     ; eval char at current index
    je  end
    inc rax
    jmp counter
end:
ret
