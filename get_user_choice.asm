; ==========================
; Group member 01: Nicolaas Johan Jansen van Rensburg_u22590732
; Group member 02: Saskia Steyn_u17267162
; Group member 03: Rorisang Manemela_u21428574
; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret