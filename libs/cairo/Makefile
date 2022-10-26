# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.17.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://cairographics.org/snapshots
PKG_HASH:=74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705

PKG_LICENSE:=LGPL-2.1-only MPL-1.1
PKG_LICENSE_FILES:=COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libcairo
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cairo library
  URL:=https://www.cairographics.org/
  DEPENDS:=+fontconfig +glib2 +libfreetype +liblzo +libpng +pixman $(INTL_DEPENDS)
endef

define Package/libcairo/description
  Cairo is a 2D graphics library with support for multiple output devices.
endef

CONFIGURE_ARGS += \
	--enable-interpreter=no \
	--enable-gtk-doc=no \
	--enable-trace=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/include/cairo/*.h 	$(1)/opt/include/cairo/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo*.{a,so*} $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo*.pc \
		$(1)/opt/lib/pkgconfig/
endef

define Package/libcairo/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,libcairo))
