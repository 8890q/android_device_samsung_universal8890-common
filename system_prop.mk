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

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.winupdate=1 \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    ro.opengles.version=196610 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.running_without_sync_framework=false \
    ro.surface_flinger.vsync_event_phase_offset_ns=0 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=0 \
    ro.zygote.disable_gl_preload=true

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=mdfpp

# LKMD
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.log_stats=true \
    ro.lmk.use_minfree_levels=true \
    ro.lmk.use_psi=false

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=0 \
    debug.stagefright.omx_default_rank=0 \
    debug.stagefright.omx_default_rank.sw-audio=1

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.hdcp2.rx=tz \
    telephony.lteOnCdmaDevice=0 \
    vendor.sec.rild.libpath=/vendor/lib64/libsec-ril.so \
    vendor.sec.rild.libpath2=/vendor/lib64/libsec-ril-dsds.so

# SLSI
PRODUCT_PROPERTY_OVERRIDES += \
    debug.slsi_platform=1

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.direct.interface=p2p-dev-wlan0
	
# WiFi Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wfdsupport=1
