AS = as
CC = gcc

ASFLAGS := -g
LDFLAGS := -L ../../ -lcwrapper

.PHONY: all
all: cat_re

.PHONY: clean
clean:
	rm -f *.o
	rm cat_re

%.o: %.s
	$(AS) -o $@ $< $(ASFLAGS)

cat_re: cat_re.o
	$(CC) -o $@ $^ $(LDFLAGS)

