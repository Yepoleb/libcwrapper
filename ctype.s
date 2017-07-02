.include "common.s"
.text

# Character classification
WRAP_FUNC isalnum 1
WRAP_FUNC isalpha 1
WRAP_FUNC islower 1
WRAP_FUNC isupper 1
WRAP_FUNC isdigit 1
WRAP_FUNC isxdigit 1
WRAP_FUNC iscntrl 1
WRAP_FUNC isgraph 1
WRAP_FUNC isspace 1
WRAP_FUNC isblank 1
WRAP_FUNC isprint 1
WRAP_FUNC ispunct 1

# Character manipulation
WRAP_FUNC tolower 1
WRAP_FUNC toupper 1
