; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================
extern printf, scanf

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================
    userChoice dd 0

section .data
    choice db 'Choice: ', 0
    choice_len equ $-choice

    choiceOne db 1, 0
    incorrectResponse db "Invalid choice! Please select Encrypt [1] or Decrypt [2]?", 10, 0
    incorrectResponseLength equ $ - incorrectResponse

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
    mov rdx, 2
    ; lea rsi, [userChoice]
    syscall

    movzx rbx, byte [userChoice]         
    sub rbx, '0'                    
    mov [userChoice], rbx           

.compareLoop:
    cmp rbx, 1
    je .endProgram                      ;   If equal to 1, jump to .endProgram
    cmp rbx, 2
    je .endProgram                      ;   If equal to 2, jump to .endProgram

    mov rax, 1                          ;   Performing write for invalid choice message
    mov rdi, 1                          ;   To be written to prinf
    mov rsi, incorrectResponse          
    mov rdx, incorrectResponseLength    
    syscall                             ;   Performing the system call

    jmp get_user_choice

.endProgram:
    ; Do not modify anything below this line unless you know what you are doing
    mov rsi, userChoice
    mov rax, [rsi]
    ret
