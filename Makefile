AS = as
CC = gcc

ASFLAGS := -g
CFLAGS := -g -fPIC
LDFLAGS := -dynamic-linker /lib/ld-linux.so.2 -lc -shared
OBJDIR = obj

SOURCES_S = ctype.s mingw.s signal.s stdio.s stdlib.s string.s time.s
SOURCES_C = mingw_native.c
_OBJ=$(SOURCES_S:=.o) $(SOURCES_C:=.o)
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

.PHONY: all
all: libcwrapper.so

.PHONY: clean
clean:
	$(RM) $(OBJDIR)/*.o
	$(RM) libcwrapper.so

$(OBJDIR)/%.c.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJDIR)/%.s.o: %.s
	@mkdir -p $(OBJDIR)
	$(AS) -o $@ $< $(ASFLAGS)

libcwrapper.so: $(OBJ)
	ld -o $@ $^ $(LDFLAGS)

