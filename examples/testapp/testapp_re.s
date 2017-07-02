.text
.global main

add:
    push %rbp
    mov %rsp,%rbp
    mov %ecx,0x10(%rbp)
    mov %edx,0x18(%rbp)
    mov 0x10(%rbp),%edx
    mov 0x18(%rbp),%eax
    add %edx,%eax
    pop %rbp
    ret

main:
    push %rbp
    mov %rsp,%rbp
    sub $0x30,%rsp
    movl $0x3,-0x4(%rbp)
    movl $0x4,-0x8(%rbp)
    mov -0x8(%rbp),%edx
    mov -0x4(%rbp),%eax
    mov %eax,%ecx
    call add
    mov %eax,%ecx
    mov -0x8(%rbp),%edx
    mov -0x4(%rbp),%eax
    mov %ecx,%r9d
    mov %edx,%r8d
    mov %eax,%edx
    lea .STR0(%rip),%rcx
    call printf_ms@PLT
    mov $0x0,%eax
    add $0x30,%rsp
    pop %rbp
    ret

.section .rodata
.STR0:
    .string "add(%d, %d) -> %d\n"
