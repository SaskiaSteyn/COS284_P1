; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================

section .data
    ; ==========================
    ; Your data goes here
    ; ==========================
    message:     db 'Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]?', 0xA,10
	message_len:  equ $-message 

section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here

    mov rax,1         
	mov rdi,1           
	mov rsi,message       
	mov rdx,message_len    
	syscall   
	
	mov rax, 60       
    xor rdi, rdi    
    syscall 

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                         ; return from function