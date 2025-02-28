obj-y := fdvt_dummy.o

MTK_CUSTOM_PATH  := $(srctree)/drivers/misc/mediatek

ifeq ($(CONFIG_MACH_MT6785),y)
$(info FDVT: Drv use 5.0 folder)
MTKCAM_FDVT_VERSION := 5.0
MTKCAM_FDVT_PATH := $(MTK_CUSTOM_PATH)/cameraisp/fdvt/5.0
subdir-ccflags-y += -I$(MTK_CUSTOM_PATH)/cameraisp/fdvt/5.0/inc
obj-y += 5.0/
endif

MTK_SECURE_FD_SUPPORT := 0
subdir-ccflags-y += -DMTK_FD_LARB=$(MTK_FD_LARB)
subdir-ccflags-y += -DMTK_SECURE_FD_SUPPORT=$(MTK_SECURE_FD_SUPPORT)


