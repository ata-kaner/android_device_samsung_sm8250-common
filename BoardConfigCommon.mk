#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/sm8350-common

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Platform
PRODUCT_PLATFORM := lahaina
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := lahaina

TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

# Kernel config
TARGET_KERNEL_SOURCE        := kernel/samsung/sm8350
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64
TARGET_LINUX_KERNEL_VERSION := 5.4

# Kernel flags
BOARD_KERNEL_CMDLINE += console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket firmware_class.path=/vendor/firmware_mnt/image printk.devkmsg=on pcie_ports=compat cpuinfo.chipname=SM8350 panic=4
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_BOOT_HEADER_VERSION := 3

BOARD_KERNEL_BASE            := 0x00000000
BOARD_KERNEL_PAGESIZE        := 4096
BOARD_RAMDISK_OFFSET         := 0x02000000
BOARD_DTB_OFFSET             := 0x01f00000
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_KERNEL_TAGS_OFFSET     := 0x01e00000
BOARD_KERNEL_IMAGE_NAME      := Image
BOARD_KERNEL_SEPARATED_DTBO  := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_RAMDISK_USE_LZ4        := true

# Kernel: mkbootimgs args
BOARD_CUSTOM_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board $(BOARD_NAME)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)

# Additional root folders
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

BOARD_ROOT_EXTRA_FOLDERS += \
    carrier \
    efs \
    metadata \
    misc \
    optics \
    prism \
    spu

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4

BOARD_USES_METADATA_PARTITION        := true
TARGET_USERIMAGES_USE_F2FS           := true
TARGET_USERIMAGES_USE_EXT4           := true

# Partition sizes, obtained with blockdev --getsize64
BOARD_DTBOIMG_PARTITION_SIZE                    := 25165824
BOARD_BOOTIMAGE_PARTITION_SIZE                  := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE           := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE              := 81788928
BOARD_CACHEIMAGE_PARTITION_SIZE                 := 629145600
BOARD_SUPER_PARTITION_SIZE                      := 10643046400
BOARD_SUPER_PARTITION_GROUPS                    := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE           := 10643046400
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE       := 3000000000
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE       := 400000000
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE      := 1500000000
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE     	:= 50000000
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT             := -1
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT             := -1
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT            := -1
BOARD_ODMIMAGE_EXTFS_INODE_COUNT           	:= -1

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Out dirs
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm

# Audio policy
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
AUDIOSERVER_MULTILIB := 32

# Audio
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := false
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

## Camera
#SOONG_CONFIG_NAMESPACES += samsungCameraVars
#SOONG_CONFIG_samsungCameraVars += \
#    extra_ids \
#    needs_sec_reserved_field
#
## ID=54 is macro
#SOONG_CONFIG_samsungCameraVars_extra_ids := 54
#
#SOONG_CONFIG_samsungCameraVars_needs_sec_reserved_field := true

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_samsung_sm8350

# HIDL manifests
DEVICE_MANIFEST_SKUS := lahaina
DEVICE_MANIFEST_LAHAINA_FILES += $(COMMON_PATH)/configs/manifest_lahaina.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/configs/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(COMMON_PATH)/configs/framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Samsung
BOARD_VENDOR := samsung

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/batt_slate_mode
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 0
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 1
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Display
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_RECOVERY_MKBOOTIMG_ARGS += --header_version 2
TARGET_USES_MKE2FS := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/root/fstab.default

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_samsung_sm8350
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# SePolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public

# Vibrator
$(call soong_config_set,samsungVibratorVars,duration_amplitude,true)

# Wi-Fi
BOARD_WLAN_BCMDHD_SAE            := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true
WIFI_FEATURE_HOSTAPD_11AX        := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
