.set ENABLE_SAFE, 0

.macro SAVE_NONVOL
    push %rdi
    push %rsi
.endm

.macro RESTORE_NONVOL
    pop %rdi
    pop %rsi
.endm

.macro SWAP_ARGS num
    .ifc \num,VAR
    # TODO: support more than 4 int args
    SWAP_ARGS 4
    mov $0, %eax # Set number of float args to 0
    .exitm
    .endif
    .ifge \num-1
    mov %rcx, %rdi
    .ifge \num-2
    mov %rdx, %rsi
    .ifge \num-3
    mov %r8, %rdx
    .ifge \num-4
    mov %r9, %rcx
    .endif # 4
    .endif # 3
    .endif # 2
    .endif # 1
.endm

.macro WRAP_FUNC name args
.global \name\()_ms
.type \name\()_ms @function
\name\()_ms:
    SAVE_NONVOL
    SWAP_ARGS \args
    call \name@PLT
    RESTORE_NONVOL
    ret
.endm
