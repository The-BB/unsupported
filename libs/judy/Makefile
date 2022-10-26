# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=judy
PKG_VERSION:=1.0.5
PKG_RELEASE:=1

PKG_SOURCE:=Judy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_HASH:=d2704089f85fdb6f2cd7e77be21170ced4b4375c03ef1ad4cf1075bd414a63eb

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/judy
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=C library for creating and accessing dynamic arrays
  URL:=https://judy.sourceforge.net/
endef

define Package/judy/description
  Judy is a general purpose dynamic array implemented as a C callable library.
  Judy's speed and memory usage are typically better than other data storage 
  models and improves with very large data sets.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
CONFIGURE_ARGS += \
	--enable-64-bit
else
CONFIGURE_ARGS += \
	--enable-32-bit
endif

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/Judy.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libJudy.{a,so*} $(1)/opt/lib/
endef

define Package/judy/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libJudy.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,judy))
