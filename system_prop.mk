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

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio_hal.force_voice_config=wide \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7 \
    ro.config.systemaudiodebug=arizona

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/persistent

# Fastbootd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fastbootd.available=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.winupdate=1 \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    ro.opengles.version=196610 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.protected_contents=true \
    ro.vendor.ddk.set.afbc=1 \
    ro.zygote.disable_gl_preload=true

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=mdfpp

# LKMD
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.kill_timeout_ms=1000 \
    ro.lmk.log_stats=true \
    ro.lmk.upgrade_pressure=60 \
    ro.lmk.use_minfree_levels=true \
    ro.lmk.use_psi=false

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=0 \
    debug.stagefright.omx_default_rank=0 \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    ro.vendor.cscsupported=1

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.fw_dl_on_boot=false \
    ro.nfc.port="I2C"

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.hdcp2.rx=tz \
    telephony.lteOnCdmaDevice=0 \
    vendor.sec.rild.libpath=/vendor/lib64/libsec-ril.so \
    vendor.sec.rild.libpath2=/vendor/lib64/libsec-ril-dsds.so

# Security
PRODUCT_PROPERTY_OVERRIDES += \
    security.ASKS.policy_version=00000000 \
    security.mdf.result=None \
    security.mdf=None \
    ro.security.mdf.ux=Enabled \
    ro.security.mdf.ver=3.1 \
    ro.security.wlan.ver=1.0 \
    ro.security.wlan.release=2 \
    ro.security.mdf.release=4 \
    ro.security.fips.ux=Enabled \
    ro.security.fips_bssl.ver=1.3 \
    ro.security.fips_skc.ver=1.7 \
    ro.security.fips_scrypto.ver=1.0 \
    ro.security.vpnpp.ver=2.1 \
    ro.security.vpnpp.release=2.0

# SLSI
PRODUCT_PROPERTY_OVERRIDES += \
    debug.slsi_platform=1

# Widevine
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.direct.interface=p2p-dev-wlan0
	
# WiFi Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wfdsupport=1
