; assemble: nasm -f elf64 s64.s 
; link : ld -o s64 s64.o
  section .data
hello: db 'Hello world!', 10 ; LF at the end
hello_len: equ $-hello ; const def – length of string

  section .text
  global _start ; entry point for linker 

_start:
  mov eax, 4 ; sys_write function id. 
  mov edi, 1 ; stdout handle
  mov rsi, hello ; string address
  mov edx, hello_len ; length
  syscall ; OS service

  mov eax, 60 ; sys_exit function id.
  xor edi, edi ; exit code = 0
  syscall ; OS
