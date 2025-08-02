
# Samsung Galaxy Tab S8 Ultra (gts8u) — TWRP Device Tree

This repository provides the device tree for building TWRP 12.1 recovery for the Galaxy Tab S8 Ultra (SM-X900 series). It has been tested on the Wi-Fi model (`gts8uwifi`) and should work on all regional variants once the codename is unified to `gts8u`.

---

## Prerequisites

1. **Host machine** running a Debian-based Linux  
2. **Android build tools** installed (Java 11, `repo`, `git`, `make`, cross-compiler-toolchain)  
3. **At least 50 GB** of free disk space  
4. **Internet connection** for repo sync  

---

## Compiling the devicetree



## 1. Initialize the TWRP Source Tree

```bash
# Create and enter your workspace
mkdir ~/twrp-build && cd ~/twrp-build
# OR create any empty directory anywhere you like the workspace to be and open an terminal there

# Initialize the repo for TWRP 12.1
repo init --depth=1 \
  -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git \
  -b twrp-12.1

# Sync all upstream repos
repo sync --no-clone-bundle
```

---

## 2. Add the Device Tree

Create the path for Samsung device trees
```bash
mkdir -p device/samsung
```
Next Clone this device tree into the proper location
```bash
git clone \
  --depth 1 \
  --branch gts8u_SM-X900 \
  --single-branch \
  https://github.com/akm-04/TWRP_Devicetree_gts8u_SM-X900.git \
  device/samsung/gts8u

```

## Directory Layout

After setup, your workspace will look like:

```bash
<workspace>/
├── build/                   ← Other build output and intermediate files
├── device/                  ← Our Clonned devicetree should be here inside this folder.
│   └── samsung/
│       └── gts8u/           ← this TWRP device tree
├── kernel/                  ← Other repo files
├── vendor/                  ← other repo files
└── ...                      ← other AOSP/TWRP sources, files and so on ..
```

---

## 4. Build TWRP Recovery

```bash
# Enable missing dependencies (allow vendor/device trees without full trees)
export ALLOW_MISSING_DEPENDENCIES=true

# Set up the build environment
. build/envsetup.sh

# Select the device lunch target
lunch twrp_gts8u-eng

# Build recovery image in parallel
make -j"$(nproc)" recoveryimage
```

When the build completes successfully, your `recovery.img` and `recovery.img` (directly odin flashable file) will be in:

```
out/target/product/gts8u/recovery.img
out/target/product/gts8u/recovery.tar
```

---
## How do we get a Patched vbmeta.img?

1. Download your stock firmware and extract the `AP` package.  
2. Inside, locate `vbmeta.img.lz4` and copy it into an empty folder.  
3. Open terminal inside that empty folder and Decompress it:
   ```bash
   lz4 -d vbmeta.img.lz4 vbmeta.img
   ```
4. Patch the byte at offset 123 to bypass verification:
   ```bash
    printf "$(printf '\\x%02X' 3)" | dd of="vbmeta.img" bs=1 seek=123 count=1 conv=notrunc &> /dev/null
   ```
5. Repackage the patched vbmeta for Odin flash:
   ```bash
   tar cvf new_patched_vbmeta.tar vbmeta.img
   ```
6. Flash `new_patched_vbmeta.tar` in Odin to your device’s userdata slot.  
---
## TWRP devicetree's prebuilt Kernel source?
The kernel source is included in this same repository.  
Switch to the `TWRP-Kernel` branch to access it.

## License

```text
#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```
