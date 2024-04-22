# SPDX-License-Identifier: WTFPL

# 2.0.13: __kernel_time64_t (since Linux 4.18); statx (since Linux 4.11)

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=klibc
PKG_VERSION:=2.0.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@KERNEL/linux/libs/klibc/2.0
PKG_HASH:=0fd8043a212cf0e248a62f8a469ca328400c5b95f9b5bd9f33ce5b5f721059bb

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=

PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_KLIBC_UTILS_SHARED

include $(INCLUDE_DIR)/package.mk

define Package/klibc-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=small utilities built with klibc
  URL:=https://www.zytor.com/mailman/listinfo/klibc
  PKG_DEFAULT_DEPENDS:=
endef

define Package/klibc-utils/description
  This package contains a collection of programs that are linked
  against klibc. These duplicate some of the functionality of a regular Linux
  toolset, but are typically much smaller than their full-function counterparts.
  They are intended for inclusion in initramfs images and embedded systems.
endef

define Package/klibc-utils/config
config KLIBC_UTILS_SHARED
	bool "Enable shared"
	depends on PACKAGE_klibc-utils
endef

KLIBC_ARCH:=$(subst aarch64,arm64,$(subst mipsel,mips,$(ARCH)))

MAKE_VARS += \
	KLIBCARCH=$(KLIBC_ARCH) \
	KLIBCKERNELSRC=$(TOOLCHAIN_DIR) \
	KSHARED=$(if $(CONFIG_KLIBC_UTILS_SHARED),y,n)

Build/Configure:=:

define Package/klibc-utils/install
	$(INSTALL_DIR) $(1)/opt/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/usr/bin/* $(1)/opt/usr/sbin
ifeq ($(CONFIG_KLIBC_UTILS_SHARED),y)
	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/usr/lib/klib*.so $(1)/opt/usr/lib
endif
	# remove kinit - tiny init program
	rm -f $(1)/opt/usr/sbin/{fstype,ipconfig,kinit,nfsmount,resume,run-init}
endef

$(eval $(call BuildPackage,klibc-utils))
