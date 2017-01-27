;
; Total of two numbers using NASM       ^_^
;

section .data
   sys_exit equ 1                     ;
   sys_read equ 3                     ;
   sys_write equ 4                    ; sys call variables
   stdin equ 0                        ;
   stdout equ 1                       ;

   msg1 db 'Number One :',0xa         ; var msg1 ='Number One:\n'
   len1 equ $- msg1                   ; len1= length(msg1)

   msg2 db 'Number Two :',0xa
   len2 equ $- msg2

   msg3 db 'Total :'
   len3 equ $ -msg3



section .bss
   num1 resb 2                        ; reserve memory for input num1
   num2 resb 2
   res resb  1                        ; to store num1+num2



section .text
   global main
main:
   ; print 'number one:'
   mov edx,len1
   mov ecx,msg1
   mov ebx,stdout
   mov eax,sys_write
   int 0x80

   ; read number one
   mov ebx,stdin
   mov eax,sys_read
   mov edx,2
   mov ecx,num1
   int 0x80

   ; print 'number two:'
   mov edx,len2
   mov ecx,msg2
   mov ebx,stdout
   mov eax,sys_write
   int 0x80

   ; read number2
   mov ebx,stdin
   mov eax,sys_read
   mov edx,2
   mov ecx,num2
   int 0x80

   mov eax,[num1]             ; move num1 to eax
   sub eax,'0'                ; subtract ascii '0'

   mov ebx,[num2]
   sub ebx,'0'

   add eax,ebx                ; add num2 to num1
   add eax,'0'

   mov [res],eax              ; store total in res

   ; print sum
   mov edx,1                  ; 1 is the length of res
   mov ecx,res
   mov ebx,stdout
   mov eax,sys_write
   int 0x80

   ; exit
   mov eax,sys_exit
   int 0x80




