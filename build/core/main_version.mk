# Build fingerprint
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# ReloadedOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=$(RELOADED_VERSION) \
    ro.reloaded.version=$(RELOADED_VERSION_PROP) \
    ro.caf.version=$(shell grep "refs/tags/LA.QSSI" .repo/manifests/default.xml | cut -d '"' -f2 | cut -d "/" -f3)
