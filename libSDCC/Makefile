
CC = sdcc
PRJ = blink
FLASH_SIZE = 8192

#do not edit
OBJ_DIR = obj

SRC = main.c
SRC += stm8s_gpio.c
SRC += stm8s_tim4.c
SRC += stm8s_clk.c

VPATH = lib/src

OBJS = $(patsubst %.c,obj/%.rel,$(SRC))

all: $(OBJS)
	$(CC) -mstm8 --opt-code-size --code-size $(FLASH_SIZE) --std-c99 -D__SDCC__ -DSTM8S003 -DUSE_STDPERIPH_DRIVE $(OBJS) -o $(PRJ).ihx
	packihx $(PRJ).ihx > $(PRJ).hex


obj/%.rel: %.c
	$(CC) -c -mstm8 --opt-code-size --code-size $(FLASH_SIZE) --std-c99 -D__SDCC__ -DSTM8S003 -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -o $@

clean:
	rm -f obj/*.*
	rm -f $(PRJ).*
flash:
	stm8flash -c stlinkv2 -p stm8s003f3 -s flash -w $(PRJ).ihx
