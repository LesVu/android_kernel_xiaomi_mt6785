# SPDX-License-Identifier: GPL-2.0
#
# Copyright (c) 2019 MediaTek Inc.
#

PDIR = $(MTK_PLATFORM)

THERMAL_CHIP_DRIVER_DIR := $(srctree)/drivers/misc/mediatek/thermal/$(PDIR)
ccflags-y  += -I$(THERMAL_CHIP_DRIVER_DIR)/inc
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/base/power/$(PDIR)
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/include/mt-plat/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/thermal/fakeHeader/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/base/power/include/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/base/power/ppm_v3/src/mach/$(PDIR)
ccflags-y  += -I$(srctree)/drivers/power/supply/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/video/include
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/gpu/ged/include
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/thermal/common/inc/
ccflags-y  += -I$(srctree)/drivers/power/mediatek/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/base/power/eem_v1/inc/
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/dfrc/
ifeq ($(CONFIG_MTK_TINYSYS_SSPM_SUPPORT),y)
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/sspm
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/sspm/v1
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/sspm/$(MTK_PLATFORM)
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/mcupm/$(PDIR)
endif
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/vpu/$(PDIR)
ccflags-y  += -I$(srctree)/drivers/misc/mediatek/mdla/1.0

obj-$(CONFIG_THERMAL) += mtk_ta.o

ifneq (,$(filter $(CONFIG_MTK_PLATFORM), "mt6785"))
ifeq ($(CONFIG_MTK_THERMAL_PA_VIA_ATCMD),y)
    obj-$(CONFIG_THERMAL) += mtk_cooler_mutt.o
endif
#obj-$(CONFIG_THERMAL) += mtk_cooler_fps.o
ifeq ($(CONFIG_MTK_PUMP_EXPRESS_PLUS_30_SUPPORT),y)
	#obj-$(CONFIG_THERMAL) += mtk_cooler_bcct_v1.o
else
	ifeq ($(CONFIG_MTK_GAUGE_VERSION),30)
		#obj-$(CONFIG_THERMAL) += mtk_cooler_bcct_v1.o
		ifeq ($(CONFIG_MTK_DUAL_CHARGER_SUPPORT),y)
			#obj-$(CONFIG_THERMAL) += mtk_cooler_bcct_2nd.o
		endif
	else
		#obj-$(CONFIG_THERMAL) += mtk_cooler_bcct.o
	endif
endif
obj-$(CONFIG_THERMAL) += mtk_cooler_gpu_cus.o
ifeq ($(CONFIG_MTK_VPU_SUPPORT),y)
	obj-$(CONFIG_THERMAL) += mtk_cooler_vpu_cus.o
endif
obj-$(CONFIG_THERMAL) += mtk_cooler_char_curr_cus.o
obj-$(CONFIG_THERMAL) += mtk_cooler_atm.o
obj-$(CONFIG_THERMAL) += mtk_cooler_dtm.o
obj-$(CONFIG_THERMAL) += mtk_cooler_sysrst.o
#obj-$(CONFIG_THERMAL) += mtk_cooler_NR.o
obj-$(CONFIG_THERMAL) += mtk_cooler_VR_FPS.o
endif
