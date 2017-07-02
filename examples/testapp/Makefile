AS = as
CC = gcc

ASFLAGS := -g
LDFLAGS := -L ../../ -lcwrapper

.PHONY: all
all: testapp_re

.PHONY: clean
clean:
	rm -f *.o
	rm testapp_re

%.o: %.s
	$(AS) -o $@ $< $(ASFLAGS)

testapp_re: testapp_re.o
	$(CC) -o $@ $^ $(LDFLAGS)

