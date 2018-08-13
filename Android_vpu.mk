ifeq ($(BOARD_HAVE_VPU),true)

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
FSL_OMX_CFLAGS += -DANDROID_BUILD -D_POSIX_SOURCE -UDOMX_MEM_CHECK -Wno-unused-parameter -Werror

FSL_OMX_LDFLAGS := -Wl,--fatal-warnings

FSL_OMX_INCLUDES := \
	$(LOCAL_PATH)/OSAL/ghdr \
	$(LOCAL_PATH)/utils \
	$(LOCAL_PATH)/OpenMAXIL/ghdr \
	$(LOCAL_PATH)/OpenMAXIL/src/component/common \
	$(LOCAL_PATH)/../imx-vpu-cnm \
	$(LOCAL_PATH)/../../hardware/imx/include \
	$(LOCAL_PATH)/../../frameworks/native/include/media/hardware \
	$(LOCAL_PATH)/../../device/fsl-codec/ghdr \
	$(LOCAL_PATH)/../../device/fsl-codec/ghdr/common

FSL_OMX_INCLUDES +=	$(FSL_OMX_PATH)/../imx-vpu-hantro/decoder_sw/software/source/inc \
					$(FSL_OMX_PATH)/../imx-vpu-hantro/openmax_il/source/decoder \
					$(FSL_OMX_PATH)/../imx-vpu-hantro/openmax_il/source

ifeq ($(use_gralloc_v3), true)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v3 \
	                    $(LOCAL_PATH)/../../hardware/imx/display/display
endif

ifeq ($(TARGET_BOARD_PLATFORM), imx5x)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/mx5x/libgralloc
    FSL_OMX_CFLAGS += -DMX5X
endif
ifeq ($(TARGET_BOARD_PLATFORM), imx6)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2 \
                        $(LOCAL_PATH)/../../device/nxp/$(TARGET_BOOTLOADER_BOARD_NAME)/display/gralloc_v2 \
                        $(LOCAL_PATH)/../../device/nxp/$(TARGET_BOOTLOADER_BOARD_NAME)/include
    FSL_OMX_CFLAGS += -DMX6X
endif
ifeq ($(TARGET_BOARD_PLATFORM), imx7)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2 \
                        $(LOCAL_PATH)/../../device/nxp/$(TARGET_BOOTLOADER_BOARD_NAME)/gralloc
    FSL_OMX_CFLAGS += -DMX7X
endif
ifeq ($(TARGET_BOARD_PLATFORM), imx8)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2
    FSL_OMX_CFLAGS += -DMX8X
endif



include $(FSL_OMX_PATH)/OSAL/linux/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/common/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/resource_mgr/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/core/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/release/registry/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_wrapper/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_dec_v2/Android.mk
ifneq ($(BOARD_VPU_TYPE), hantro)
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_enc/Android.mk
endif
include $(FSL_OMX_PATH)/OpenMAXIL/src/client/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/test/vpu_test/Android.mk
include $(FSL_OMX_PATH)/stagefright/Android.mk

include $(FSL_OMX_PATH)/utils/Android.mk

#add this for tunneled playback
include $(FSL_OMX_PATH)/OpenMAXIL/src/core_mgr/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/clock/Android.mk
ifeq ($(HAVE_FSL_IMX_IPU),true)
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/ipulib_render/Android.mk
endif
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/mx8mq_fb_render/Android.mk
endif
