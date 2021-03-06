RELOADED_REVISION := 12.1

RELOADED_BUILD_TYPE ?= UNOFFICIAL
RELOADED_BUILD_VARIANT ?= VANILLA
RELOADED_BUILD_MAINTAINER ?= Unknown

  OFFICIAL_DEVICES = $(shell cat vendor/reloaded/reloaded.devices)
  FOUND_DEVICE =  $(filter $(RELOADED_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(RELOADED_BUILD))
      RELOADED_BUILD_TYPE := OFFICIAL
    else
      RELOADED_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(RELOADED_BUILD)")
    endif

ifeq ($(WITH_GAPPS), true)
RELOADED_BUILD_VARIANT := GAPPS
endif

RELOADED_DATE_YEAR := $(shell date +%Y)
RELOADED_DATE_MONTH := $(shell date +%m)
RELOADED_DATE_DAY := $(shell date +%d)
RELOADED_DATE_HOUR := $(shell date +%H)
RELOADED_DATE_MINUTE := $(shell date +%M)
RELOADED_BUILD_DATE := $(RELOADED_DATE_YEAR)$(RELOADED_DATE_MONTH)$(RELOADED_DATE_DAY)-$(RELOADED_DATE_HOUR)$(RELOADED_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst reloaded_,,$(TARGET_PRODUCT))

RELOADED_VERSION := Reloaded-$(RELOADED_REVISION)-$(RELOADED_BUILD_VARIANT)-$(TARGET_PRODUCT_SHORT)-$(RELOADED_BUILD_TYPE)-$(RELOADED_BUILD_DATE)

RELOADED_VERSION_PROP := $(RELOADED_REVISION)-$(RELOADED_BUILD_TYPE)-$(TARGET_PRODUCT_SHORT)-$(RELOADED_BUILD_DATE)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="$(BUILD_ID)-$(BUILD_USERNAME)@$(BUILD_HOSTNAME)"

PRODUCT_GENERIC_PROPERTIES += \
ro.reloaded.build.variant= $(RELOADED_BUILD_VARIANT)
