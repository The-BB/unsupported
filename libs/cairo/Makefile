# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.17.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://cairographics.org/snapshots
PKG_HASH:=5b10c8892d1b58d70d3f0ba5b47863a061262fa56b9dc7944161f8c8b783bc64

PKG_LICENSE:=LGPL-2.1-only MPL-1.1
PKG_LICENSE_FILES:=COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libcairo
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cairo library
  URL:=https://www.cairographics.org/
  DEPENDS:=+fontconfig +libfreetype +libpng +pixman
endef

define Package/libcairo/description
  Cairo is a 2D graphics library with support for multiple output devices.
endef

MESON_ARGS += \
	-Dtests=disabled \
	-Ddwrite=disabled \
	-Dxcb=disabled \
	-Dxlib=disabled \
	-Dzlib=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/include/cairo/*.h 	$(1)/opt/include/cairo/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo*.so* $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo*.pc \
		$(1)/opt/lib/pkgconfig/
endef

define Package/libcairo/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,libcairo))
