.include "common.s"
.text

# File access
WRAP_FUNC fopen 2
WRAP_FUNC freopen 4
WRAP_FUNC fclose 1
WRAP_FUNC fflush 1
WRAP_FUNC setbuf 2
WRAP_FUNC setvbuf 3
WRAP_FUNC fwide 2

# Direct input/output
WRAP_FUNC fread 4
WRAP_FUNC fwrite 4

# Unformatted input/output
WRAP_FUNC fgetc 1
WRAP_FUNC getc 1
WRAP_FUNC fgets 3
WRAP_FUNC fputc 2
WRAP_FUNC putc 2
WRAP_FUNC fputs 2
WRAP_FUNC getchar 0
WRAP_FUNC gets 1
WRAP_FUNC putchar 1
WRAP_FUNC puts 1
WRAP_FUNC ungetc 2
.if ENABLE_SAFE
WRAP_FUNC gets_s 2
.endif

WRAP_FUNC fgetwc 1
WRAP_FUNC fgetws 3
WRAP_FUNC fputwc 2
WRAP_FUNC putwc 2
WRAP_FUNC fputws 2
WRAP_FUNC getwchar 0
WRAP_FUNC putwchar 1
WRAP_FUNC ungetwc 2

# Formatted input/output
# TODO: Add va_list functions
WRAP_FUNC scanf "VAR"
WRAP_FUNC fscanf "VAR"
WRAP_FUNC sscanf "VAR"
WRAP_FUNC printf "VAR"
WRAP_FUNC fprintf "VAR"
WRAP_FUNC sprintf "VAR"

WRAP_FUNC wscanf "VAR"
WRAP_FUNC fwscanf "VAR"
WRAP_FUNC swscanf "VAR"
WRAP_FUNC wprintf "VAR"
WRAP_FUNC fwprintf "VAR"
WRAP_FUNC swprintf "VAR"

.if ENABLE_SAFE
WRAP_FUNC scanf_s "VAR"
WRAP_FUNC fscanf_s "VAR"
WRAP_FUNC sscanf_s "VAR"
WRAP_FUNC printf_s "VAR"
WRAP_FUNC fprintf_s "VAR"
WRAP_FUNC sprintf_s "VAR"

WRAP_FUNC wscanf_s "VAR"
WRAP_FUNC fwscanf_s "VAR"
WRAP_FUNC swscanf_s "VAR"
WRAP_FUNC wprintf_s "VAR"
WRAP_FUNC fwprintf_s "VAR"
WRAP_FUNC swprintf_s "VAR"
.endif

# File positioning
WRAP_FUNC ftell 1
WRAP_FUNC fgetpos 2
WRAP_FUNC fseek 3
WRAP_FUNC fsetpos 2
WRAP_FUNC rewind 1

# Error handling
WRAP_FUNC clearerr 1
WRAP_FUNC feof 1
WRAP_FUNC ferror 1
WRAP_FUNC perror 1

# Operations on files
WRAP_FUNC remove 1
WRAP_FUNC rename 2
WRAP_FUNC tmpfile 0
WRAP_FUNC tmpnam 1
.if ENABLE_SAFE
WRAP_FUNC tmpfile_s 1
WRAP_FUNC tmpnam_s 2
.endif
