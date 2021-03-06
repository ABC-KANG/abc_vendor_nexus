# Copyright (C) 2016 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include vendor/nexus/configs/aosp_fixes.mk
include vendor/nexus/configs/abc_main.mk
include vendor/nexus/configs/system_additions.mk
include vendor/nexus/configs/version.mk

# Include SDCLANG definitions if it is requested and available
ifeq ($(HOST_OS),linux)
    ifneq ($(wildcard prebuilts/clang/host/linux-x86/SDClang-4.0/),)
        ifeq ($(TARGET_USES_SDCLANG),true)
            include vendor/nexus/sdclang/sdclang.mk
        endif
    endif
endif

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Allow tethering without provisioning app
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.dun.override=0

# Bootanimation
$(call inherit-product, vendor/nexus/configs/bootanimation.mk)

