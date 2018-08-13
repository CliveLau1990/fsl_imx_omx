ifeq ($(HAVE_FSL_IMX_CODEC),true)


LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_VENDOR_MODULE := $(FSL_OMX_TARGET_OUT_VENDOR)
LOCAL_MODULE := core_register
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := core_register
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_VENDOR_MODULE := $(FSL_OMX_TARGET_OUT_VENDOR)
LOCAL_MODULE := component_register
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := component_register

ifeq ($(findstring xarm2_8q,x$(TARGET_PRODUCT)), xarm2_8q)
LOCAL_SRC_FILES := component_register_arm2_8q
endif
ifeq ($(findstring xmek_8q,x$(TARGET_PRODUCT)), xmek_8q)
LOCAL_SRC_FILES := component_register_mek_8q
endif
ifeq ($(findstring xevk_8mq,x$(TARGET_PRODUCT)), xevk_8mq)
LOCAL_SRC_FILES := component_register_evk_8mq
endif

LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_VENDOR_MODULE := $(FSL_OMX_TARGET_OUT_VENDOR)
LOCAL_MODULE := contentpipe_register
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := contentpipe_register
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)


endif
