.text
.global main
.intel_syntax noprefix
main:
    push   rbp
    push   rbx
    sub    rsp,0x48
    lea    rbp,[rsp+0x80]
    mov    DWORD PTR [rbp-0x20],edi
    mov    QWORD PTR [rbp-0x18],rsi
    call   __main_ms@PLT
    mov    eax,DWORD PTR [rbp-0x20]
    mov    DWORD PTR [rbp-0x44],eax
    mov    rax,QWORD PTR [rbp-0x18]
    mov    QWORD PTR [rbp-0x50],rax
    cmp    DWORD PTR [rbp-0x44],0x1
    jne    main_l1

    call   __iob_func_ms@PLT
    mov    rbx,QWORD PTR [rax+0x8]
    call   __iob_func_ms@PLT
    mov    rdx,rbx
    mov    rcx,QWORD PTR [rax]
    call   output_file
    mov    eax,0x0
    jmp    main_l2

main_l4:
    add    QWORD PTR [rbp-0x50],0x8
    mov    rax,QWORD PTR [rbp-0x50]
    mov    rax,QWORD PTR [rax]
    lea    rdx,[rip+OPENMODE]
    mov    rcx,rax
    call   fopen_ms@PLT
    mov    QWORD PTR [rbp-0x58],rax
    cmp    QWORD PTR [rbp-0x58],0x0
    jne    main_l3

    mov    rax,QWORD PTR [rbp-0x50]
    mov    rax,QWORD PTR [rax]
    mov    rcx,rax
    call   perror_ms@PLT
    mov    eax,0x1
    jmp    main_l2

main_l3:
    call   __iob_func_ms@PLT
    mov    rdx,[rax+0x8]
    mov    rax,QWORD PTR [rbp-0x58]
    mov    rcx,rax
    call   output_file
    mov    rax,QWORD PTR [rbp-0x58]
    mov    rcx,rax
    call   fclose_ms@PLT

main_l1:
    sub    DWORD PTR [rbp-0x44],0x1
    cmp    DWORD PTR [rbp-0x44],0x0
    jg     main_l4

    mov    eax,0x0

main_l2:
    add    rsp,0x48
    pop    rbx
    pop    rbp
    ret



output_file:
    push   rbp
    mov    rbp,rsp
    sub    rsp,0x30
    mov    QWORD PTR [rbp+0x10],rcx
    mov    QWORD PTR [rbp+0x18],rdx
    jmp    output_file_l1

output_file_l2:
    mov    rdx,QWORD PTR [rbp+0x18]
    mov    rax,QWORD PTR [rbp-0x8]
    mov    r9,rdx
    mov    r8,rax
    mov    edx,0x1
    lea    rcx,[rip+buffer]
    call   fwrite_ms@PLT

output_file_l1:
    mov    r9,QWORD PTR [rbp+0x10]
    mov    r8d,0x400
    mov    edx,0x1
    lea    rcx,[rip+buffer]
    call   fread_ms@PLT
    mov    QWORD PTR [rbp-0x8],rax
    cmp    QWORD PTR [rbp-0x8],0x0
    jne    output_file_l2

    nop
    add    rsp,0x30
    pop    rbp
    ret

.section .rodata
OPENMODE:
    .string "r"

.local buffer
.comm buffer, 1024
