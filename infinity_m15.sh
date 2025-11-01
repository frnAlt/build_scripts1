#!/bin/bash

# Remove Local Manifests
rm -rf .repo/local_manifests/ 
#rm -rf prebuilts/clang/host/linux-x86
# rm -rf frameworks/base
# rm -rf kernel/xiaomi/mithorium-4.19/kernel
# rm -rf hardware/mithorium/
# rm -rf hardware/qcom-caf/msm8937

# Init Rom Manifest
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/tavukkdoner/manifest -b 15 -g default,-mips,-darwin,-notdefault

# Clone local_manifests repository
git clone https://github.com/frnAlt/local_manifests.git --depth 1 -b a15/-infinity .repo/local_manifests


# Sync the repositories  
/opt/crave/resync.sh 
# /opt/crave/resynctest.sh

# Set up build environment
export BUILD_USERNAME=tavukkdoner 
export BUILD_HOSTNAME=crave
source build/envsetup.sh
export WITH_GMS=false
export TARGET_BOOT_ANIMATION_RES=720
export WITH_GAPPS=false
export TARGET_ENABLE_BLUR=true
export UCLAMP_FEATURE_ENABLED=true

# lunch 
lunch infinity_Mi439_4_19-userdebug && make installclean && mka bacon

