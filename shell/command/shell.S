.section .text
.globl _start

_start:
    # rdi - pointer to pathname
    leaq    cmd(%rip), %rdi

    # zero pointer
    xor     %rsi, %rsi
    pushq   %rsi

    # ls pointer
    leaq    arg2(%rip), %rsi
    pushq   %rsi

    # -c pointer
    leaq    arg1(%rip), %rsi
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
arg1:
    .asciz "-c"
arg2:
    .asciz "ls"
null:
    .quad 0

