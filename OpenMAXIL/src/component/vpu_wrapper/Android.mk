ifeq ($(HAVE_FSL_IMX_CODEC),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(BOARD_VPU_TYPE), hantro)
LOCAL_SRC_FILES := vpu_wrapper_hantro.c \
	utils.c

LOCAL_CFLAGS += -DSET_OUTPUT_CROP_RECT -DUSE_EXTERNAL_BUFFER -DUSE_OUTPUT_RELEASE -DVSI_API -DIS_G2_DECODER -DENABLE_CODEC_HEVC -DGET_FREE_BUFFER_NON_BLOCK -DDOWN_SCALER -DENABLE_CODEC_VP8
else
LOCAL_SRC_FILES := vpu_wrapper.c
endif

LOCAL_VENDOR_MODULE := $(FSL_OMX_TARGET_OUT_VENDOR)

LOCAL_CFLAGS += $(FSL_OMX_CFLAGS) -Wno-error=date-time


LOCAL_LDFLAGS += $(FSL_OMX_LDFLAGS)

LOCAL_C_INCLUDES += $(FSL_OMX_INCLUDES) \

LOCAL_MODULE:= lib_vpu_wrapper


LOCAL_SHARED_LIBRARIES := libutils libc libm libstdc++ \
    			  lib_omx_osal_v2_arm11_elinux

ifeq ($(BOARD_VPU_TYPE), hantro)
LOCAL_SHARED_LIBRARIES +=  libcodec libhantro
else
LOCAL_SHARED_LIBRARIES +=  libvpu
endif

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := eng
include $(BUILD_SHARED_LIBRARY)


endif
