DEBUG ?= 1
SOURCES := emulator.c main.c 
OBJECTS := $(SOURCES:%.c=obj/%.o)
OUT = cc8
CFLAGS += -lncurses -lpthread -Werror -Wno-unused-command-line-argument -Wno-attribute-packed-for-bitfield

all: $(OUT)

clean:
	rm -f $(OUT)
	rm -f $(OBJECTS)

do: clean all

$(OUT): $(OBJECTS)
	$(CC) $(CFLAGS) -o "$@" $(OBJECTS:obj/%.o="obj/%.o")

obj/%.o: %.c
	@mkdir -p "$$(dirname "$@")"
	$(CC) $(CFLAGS) -c "$<" -o "$@"