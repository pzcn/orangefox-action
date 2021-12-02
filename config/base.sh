export ALLOW_MISSING_DEPENDENCIES=true
export TW_DEFAULT_LANGUAGE="zh_CN"
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"

export FOX_REPLACE_BUSYBOX_PS=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_NANO_EDITOR=1
export FOX_DELETE_AROMAFM=1
export FOX_VARIANT=MIUI
export FOX_REMOVE_AAPT=1
export FOX_RESET_SETTINGS=disabled
export FOX_USE_SPECIFIC_MAGISK_ZIP=$GITHUB_WORKSPACE/res/Magisk.zip

export OF_NO_MIUI_OTA_VENDOR_BACKUP=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_MAINTAINER=PedroZ
export OF_STATUS_INDENT_RIGHT=60
export OF_USE_MAGISKBOOT=1
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_DONT_KEEP_LOG_HISTORY=1
export OF_ENABLE_LPTOOLS=1
export OF_PATCH_AVB20=1
export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

sed -i "s/TW_H_OFFSET/#TW_H_OFFSET/g" device/xiaomi/umi/BoardConfig.mk
sed -i "s/TW_Y_OFFSET/#TW_Y_OFFSET/g" device/xiaomi/umi/BoardConfig.mk

rm -rf device/xiaomi/umi/recovery/root/customzip

rm -rf bootable/recovery/gui/theme/extra-languages/fonts/DroidSansFallback.ttf
cp $GITHUB_WORKSPACE/res/font.ttf bootable/recovery/gui/theme/extra-languages/fonts/DroidSansFallback.ttf

rm -rf bootable/recovery/gui/theme/extra-languages/languages/zh_CH.xml
cp $GITHUB_WORKSPACE/res/zh_CH.xml bootable/recovery/gui/theme/extra-languages/languages/zh_CH.xml

source $GITHUB_WORKSPACE/config/device/$DEVICE_NAME.sh || true

if [[ $DEVICE_BRANCH =~ 11 ]]; then
    export TARGET_VERSION=R
elif [[ $DEVICE_BRANCH =~ 12 ]]; then
    export TARGET_VERSION=S
    source $GITHUB_WORKSPACE/config/spatch.sh
else 
    TARGET_VERSION=$DEVICE_BRANCH
fi
    export FOX_VERSION=$(TZ=UTC-8 date +%m%d)_$TARGET_VERSION
