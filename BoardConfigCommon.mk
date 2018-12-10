#
# Copyright (C) 2018 The LineageOS Project
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

COMMON_PATH := device/samsung/universal8890-common

BUILD_BROKEN_DUP_RULES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := exynos-m1

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53.a57

# Audio
AUDIOSERVER_MULTILIB := 32
TARGET_AUDIOHAL_VARIANT := samsung
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging

# Compatibility Matrix
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif

# Display
TARGET_SCREEN_DENSITY := 560

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# HIDL Manifest
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_ARCH := arm64
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x10000000
#BOARD_KERNEL_CMDLINE := The bootloader ignores the cmdline from the boot.img
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_USE_XZ := true

# LED
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 41943040
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 48234496
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4400000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27044851712
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_ROOT_EXTRA_FOLDERS += efs cpefs

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOOTLOADER_BOARD_NAME := universal8890
TARGET_SOC := exynos8890

# Power
TARGET_POWERHAL_VARIANT := samsung

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/15400000.usb/15400000.dwc3/gadget/lun%d/file"

ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/recovery.fstab
TW_BRIGHTNESS_PATH := "/sys/devices/13900000.dsim/backlight/panel/brightness"
TW_DEFAULT_BRIGHTNESS := 180
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_MAX_BRIGHTNESS := 255
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
else
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/ramdisk/etc/fstab.samsungexynos8890
endif

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriverArm.so

# RIL
BOARD_MODEM_TYPE := ss333
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_USES_VND_SECRIL := true

# SECComp filters
BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib64/libexynoscamera.so|/vendor/lib64/libexynoscamera_shim.so \
    /vendor/lib/libexynoscamera.so|/vendor/lib/libexynoscamera_shim.so \
    /vendor/lib64/libexynosdisplay.so|/vendor/lib64/libexynosdisplay_shim.so \
    /vendor/lib/libexynosdisplay.so|/vendor/lib/libexynosdisplay_shim.so \
    /vendor/lib64/hw/hwcomposer.exynos5.so|/vendor/lib64/libexynosdisplay_shim.so \
    /vendor/lib/hw/hwcomposer.exynos5.so|/vendor/lib/libexynosdisplay_shim.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(COMMON_PATH)

# Wifi
TARGET_USES_64_BIT_BCMDHD        := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_USE_HIDL          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/vendor/etc/wifi/nvram.txt"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG
WIFI_HIDL_FEATURE_AWARE          := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Inherit from the proprietary version
-include vendor/samsung/universal8890-common/BoardConfigVendor.mk
