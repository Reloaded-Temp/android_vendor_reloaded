PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.opa.eligible_device=true \
    ro.setupwizard.rotation_locked=true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/reloaded/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/reloaded/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/reloaded/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/media/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

# init.d support
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit \
    vendor/reloaded/prebuilt/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/reloaded/prebuilt/etc/init.d/90userinit:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/90userinit

# Permissions
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/etc/sysconfig/hiddenapi-package-whitelist-reloaded.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist-reloaded.xml \
    vendor/reloaded/prebuilt/etc/permissions/privapp-permissions-reloaded.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-reloaded.xml

# Copy all ROM-specific init rc files
$(foreach f,$(wildcard vendor/reloaded/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/reloaded/prebuilt/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/reloaded/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/reloaded/prebuilt/media/LMprec_508.emd:$(TARGET_COPY_OUT_SYSTEM)/media/LMprec_508.emd \
    vendor/reloaded/prebuilt/media/PFFprec_600.emd:$(TARGET_COPY_OUT_SYSTEM)/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# Misc packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    ExactCalculator \
    libemoji \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    powertop \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    Terminal

PRODUCT_PACKAGES += \
    Dialer \
    messaging \
    CellBroadcastReceiver \
    Stk

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

# HIDL Wrapper
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml

# QTI Telephony Utils
PRODUCT_PACKAGES += \
    qti-telephony-utils \
    qti_telephony_utils.xml

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Telephony-ext
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# RCS
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Snapdragon packages
PRODUCT_PACKAGES += \
    MusicFX \
    SnapdragonGallery

# OTA
PRODUCT_PACKAGES += \
    ReloadedOTA

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# SoundRecorder
PRODUCT_PACKAGES += \
    SoundRecorder

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \

# Custom off-mode charger
ifeq ($(WITH_CUSTOM_CHARGER),true)
PRODUCT_PACKAGES += \
    custom_charger_res_images \
    font_log.png \
    libhealthd.custom
endif

# World APN list
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml \
    vendor/reloaded/prebuilt/etc/apns-conf-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Selective SPN list
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/etc/spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/spn-conf.xml

PRODUCT_PACKAGE_OVERLAYS += \
	vendor/reloaded/overlay/common

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/lib/libjni_latinime.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/reloaded/prebuilt/lib64/libjni_latinime.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libjni_latinime.so
endif

# by default, do not update the recovery with system updates
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.recovery_update=false

ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
else
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
endif

# Reloaded Android Overlays
PRODUCT_PACKAGES += \
    reloaded-overlays

# ThemePicker
PRODUCT_PACKAGES += \
    ThemePicker

# Launcher3
PRODUCT_PACKAGES += \
    Launcher3QuickStep

# Versioning
include vendor/reloaded/config/version.mk

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/reloaded/sdclang/sdclang.mk
endif

$(call inherit-product-if-exists, vendor/extra/product.mk)
