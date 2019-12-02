section     .data
msg     db  'Hello, world!', 10    ;our dear string
len     equ $-msg    ;length of our dear string
section     .text

global      _start   ;must be declared for linker (ld)

_start:               ;tell linker entry point

    mov     edx, len   ;message length
    mov     ecx, msg   ;message to write
    mov     ebx, 1     ;file descriptor (stdout)
    mov     eax, 4     ;system call number (sys_write)
    int 0x80

    mov     eax, 60      ;system call number (sys_exit)
    xor edi, edi ; exit code = 0
    int 0x80

