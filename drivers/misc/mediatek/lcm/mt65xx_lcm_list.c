/*
 * Copyright (C) 2015 MediaTek Inc.
 * Copyright (C) 2021 XiaoMi, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 */

#include "mt65xx_lcm_list.h"
#include <lcm_drv.h>
#ifdef BUILD_LK
#include <platform/disp_drv_platform.h>
#else
#include <linux/delay.h>
/* #include <mach/mt_gpio.h> */
#endif
enum LCM_DSI_MODE_CON lcm_dsi_mode;

/* used to identify float ID PIN status */
#define LCD_HW_ID_STATUS_LOW      0
#define LCD_HW_ID_STATUS_HIGH     1
#define LCD_HW_ID_STATUS_FLOAT 0x02
#define LCD_HW_ID_STATUS_ERROR  0x03

struct LCM_DRIVER *lcm_driver_list[] = {
#if defined(DSI_PANEL_K7_38_0C_0A_FHDP_VIDEO)
		&dsi_panel_k7_38_0c_0a_fhdp_video,
#endif
#if defined(DSI_PANEL_K7_44_06_0B_FHDP_VIDEO)
		&dsi_panel_k7_44_06_0b_fhdp_video,
#endif
#if defined(DSI_PANEL_K7_44_0E_0B_FHDP_VIDEO)
		&dsi_panel_k7_44_0e_0b_fhdp_video,
#endif
#if defined(DSI_PANEL_K7_38_0C_0A_FHDP_VIDEO)
		&dsi_panel_k7_38_0c_0a_fhdp_video,
#endif
#if defined(DSI_PANEL_K7_44_06_0B_FHDP_VIDEO)
		&dsi_panel_k7_44_06_0b_fhdp_video,
#endif
#if defined(DSI_PANEL_K7_44_0E_0B_FHDP_VIDEO)
		&dsi_panel_k7_44_0e_0b_fhdp_video,
#endif
};

unsigned char lcm_name_list[][128] = {

};

#define LCM_COMPILE_ASSERT(condition) \
	LCM_COMPILE_ASSERT_X(condition, __LINE__)
#define LCM_COMPILE_ASSERT_X(condition, line) \
	LCM_COMPILE_ASSERT_XX(condition, line)
#define LCM_COMPILE_ASSERT_XX(condition, line) \
	char assertion_failed_at_line_##line[(condition) ? 1 : -1]

unsigned int lcm_count =
	sizeof(lcm_driver_list) / sizeof(struct LCM_DRIVER *);
LCM_COMPILE_ASSERT(sizeof(lcm_driver_list) / sizeof(struct LCM_DRIVER *) != 0);

