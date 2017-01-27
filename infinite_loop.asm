section .data

   sys_write equ 4
   sys_exit equ 1
   stdout equ 1

   msg db 'This will never end !',0xa
   len equ $ -msg




section .text
global main
main:
   l1:
   mov edx,len
   mov ecx,msg
   mov ebx,stdout
   mov eax,sys_write
   int 0x80
   jmp l1
   mov eax,sys_exit
   int 0x80
