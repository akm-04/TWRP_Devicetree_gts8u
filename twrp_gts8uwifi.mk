#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from gts8uwifi device
$(call inherit-product, device/samsung/gts8uwifi/device.mk)

PRODUCT_DEVICE := gts8uwifi
PRODUCT_NAME := twrp_gts8uwifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X900
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Copy device-specific recovery root overlay (fstab, init scripts, etc.)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/gts8uwifi/recovery/root,recovery/root)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gts8uwifixx-user 12 SP2A.220305.013 X900XXU9DYE5 release-keys"

BUILD_FINGERPRINT := samsung/gts8uwifixx/gts8uwifi:12/SP2A.220305.013/X900XXU9DYE5:user/release-keys
