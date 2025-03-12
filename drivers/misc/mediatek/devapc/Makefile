# SPDX-License-Identifier: GPL-2.0

ifeq ($(CONFIG_MTK_GCOV_KERNEL),y)
GCOV_PROFILE := y
endif

LOCAL_PATH := $(srctree)/drivers/misc/mediatek/devapc

subdir-ccflags-$(CONFIG_MTK_ENG_BUILD) += -DDBG_ENABLE

# Core
obj-$(CONFIG_DEVAPC_ARCH_V1) += devapc-mtk-common.o
# SoC
obj-$(CONFIG_DEVAPC_MT6785) += devapc-mt6785.o
