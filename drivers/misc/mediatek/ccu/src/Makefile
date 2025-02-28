#
# Copyright (C) 2016 MediaTek Inc.
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

subdir-ccflags-y += -DMTK_VPU_KERNEL
subdir-ccflags-y += -DCCU_AF_ENABLE

platform = $(subst ",,$(CONFIG_MTK_PLATFORM))

obj-y += $(subst ",,$(platform))/

ifeq ($(platform), mt6785)
$(warning CCU_MAKE_FILE_CALLED)
obj-y += 2.0/
endif
