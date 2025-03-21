CC = sdcc
PRJ = mpu
FLASH_SIZE = 8192
SIZE        = size

#do not edit
OBJ_DIR = obj

SRC = main.c
SRC += lib.c

VPATH = lib/src

OBJS = $(patsubst %.c,obj/%.rel,$(SRC))

all: $(OBJS)
	$(CC) -mstm8 --opt-code-size --code-size $(FLASH_SIZE) --std-c99 -D__SDCC__ -DSTM8S003 -DUSE_STDPERIPH_DRIVE $(OBJS) -o $(PRJ).ihx
	$(SIZE) $(PRJ).ihx

obj/%.rel: %.c
	$(CC) -c -mstm8 --opt-code-size --code-size $(FLASH_SIZE) --std-c99 -D__SDCC__ -DSTM8S003 -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -o $@


clean:
	rm -f obj/*.*
	rm -f $(PRJ).*
flash:
	stm8flash -c stlinkv2 -p stm8s003f3 -s flash -w $(PRJ).ihx
