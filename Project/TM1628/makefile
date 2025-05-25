#makefile N76E003AT20
#Ngo Hung Cuong

CC = sdcc
PRJ = tm1628
FLASH_SIZE = 8192

#do not edit
OBJ_DIR = obj

SRC = main.c
SRC += stm8s_mylib.c
SRC += stm8s_gpio.c
SRC += stm8s_tim4.c
SRC += stm8s_exti.c

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
