; Very simple hello World programme
; using netwide assembler

section .text
   global main
main:

   mov edx,len                   ; move msg to data register
   mov ecx,msg                   ; move len to counter register
   mov ebx,1                     ; Base to standered output
   mov eax,4                     ; system_write
   int 0x80                      ; call the kernal
   mov eax,1                     ; system_exit
   int 0x80                      ; call the kernal

section .data
   msg db 'Hello World!',0xa
   len equ $ -msg
