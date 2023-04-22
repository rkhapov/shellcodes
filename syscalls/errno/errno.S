.section .text
.globl _start

_start:
    mov     $1, %rax  # sys_write
    mov     $1337, %rdi  # that fd not opened
    lea     msg,%rsi  # string pointer
    mov     $14,%rdx  # string length
    syscall

    mov     $60, %rax # sys_exit
    mov     $0, %rdi  # return code
    syscall

.section .rodata
    msg: .string "Hello, world!\n"

