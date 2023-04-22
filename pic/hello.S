.section .text
.globl _start

_start:
    mov     $1, %rax  # sys_write
    mov     $1, %rdi  # stdout
    lea     msg(%rip),%rsi  # string pointer
    mov     $14,%rdx  # string length
    syscall

    mov     $60, %rax # sys_exit
    mov     $0, %rdi  # return code
    syscall

msg: .string "Hello, world!\n"

