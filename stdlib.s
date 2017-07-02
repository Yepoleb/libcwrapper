.include "common.s"
.text

# Memory management
WRAP_FUNC malloc 1
WRAP_FUNC calloc 2
WRAP_FUNC realloc 3
WRAP_FUNC free 1
WRAP_FUNC aligned_alloc 2

# Program termination
WRAP_FUNC abort 0
WRAP_FUNC exit 1
WRAP_FUNC quick_exit 1
WRAP_FUNC _Exit 1
WRAP_FUNC atexit 1
WRAP_FUNC at_quick_exit 1

# Communication with the environment
WRAP_FUNC system 1
WRAP_FUNC getenv 1

.if ENABLE_SAFE
WRAP_FUNC getenv_s 4
.endif

# Conversion to numeric formats
WRAP_FUNC atof 1
WRAP_FUNC atoi 1
WRAP_FUNC atol 1
WRAP_FUNC atoll 1
WRAP_FUNC strtol 3
WRAP_FUNC strtoll 3
WRAP_FUNC strtoul 3
WRAP_FUNC strtoull 3
WRAP_FUNC strtof 2
WRAP_FUNC strtod 2
WRAP_FUNC strtold 2

# Pseudo-random number generation
WRAP_FUNC rand 0
WRAP_FUNC srand 1
