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

# Inherit from gts8u device
$(call inherit-product, device/samsung/gts8u/device.mk)


# Copy device-specific recovery root overlay (fstab, init scripts, etc.)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/gts8u/recovery/root,recovery/root)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gts8u
PRODUCT_NAME := twrp_gts8u
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X900
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung
