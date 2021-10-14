# SPDX-License-Identifier: GPL-2.0-only

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

define Package/cairo/Default
  URL:=https://www.cairographics.org/
endef

define Package/libcairo
  $(call Package/cairo/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cairo library
  DEPENDS:=+fontconfig +glib2 +libfreetype +liblzo +libpng +pixman $(INTL_DEPENDS)
endef

define Package/libcairo/description
  Cairo is a 2D graphics library with support for multiple output devices.
endef

define Package/cairo-trace
  $(call Package/cairo/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Cairo Utilities
  DEPENDS:=+zlib
endef

define Package/cairo-trace/description
  This tool can be used to trace all the cairo function calls made by an
  applications.  This is useful for either extracting a test case triggering
  a bug from an application, or simply to get a general idea of how an
  application is using cairo.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/include/cairo/*.h 	$(1)/opt/include/cairo/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo*.so* $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo{,-ft}.pc \
		$(1)/opt/usr/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/lib,' \
			$(1)/opt/usr/lib/pkgconfig/cairo{,-ft}.pc
endef

define Package/libcairo/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo.so.* $(1)/opt/lib/
endef

define Package/cairo-trace/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/cairo-trace $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/lib/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cairo/libcairo-trace.so $(1)/opt/lib/cairo/
endef

$(eval $(call BuildPackage,libcairo))
#$(eval $(call BuildPackage,cairo-trace))
