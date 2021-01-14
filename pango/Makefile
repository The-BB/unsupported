#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#XXX v 1.41.1 and up use external fribidi

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.40.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/
PKG_HASH:=90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3

LICENSE:=LGPL-2.0-or-later

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/pango/Default
  TITLE:=Pango
  URL:=http://www.pango.org/
endef

define Package/libpango
  $(call Package/pango/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
  DEPENDS:=+libcairo +libharfbuzz $(INTL_DEPENDS)
endef

define Package/libpango/description
  Pango is a library for laying out and rendering of text, with an emphasis
  on internationalization.
endef

define Package/pango-view
  $(call Package/pango/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= text viewer
  DEPENDS:=+libpango
endef

define Package/pango-view/description
  Pango text viewer.
endef

CONFIGURE_ARGS += \
	--enable-debug=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/pango-1.0/pango
	$(CP) $(PKG_INSTALL_DIR)/opt/include/pango-1.0/pango/*.h \
		 $(1)/opt/include/pango-1.0/pango/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango{,cairo,ft2}-1.0.so* \
		$(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/pango{,cairo,ft2}.pc \
		$(1)/opt/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/lib,' \
			$(1)/opt/lib/pkgconfig/*.pc
endef

define Package/libpango/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango*.so.* $(1)/opt/lib/
endef

define Package/pango-view/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pango-view $(1)/opt/bin
endef

$(eval $(call BuildPackage,libpango))
#$(eval $(call BuildPackage,pango-view))
