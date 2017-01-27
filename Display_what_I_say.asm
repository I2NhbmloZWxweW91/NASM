section .data

   msg1 db 'Input a number :'
   len_msg1 equ $ -msg1

   msg2 db 'You enterd :'
   len_msg2 equ $ -msg2

section .bss

   num resb 5          ; reserved for enter number



section .text
   global main

main:
    mov edx,len_msg1
    mov ecx,msg1
    mov ebx,1
    mov eax,4
    int 0x80
    ;mov eax,1
    ;int 0x80

    ; get num and store it
    mov eax,3          ; sys_read
    mov ebx,2          ; standared input
    mov edx,5
    mov ecx,num
    int 0x80

    ; print the entered number
    mov edx,5
    mov ecx,num
    mov ebx,1                 ;stdout
    mov eax,4                 ; sys_write
    int 0x80
    mov eax,1                 ; sys_exit
    mov ebx,0
    int 0x80






