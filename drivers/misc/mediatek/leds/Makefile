#
# Copyright (C) 2015 MediaTek Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
ifdef CONFIG_LEDS_MTK_DISP
obj-$(CONFIG_LEDS_MTK_DISP)		+= leds-mtk-disp.o
else ifdef CONFIG_LEDS_MTK_PWM
obj-$(CONFIG_LEDS_MTK_PWM)		+= leds-mtk-pwm.o
else ifdef CONFIG_LEDS_MTK_I2C
obj-$(CONFIG_LEDS_MTK_I2C)		+= leds-mtk-i2c.o
else
ccflags-y += -I$(srctree)/drivers/misc/mediatek/leds/$(MTK_PLATFORM)

ccflags-y += -I$(srctree)/drivers/misc/mediatek/video/include
ccflags-y += -I$(srctree)/drivers/misc/mediatek/gate_ic

obj-$(CONFIG_MTK_LEDS) += mtk_leds_drv.o

obj-y += $(subst ",,$(CONFIG_MTK_PLATFORM))/
endif
