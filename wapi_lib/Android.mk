LOCAL_PATH:= $(call my-dir)
WAPI_LIB_SOURCES_AVAILABLE := y

ifeq ($(WAPI_LIB_SOURCES_AVAILABLE), y)

include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := \
	cert.c ecc_openssl.c alg_comm.c sms4c.c wapi.c wapi_common.c wapi_interface.c wpi_pcrypt.c
LOCAL_C_INCLUDES += \
	external/boringssl/include
LOCAL_CFLAGS += -DLE -DECC_NO_ECC192_ECDH -DECC_NEED_NID_X9_62_PRIME192V4 -DASUE
LOCAL_MODULE:= libwapi
LOCAL_MODULE_TAGS := debug
include $(BUILD_STATIC_LIBRARY)

else

include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := libwapi.a
LOCAL_MODULE:= libwapi
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
include $(BUILD_PREBUILT)

endif
