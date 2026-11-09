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

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/samsung/universal8890-common/overlay/hardware/samsung/AdvancedDisplay

# APEX
OVERRIDE_PRODUCT_COMPRESSED_APEX := false

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_CGROUP_V2_SYS_APP_ISOLATION_ENABLED := false

# Select real v1 memory/freezer controllers on the ported Linux 4.4 kernel.
# The vendor descriptors override the platform defaults by controller name.
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(COMMON_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    $(COMMON_PATH)/ramdisk/etc/init.universal8890.cgroups.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.universal8890.cgroups.rc

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Atrace HAL
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service.universal8890

# Audio
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.universal8890 \
    android.hardware.audio.service.universal8890 \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    libstagefright_softomx \
    libtinycompress \
    libstagefright_softomx_plugin

TARGET_EXCLUDES_AUDIOFX := true

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl:64 \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# Camera
$(call soong_config_set,samsungCameraVars,needs_sec_reserved_field,true)
$(call soong_config_set,samsungCameraVars,usage_64bit,true)

PRODUCT_PACKAGES += \
    camera.exynos5 \
    libpower.vendor \
    android.hardware.camera.provider-service.samsung

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/sysconfig/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Charger
PRODUCT_PACKAGES += \
    libsuspend

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl:32 \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.0-impl \
    android.hardware.drm-service.clearkey

# DTB tool
PRODUCT_HOST_PACKAGES += \
    dtbhtoolExynos

# FastCharge
$(call soong_config_set,lineage_health,fast_charge_node,/sys/class/sec/switch/afc_disable)
$(call soong_config_set,lineage_health,fast_charge_value_none,1)
$(call soong_config_set,lineage_health,fast_charge_value_fast_charge,0)

PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay-service.samsung-exynos

# Filesystem tools for resizing system partitions
PRODUCT_PACKAGES += \
    e2fsck_static \
    resize2fs_static

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samsung

# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    libgatekeeper

# GNNS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service \
    android.hardware.gnss@1.1.vendor \
    android.frameworks.sensorservice@1.0.vendor

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gps/gps.conf:system/etc/gps.conf

# VNDK
PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite-v29 \
    libprotobuf-cpp-lite-vendorcompat \
    libhidlbase-v32.vendor \
    android.hidl.allocator@1.0.vendor


# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl:64 \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    libhwc2on1adapter \
    hwcomposer.universal8890 \
    memtrack.universal8890 \
    libion_exynos \
    libGrallocWrapper \
    gralloc.exynos5 \
    libion \
    libcsc \
    libexynosscaler \
    libexynosgscaler \
    libhwjpeg \
    libutilscallstack

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

# Keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl \
    $(COMMON_PATH)/configs/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl \
    $(COMMON_PATH)/configs/keylayout/sec_e-pen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_e-pen.kl \
    $(COMMON_PATH)/configs/idc/ft5x06_ts.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/ft5x06_ts.idc \
    $(COMMON_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(COMMON_PATH)/configs/idc/Synaptics_RMI4_TouchPad_Sensor.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
    $(COMMON_PATH)/configs/idc/sec_touchscreen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_touchscreen.idc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0 \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl:64 \
    libkeymaster3device

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.samsung

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(COMMON_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.0.vendor \
    android.hardware.neuralnetworks@1.1.vendor \
    libtextclassifier_hash.vendor

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.2-service.samsung

## This is a workaround for the Bluetooth sanitize shadow call stack (SCS)
## crash reported here: https://issuetracker.google.com/issues/302408537,
## until the new version Mali binaries released.
## For details of the root cause and the cts vts tests comparison between
## the preloading and non-preloading builds, please check the above issue.
PRODUCT_PROPERTY_OVERRIDES += ro.zygote.disable_gl_preload=1

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/nfc/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf \
    $(COMMON_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    $(COMMON_PATH)/configs/nfc/nfcee_access.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/nfcee_access.xml

# OMX
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    libstagefrighthw \
    libminijail_32 \
    libExynosOMX_Core \
    libExynosOMX_Resourcemanager \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.AVC.Encoder \
    libOMX.Exynos.HEVC.Decoder \
    libOMX.Exynos.HEVC.Encoder \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.VP8.Decoder \
    libOMX.Exynos.VP8.Encoder \
    libOMX.Exynos.VP9.Decoder \
    libOMX.Exynos.VP9.Encoder \
    libOMX.Exynos.WMV.Decoder

# Permissions
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/permissions/com.samsung.permission.HRM_EXT.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.samsungexynos8890 \
    init.recovery.samsungexynos8890.rc \
    init.vendor.rilcommon.rc \
    init.samsung.rc \
    init.samsungexynos8890.rc \
    init.samsungexynos8890.usb.rc \
    ueventd.samsungexynos8890.rc

# RCS
#PRODUCT_PACKAGES += \
#    com.android.ims.rcsmanager \
#    PresencePolling \
#    RcsService

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.4-service.legacy \
    init.baseband.rc \
    libxml2.vendor \
    libnetutils.vendor \
    libsqlite.vendor \
    secril_config_svc.vendor

# Copy stock APN config as lineage one seams to be quite broken and outdated
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/ril/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    $(COMMON_PATH)/configs/ril/spn-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/spn-conf.xml

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.samsung:64 \
    android.hardware.sensors@1.0-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    bootable/deprecated-ota \
    hardware/samsung \
    hardware/google/interfaces \
    hardware/google/pixel

# Shims
PRODUCT_PACKAGES += \
    libexynoscamera_shim \
    libgui_shim \
    libdemangle.vendor

# Stagefright
PRODUCT_PACKAGES += \
    libgui_vendor

# s-pen
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.samsung

# Touch features
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.samsung

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.samsung

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    wificond \
    libwpa_client \
    TetheringConfigOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \
    android.hardware.wifi@1.0 \
    android.hardware.wifi-service

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wifi/cred.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/cred.conf \
    $(COMMON_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/universal8890-common/universal8890-common-vendor.mk)

# Legacy HAL system library dependencies
PRODUCT_PACKAGES += universal8890_linker_config
PRODUCT_EXTRA_STUB_LIBRARIES += \
    android.frameworks.schedulerservice@1.0 \
    libandroid \
    libcamera_client \
    libstdc++
