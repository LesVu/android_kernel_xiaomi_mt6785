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

ccflags-y += -DMET_USER_EVENT_SUPPORT


MTK_PLATFORM := $(subst ",,$(CONFIG_MTK_PLATFORM))

ccflags-y += -I$(CPUFREQ_ROOT_DIR)/src/mach/$(MTK_PLATFORM)
include $(srctree)/drivers/misc/mediatek/base/power/cpufreq_v1/src/mach/$(MTK_PLATFORM)/Makefile

ccflags-y += \
        -I$(CPUFREQ_ROOT_DIR)/inc \
        -I$(srctree)/drivers/misc/mediatek/include/mt-plat/$(MTK_PLATFORM)/include \
        -I$(srctree)/drivers/misc/mediatek/base/power/$(MTK_PLATFORM) \
        -I$(srctree)/drivers/misc/mediatek/base/power/include

# main
obj-y := mtk_cpufreq_main.o
obj-y += mtk_cpufreq_interface.o
obj-y += mtk_cpufreq_api.o
obj-y += mtk_cpufreq_debug.o
obj-y += mtk_cpufreq_hybrid.o

# platform dependent files
obj-y += mach/
