#makefile STM8S003F3P6
#Admin:Ngo Hung Cuong

CC = sdcc
PRJ = mpu
FLASH_SIZE = 8192

#do not edit
OBJ_DIR = obj

SRC = main.c
SRC += lib.c

VPATH = lib/src

OBJS = $(patsubst %.c,obj/%.rel,$(SRC))

all: $(OBJS)
	$(CC) -mstm8 $(OBJS) -o $(PRJ).ihx
	packihx $(PRJ).ihx > $(PRJ).hex

obj/%.rel: %.c
	$(CC) -c -mstm8 -DSTM8S003 -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -o $@


clean:
	rm -f obj/*.*
	rm -f $(PRJ).*
