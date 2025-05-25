#makefile N76E003AT20
#Ngo Hung Cuong

CC = sdcc
PRJ = gpio
FLASH_SIZE = 8192

#do not edit
OBJ_DIR = obj

SRC = main.c
# SRC += stm8s_tim4.c
SRC += stm8s_gpio.c
SRC += tim.c
SRC += tm1637.c
SRC += one-wire.c
# SRC += DS18x20.c
SRC += stm8s_clk.c

VPATH = lib/src

OBJS = $(patsubst %.c,obj/%.rel,$(SRC))

all: $(OBJS)
	$(CC) -mstm8 --std-c99 $(OBJS) -o $(PRJ).ihx
	packihx $(PRJ).ihx > $(PRJ).hex
#	makebin -s $(FLASH_SIZE) $(PRJ).ihx $(PRJ).bin

obj/%.rel: %.c
	$(CC) -c -mstm8 -DSTM8S003 -DUSE_STDPERIPH_DRIVER $< -I. -Ilib/inc -o $@

clean:
	rm -f obj/*.*
	rm -f $(PRJ).*
flash:
	stm8flash -c stlinkv2 -p stm8s003f3 -s flash -w $(PRJ).hex
