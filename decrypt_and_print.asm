; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================

section .data
    fmt db "%c", 0                ; Format string for printf to print a single character (fix: changed %d to %c)
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    decryptedMessage db "The plaintext is: ", 0  ; Message to be printed before the decrypted characters
    ; ==========================

section .text
global decrypt_and_print

extern printf

; When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax                   ; Move the character to print from rax to rsi (argument for printf)
    mov rdi, fmt                   ; Move the format string to rdi (argument for printf)
    xor rax, rax                   ; Clear rax, as required by the x86-64 calling convention for variadic functions
    call printf                    ; Call printf to print the character
    ret                            ; Return from the function


decrypt_char:
    xor rax, 0x73113777            ; XOR the input character (in rax) with the decryption key 0x73113777
    ror rax, 4                     ; Rotate the result right by 4 bits to complete the decryption
    ret                            ; Return from the function


decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    mov r12, rdi                   ; Save the first input parameter (encrypted character 1) in r12
    mov r13, rsi                   ; Save the second input parameter (encrypted character 2) in r13
    mov r14, rdx                   ; Save the third input parameter (encrypted character 3) in r14
    mov r15, rcx                   ; Save the fourth input parameter (encrypted character 4) in r15

    ; Print the initial message
    mov rax, 1                     ; System call number for write (1)
    mov rdi, 1                     ; File descriptor for stdout (1)
    mov rsi, decryptedMessage      ; Pointer to the message to be printed
    mov rdx, 18                    ; Length of the message (18 bytes)
    syscall                        ; Make the system call to print the message

    ; Decrypt and print the first character
    mov rax, r12                   ; Load the first saved character into rax
    call decrypt_char              ; Decrypt the character
    call print_char_32             ; Print the decrypted character

    ; Decrypt and print the second character
    mov rax, r13                   ; Load the second saved character into rax
    call decrypt_char              ; Decrypt the character
    call print_char_32             ; Print the decrypted character

    ; Decrypt and print the third character
    mov rax, r14                   ; Load the third saved character into rax
    call decrypt_char              ; Decrypt the character
    call print_char_32             ; Print the decrypted character

    ; Decrypt and print the fourth character
    mov rax, r15                   ; Load the fourth saved character into rax
    call decrypt_char              ; Decrypt the character
    call print_char_32             ; Print the decrypted character
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                            
