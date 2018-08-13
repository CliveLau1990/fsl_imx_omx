ifeq ($(HAVE_FSL_IMX_CODEC),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_VENDOR_MODULE := $(FSL_OMX_TARGET_OUT_VENDOR)
LOCAL_SRC_FILES := \
	VpuDecComponent.cpp
		
LOCAL_CFLAGS += $(FSL_OMX_CFLAGS)

LOCAL_LDFLAGS += $(FSL_OMX_LDFLAGS)
 
LOCAL_C_INCLUDES += $(FSL_OMX_INCLUDES) -DDPB_FIX_APP -DDPB_FIX -Dbool $(LOCAL_PATH)/../vpu_wrapper

LOCAL_SHARED_LIBRARIES := lib_omx_common_v2_arm11_elinux \
                          lib_omx_osal_v2_arm11_elinux \
                          lib_omx_utils_v2_arm11_elinux \
			  lib_omx_res_mgr_v2_arm11_elinux \
			  lib_vpu_wrapper

ifneq ($(BOARD_VPU_TYPE), hantro)
LOCAL_SHARED_LIBRARIES += libvpu
else
LOCAL_CFLAGS += -DHANTRO_VPU
endif

LOCAL_PRELINK_MODULE := false
LOCAL_32_BIT_ONLY := true

LOCAL_MODULE:= lib_omx_vpu_dec_v2_arm11_elinux
LOCAL_MODULE_TAGS := eng
include $(BUILD_SHARED_LIBRARY)

endif