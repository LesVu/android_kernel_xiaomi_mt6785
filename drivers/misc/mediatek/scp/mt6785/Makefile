SCP_VERSION := v01
SCP_VERSION_PATH := ../$(SCP_VERSION)

obj-y += $(SCP_VERSION_PATH)/
obj-y += scp_feature_table.o
obj-y += scp_awake.o
obj-y += scp_dvfs.o

ccflags-y += -I$(srctree)/drivers/misc/mediatek/include/mt-plat/$(CONFIG_MTK_PLATFORM)/include/mach
ccflags-y += -I$(srctree)/drivers/misc/mediatek/base/power/include/
ccflags-y += -I$(srctree)/drivers/devfreq/
ccflags-$(CONFIG_MTK_PMIC_CHIP_MT6359)+= -I$(srctree)/drivers/misc/mediatek/pmic/include/mt6359

