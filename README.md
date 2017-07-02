# libcwrapper

Assembly wrapper around libc to allow calling the System V AMD64 ABI using the
Microsoft x64 calling convention. Only supports integer and pointer arguments
with a limited amount of functions. This is just a proof of concept, don't try
to use it with anything more complex than 3 functions.

## Building

    make

## Building examples

    cd examples/cat
    make

    cd examples/testapp
    make

## Running examples

    # Tell the linker where to find libcwrapper.so
    export LD_LIBRARY_PATH=../../
    ./*_re

## Usage

1. Build the Windows executable

       x86_64-w64-mingw32-gcc -o app.exe source.c

2. Disassemble it and put the C functions in an assembly file

       objdump -d app.exe
       edit app_re.s

3. Remove absolute offsets and add the data section
4. Add `_ms@PLT` suffix to all libc functions. If you get relocation errors
   theres's probably a `@PLT` missing somewhere.
5. Make it build
6. Fix special cases and segfaults

## How it works

A basic function wrapper looks like this (AT&T syntax):

    .global memset_ms
    .type memset_ms @function
    memset_ms:
        # Save rdi and rsi because System V considers them volatile while
        # Microsoft x64 doesn't
        push %rdi
        push %rsi
        # Swap the register order
        mov %rcx, %rdi
        mov %rdx, %rsi
        mov %r8, %rdx
        # Call native libc
        call memset@PLT
        # Restore rdi and rsi to their original value
        pop %rdi
        pop %rsi
        ret

## License

[MIT](LICENSE)
