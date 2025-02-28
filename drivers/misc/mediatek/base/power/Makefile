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

obj-$(CONFIG_MACH_MT6785) += cpuhotplug/
obj-$(CONFIG_MACH_MT6785) += cpuidle_v3/
obj-$(CONFIG_MACH_MT6785) += dcm_v1/
obj-$(CONFIG_MACH_MT6785) += drcc_v1/
obj-$(CONFIG_MACH_MT6785) += mcdi/
obj-$(CONFIG_MACH_MT6785) += power_gs_v1/
obj-$(CONFIG_MACH_MT6785) += ppm_v3/
obj-$(CONFIG_MACH_MT6785) += spm/
obj-$(CONFIG_MACH_MT6785) += udi_v2/

ifneq ($(CONFIG_FPGA_EARLY_PORTING), y)
obj-$(CONFIG_MACH_MT6785) += clkbuf_v1/
obj-$(CONFIG_MACH_MT6785) += mdpm_v2/
obj-$(CONFIG_MACH_MT6785) += $(subst ",,$(CONFIG_MTK_PLATFORM))/
obj-$(CONFIG_MACH_MT6785) += pbm_v4/
endif

obj-$(CONFIG_MTK_CPU_KORO) += koro/

obj-$(CONFIG_MTK_CM_MGR) += cm_mgr_v1/
obj-$(CONFIG_MTK_CPU_FREQ) += cpufreq_v1/
obj-$(CONFIG_MTK_STATIC_POWER) += leakage_table_v2/
obj-$(CONFIG_MTK_PTPOD) += eem_v2/

obj-$(CONFIG_MTK_CPU_MSSV) += cpumssv_v1/

obj-$(CONFIG_MTK_SLBC) += slbc/
obj-$(CONFIG_MTK_SWPM) += swpm_v1/
obj-$(CONFIG_MTK_QOS_V2) += qos/

ifeq ($(CONFIG_MTK_UNIFY_POWER), y)
obj-$(CONFIG_MTK_UNIFY_POWER) += upower_v2/
endif

obj-y += dvfsrc/

