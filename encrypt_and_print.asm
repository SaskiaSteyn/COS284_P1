; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================

section .data
    fmt db "%d ", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    ; ==========================
    encryptionKey dd 0x73113777

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================
    message resb 4

section .text
    global encrypt_and_print
    textInput db "Enter plaintext to encrypt: "
    encryptedText db "The cipher text is: "
    messageLength equ 28
    encryptedLength equ 20

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Display the the message to the user
    mov rax, 1                      ; writing the number
    mov rdi, 1                      
    mov rsi, textInput              ; poiting to the prompt message
    mov rdx, messageLength          ; checking the length of the message
    syscall                         ; perform the write
    
    ; Get the user's input
    mov rax, 0                      
    mov rdi, 0                      
    mov rsi, message                ; buffer to store the input
    mov rdx, 4                      ; maximum number of bytes to read (up to 4)
    syscall                         

    ; Print output
    mov rax, 1                      ; writing the number
    mov rdi, 1                      
    mov rsi, encryptedText          
    mov rdx, encryptedLength               
    syscall                         ; perform the write

    ; Encrypt and print the message

    ; Encrypting the first character
    movzx rax, byte [message]       ; move the first char to rax
    rol rax, 4                      ; Rotating the bit left by 4
    xor rax, [encryptionKey]              ; XOR with the encryption key
    call print_char_32              ; Printing the encrypted char

    ; Encrypting the second character
    movzx rax, byte [message+1]     ; move the second char to rax
    rol rax, 4                      ; Rotating the bit left by 4
    xor rax, [encryptionKey]              ; XOR with the encryption key
    call print_char_32              ; Printing the encrypted char

    ; Encrypting the third character
    movzx rax, byte [message+2]     ; move the third char to rax
    rol rax, 4                      ; Rotating the bit left by 4
    xor rax, [encryptionKey]              ; XOR with the encryption key
    call print_char_32              ; Printing the encrypted char

    ; Encrypting the fourth character
    movzx rax, byte [message+3]     ; move the fourth char to rax
    rol rax, 4                      ; Rotating the bit left by 4
    xor rax, [encryptionKey]              ; XOR with the encryption key
    call print_char_32              ; Printing the encrypted char
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret
