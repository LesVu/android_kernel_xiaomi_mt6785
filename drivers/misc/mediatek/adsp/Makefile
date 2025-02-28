# SPDX-License-Identifier: GPL-2.0

subdir-ccflags-y += -Wformat

MTK_PLATFORM := $(subst ",,$(CONFIG_MTK_PLATFORM))

obj-y += $(MTK_PLATFORM)/

MTK_ADSP_HW_VER := 0
subdir-ccflags-y += -DMTK_ADSP_HW_VER=$(MTK_ADSP_HW_VER)

