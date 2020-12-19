#!/bin/bash
#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE_COMMON=universal8890-common
VENDOR=samsung

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE_COMMON}" "${VENDOR}" "${ANDROID_ROOT}" true

# Warning headers and guards
write_headers "herolte hero2lte"

write_makefiles "${MY_DIR}/proprietary-files.txt" true

###################################################################################################
# CUSTOM PART START                                                                               #
###################################################################################################
OUTDIR=vendor/$VENDOR/$DEVICE_COMMON
(cat << EOF) >> $ANDROID_ROOT/$OUTDIR/Android.mk
include \$(CLEAR_VARS)

EGL_LIBS := libGLES_mali.so libOpenCL.so libOpenCL.so.1 libOpenCL.so.1.1

EGL_32_SYMLINKS := \$(addprefix \$(TARGET_OUT_VENDOR)/lib/,\$(EGL_LIBS))
\$(EGL_32_SYMLINKS): \$(LOCAL_INSTALLED_MODULE)
	@echo "Symlink: EGL 32-bit lib: \$@"
	@mkdir -p \$(dir \$@)
	@rm -rf \$@
	\$(hide) ln -sf /vendor/lib/egl/libGLES_mali.so \$@

EGL_64_SYMLINKS := \$(addprefix \$(TARGET_OUT_VENDOR)/lib64/,\$(EGL_LIBS))
\$(EGL_64_SYMLINKS): \$(LOCAL_INSTALLED_MODULE)
	@echo "Symlink: EGL 64-bit lib : \$@"
	@mkdir -p \$(dir \$@)
	@rm -rf \$@
	\$(hide) ln -sf /vendor/lib64/egl/libGLES_mali.so \$@

VULKAN_LIBS := vulkan.exynos5.so

VULKAN_32_SYMLINKS := \$(addprefix \$(TARGET_OUT_VENDOR)/lib/hw/,\$(VULKAN_LIBS))
\$(VULKAN_32_SYMLINKS): \$(LOCAL_INSTALLED_MODULE)
	@echo "Copy: Vulkan 32-bit lib: \$@"
	@mkdir -p \$(dir \$@)
	@rm -rf \$@
	\$(hide) cp \$(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so \$@

VULKAN_64_SYMLINKS := \$(addprefix \$(TARGET_OUT_VENDOR)/lib64/hw/,\$(VULKAN_LIBS))
\$(VULKAN_64_SYMLINKS): \$(LOCAL_INSTALLED_MODULE)
	@echo "Copy: Vulkan 64-bit lib: \$@"
	@mkdir -p \$(dir \$@)
	@rm -rf \$@
	\$(hide) cp \$(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so \$@

ALL_DEFAULT_INSTALLED_MODULES += \$(EGL_32_SYMLINKS) \$(EGL_64_SYMLINKS) \$(VULKAN_32_SYMLINKS) \$(VULKAN_64_SYMLINKS)

EOF
###################################################################################################
# CUSTOM PART END                                                                                 #
###################################################################################################

# Done
write_footers
