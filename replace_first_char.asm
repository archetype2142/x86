; int func(char *a) 
; convery first characters of words in string to a 'w'

section .text
global func

func: 
  push ebp
  mov  ebp, esp
  mov  eax, DWORD [ebp+8] ; address of *a to eax
  mov  BYTE [eax], 'w'
  mov  ecx, 0              ; count = 0

loop: 
  mov  bl, [eax]
  cmp  bl, 0               ; if cmp is true, we are at end of string
  je  loop_exit
  inc ecx                  ; count++
  cmp bl, 'Z'
  jle modify
  inc eax                  ; a++
  jmp loop

modify: 
  mov BYTE [eax], '*'
  inc eax
  jmp loop

loop_exit: 
  mov eax, ecx
  pop ebp
  ret

