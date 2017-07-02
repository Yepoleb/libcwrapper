.include "common.s"
.text

.global __main_ms
.type __main_ms @function
__main_ms:
    call __iob_init_ms
    ret

.global ___chkstk_ms
.type ___chkstk_ms @function
___chkstk_ms:
    ret

.type __iob_init_ms @function
__iob_init_ms:
    SAVE_NONVOL
    call __imp__iob_init_ms@plt
    RESTORE_NONVOL
    ret

.global __iob_func_ms
.type __iob_func_ms @function
__iob_func_ms:
    SAVE_NONVOL
    call __imp__iob_func_ms@plt
    RESTORE_NONVOL
    ret
