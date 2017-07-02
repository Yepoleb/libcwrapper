.include "common.s"
.text

# Time manipulation
WRAP_FUNC difftime 2
WRAP_FUNC time 1
WRAP_FUNC clock 0
WRAP_FUNC timespec_get

# Format conversions
WRAP_FUNC asctime 1
WRAP_FUNC ctime 1
WRAP_FUNC strftime 4
WRAP_FUNC wcsftime 4
WRAP_FUNC gmtime 1
WRAP_FUNC localtime 1
WRAP_FUNC mktime 1

.if ENABLE_SAFE
WRAP_FUNC asctime_s 3
WRAP_FUNC ctime_s 3
WRAP_FUNC gmtime_s 2
WRAP_FUNC localtime_s 2
.endif
