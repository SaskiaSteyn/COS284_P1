; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================
    choice db 'Choice: ', 0
    choice_len equ $-choice
    userChoice db 0

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    ; Your data goes here
    ; ==========================

    ; Print Choice:
    mov rax, 1
    mov rdi, 1
    mov rsi, choice
    mov rdx, choice_len
    syscall

    ; Read user input
    mov rax, 0
    mov rdi, 0
    mov rsi, userChoice
    mov rdx, 1
    syscall

    ; Output the user choice
    mov rax, 1
    mov rdi, 1
    mov rsi, userChoice
    mov rdx, 1
    syscall

    mov rax, 60       
    xor rdi, rdi    
    syscall 

    ; Do not modify anything below this line unless you know what you are doing 
    ret