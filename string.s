.include "common.s"
.text

# String manipulation
WRAP_FUNC strcpy 2
WRAP_FUNC strncpy 3
WRAP_FUNC strcat 2
WRAP_FUNC strncat 3
WRAP_FUNC strxfrm 3

.if ENABLE_SAFE
WRAP_FUNC strcpy_s 3
WRAP_FUNC strncpy_s 4
WRAP_FUNC strcat_s 3
WRAP_FUNC strncat_s 4
.endif

# String examination
WRAP_FUNC strlen 1
WRAP_FUNC strcmp 2
WRAP_FUNC strncmp 3
WRAP_FUNC strcoll 2
WRAP_FUNC strchr 2
WRAP_FUNC strrchr 2
WRAP_FUNC strspn 2
WRAP_FUNC strcspn 2
WRAP_FUNC strpbrk 2
WRAP_FUNC strstr 2
WRAP_FUNC strtok 2

.if ENABLE_SAFE
WRAP_FUNC strlen_s 2
WRAP_FUNC strtok_s 4
.endif

# Character array manipulation
WRAP_FUNC memchr 3
WRAP_FUNC memcmp 3
WRAP_FUNC memset 3
WRAP_FUNC memcpy 3
WRAP_FUNC memmove 3

.if ENABLE_SAFE
WRAP_FUNC memset_s 4
WRAP_FUNC memcpy_s 4
WRAP_FUNC memmove_s 4
.endif

# Misc
WRAP_FUNC strerror 1

.if ENABLE_SAFE
WRAP_FUNC strerror_s 3
WRAP_FUNC strerrorlen_s 1
.endif
