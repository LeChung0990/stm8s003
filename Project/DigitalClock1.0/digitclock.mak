# ST Visual Debugger Generated MAKE File, based on digitclock.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=
ToolsetBin=
ToolsetInc=E:\Hstm8
ToolsetLib=E:\Lib
ToolsetIncOpts=-iE:\Hstm8 
ToolsetLibOpts=-lE:\Lib 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=digitclock
TargetSName=digitclock
TargetFName=digitclock.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -istm8s_stdperiph_driver\inc +mods0 +debug -pxp -no -pp -l -dSTM8S003 $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) digitclock.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\main.$(ObjectExt) : main.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h main.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h stm8s_mylib.h stm8s_it.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_it.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : stm8s_it.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_it.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_mylib.$(ObjectExt) : stm8s_mylib.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_mylib.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_clk.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_gpio.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_i2c.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_tim4.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_uart1.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

digitclock.elf :  $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_mylib.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\digitclock.lkf
	$(ToolsetBin)\clnk  -m $(OutputPath)\$(TargetSName).map $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_mylib.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\digitclock.elf
	-@erase $(OutputPath)\digitclock.map
	-@erase $(OutputPath)\digitclock.st7
	-@erase $(OutputPath)\digitclock.s19
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_mylib.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=digitclock
TargetSName=digitclock
TargetFName=digitclock.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -istm8s_stdperiph_driver\inc +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $< 
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) digitclock.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\main.$(ObjectExt) : main.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h main.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h stm8s_mylib.h stm8s_it.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_it.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : stm8s_it.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_it.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_mylib.$(ObjectExt) : stm8s_mylib.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_mylib.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_clk.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_gpio.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_i2c.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_tim4.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : stm8s_stdperiph_driver\src\stm8s_uart1.c d:\stmicroelectronics\cosmic\cxstm8_eval\hstm8\mods0.h stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

digitclock.elf :  $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8s_mylib.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\digitclock.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8s_mylib.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\digitclock.elf
	-@erase $(OutputPath)\digitclock.map
	-@erase $(OutputPath)\digitclock.st7
	-@erase $(OutputPath)\digitclock.s19
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8s_mylib.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
endif
