.section .text
.globl _start

_start:
    # rdi - pointer to pathname
    leaq    cmd(%rip), %rdi

    # zero pointer
    xor     %rsi, %rsi
    pushq   %rsi

    # argv[0] pointer
    leaq    cmd(%rip), %rsi
    pushq   %rsi

    # stack: [cmd, nullptr]
    movq    %rsp, %rsi

    # envp = nullptr
    xor     %rdx, %rdx

    movq    $59, %rax # execve
    syscall

    # no exit needed

cmd:
    .asciz "/bin/sh"
null:
    .quad 0

