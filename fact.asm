; Factorial calc / n! using nasm 
; by @_hddananjaya

section .text
  
  global main:
  main:
    extern scanf
    extern printf

    push number
    push fmt
    call scanf
    add esp, 4
    mov ecx, [number]
    mov ebx, 1  ; going to hold factorial value in EBX 

    calc_fact:
      imul ebx, ecx
      cmp ecx, 1
      je display
      loop calc_fact
            
    display:
      mov eax, ebx
      push eax
      push fmt2
      call printf
      add esp,4
      ret
        
section .data
  
  fmt: db '%d',10,0
  fmt2: db 'Factorial Value : %d',10,0

section .bss

  number: resd 1
