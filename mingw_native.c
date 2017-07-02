#include <stdio.h>

static FILE* iofiles[3];

void __imp__iob_init_ms(void)
{
    iofiles[0] = stdin;
    iofiles[1] = stdout;
    iofiles[2] = stderr;
}

FILE** __imp__iob_func_ms(void)
{
    return iofiles;
}
