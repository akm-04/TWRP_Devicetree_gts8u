#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from gts8uwifi device
$(call inherit-product, device/samsung/gts8uwifi/device.mk)

PRODUCT_DEVICE := gts8uwifi
PRODUCT_NAME := omni_gts8uwifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X900
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gts8uwifixx-user 12 SP2A.220305.013 X900XXU9DYE5 release-keys"

BUILD_FINGERPRINT := samsung/gts8uwifixx/gts8uwifi:12/SP2A.220305.013/X900XXU9DYE5:user/release-keys
