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

GED_TOP = $(srctree)/drivers/misc/mediatek/gpu/ged
MTK_TOP = $(srctree)/drivers/misc/mediatek/
GPU_TOP = $(srctree)/drivers/gpu/mediatek/

subdir-ccflags-y += -Wno-error

#
# mt6785 config
#
ifeq ($(CONFIG_MACH_MT6785),y)
	#ccflags-y += -DGED_KPI_MET_DEBUG
	ccflags-y += -DMTK_GED_KPI
	ccflags-y += -DGED_KPI_CPU_BOOST

	ccflags-y += -DGED_SKI_SUPPORT
	ged-y += src/ged_ski.o

	ifeq ($(CONFIG_MTK_GPU_COMMON_DVFS_SUPPORT),y)
	ccflags-y += -DGED_ENABLE_FB_DVFS
	ccflags-y += -DGED_ENABLE_DYNAMIC_DVFS_MARGIN
	ccflags-y += -DGED_CONFIGURE_LOADING_BASE_DVFS_STEP
	ccflags-y += -DGED_ENABLE_TIMER_BASED_DVFS_MARGIN
	ccflags-y += -DMTK_CPUFREQ
	endif

	ccflags-y += -I$(srctree)/drivers/misc/mediatek/cmdq/v3
	ccflags-y += -I$(srctree)/drivers/misc/mediatek/cmdq/v3/$(subst ",,$(CONFIG_MTK_PLATFORM))
	ccflags-y += \
	    -I$(MTK_TOP)/base/power/$(subst ",,$(CONFIG_MTK_PLATFORM))/ \
	    -I$(srctree)/drivers/misc/mediatek/video/$(subst ",,$(CONFIG_MTK_PLATFORM))/videox \
	    -I$(srctree)/drivers/misc/mediatek/video/$(subst ",,$(CONFIG_MTK_PLATFORM))/dispsys \
	    -I$(srctree)/drivers/misc/mediatek/sspm/$(subst ",,$(CONFIG_MTK_PLATFORM))
endif

#
# common config
#
ccflags-y += -DMET_USER_EVENT_SUPPORT -DMTK_GPU_DVFS
ccflags-y += -DGED_DVFS_DEBUG_BUF
#ccflags-y += -DGED_KPI_DEBUG

VER := eng

ifneq ($(CONFIG_MTK_ENG_BUILD),y)
VER := user
ifeq ($(CONFIG_MTK_ENABLE_GMO), y)
ccflags-y += -DGED_LOG_SIZE_LIMITED
ccflags-y += -DGED_BUFFER_LOG_DISABLE
endif
endif

ifeq ($(VER),eng)
ccflags-y += -DGED_DEBUG_IOCTL_LOCK
endif

ifeq ($(CONFIG_MTK_FTRACE_DEFAULT_ENABLE),y)
ccflags-y += -DENABLE_GED_SYSTRACE_UTIL
endif

ifeq ($(CONFIG_MTK_TINYSYS_SSPM_SUPPORT),y)
#ccflags-y += -DGED_SSPM
endif

#$(info $$CONFIG_MTK_GPU_COMMON_DVFS_SUPPORT is [${CONFIG_MTK_GPU_COMMON_DVFS_SUPPORT}])

ifneq ($(CONFIG_FPGA_EARLY_PORTING), y)
ifeq ($(CONFIG_MTK_GPU_COMMON_DVFS_SUPPORT),y)
ccflags-y += -DENABLE_COMMON_DVFS \
             -DENABLE_TIMER_BACKUP \
             -DGED_DVFS_ENABLE
else
ccflags-y += -DGED_FDVFS_ENABLE
endif
else
$(info $[GED]CONFIG_FPGA_EARLY_PORTING is [${CONFIG_FPGA_EARLY_PORTING}])
endif

ccflags-y += \
    -include $(GED_TOP)/include/config_kernel_$(VER).h

ccflags-y += \
    -I$(srctree)/include/ \
    -I$(MTK_TOP)/include/ \
    -I$(GED_TOP)/include/ \
    -I$(GPU_TOP)/hal/ \
    -I$(GPU_TOP)/ \
    -I$(MTK_TOP)/base/power/include/ \
    -I$(srctree)/drivers/misc/mediatek/video/include \
    -I$(srctree)/drivers/misc/mediatek/lcm/inc/ \
    -I$(srctree)/drivers/misc/mediatek/dfrc/ \
    -I$(srctree)/drivers/gpu/mediatek/gpufreq/include/ \
    -I$(srctree)/drivers/misc/mediatek/sspm/

obj-$(CONFIG_MTK_GPU_SUPPORT) += ged.o

ifeq ($(CONFIG_DEBUG_FS),y)
ccflags-y += -DGED_DEBUG_FS
ged-y += \
    src/ged_debugFS.o
endif

ged-y += \
    src/ged.o \
    src/ged_base.o \
    src/ged_main.o \
    src/ged_sysfs.o \
    src/ged_hal.o \
    src/ged_log.o \
    src/ged_bridge.o \
    src/ged_monitor_3D_fence.o \
    src/ged_notify_sw_vsync.o \
    src/ged_hashtable.o \
    src/ged_thread.o \
    src/ged_ge.o \
    src/ged_dvfs.o \
    src/ged_gpu_tuner.o \
    src/ged_kpi.o
