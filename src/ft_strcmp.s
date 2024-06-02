section .text

;---------------
; HLL prototype:
;  int ft_strcmp(char *s1, char *s2);
; ----
; Arguments:
;  s1, address - rdi
;  s2, address - rsi

global ft_strcmp
ft_strcmp:
    dec rdi
    dec rsi
advance:
    inc rdi
    inc rsi
    movzx rax, byte [rdi]
    cmp al, 0     ; end of string ?
    je  end
    cmp al, byte [rsi]
    je advance
end:
    movzx rsi, byte [rsi]
    sub eax, esi
ret
