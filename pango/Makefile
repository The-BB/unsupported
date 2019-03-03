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

PKG_LICENSE:=LGPL-2.0+

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/pango
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Pango library
  URL:=http://www.pango.org/
  DEPENDS:=+cairo +fontconfig +libfreetype +harfbuzz +glib2 $(INTL_DEPENDS)
endef

define Package/pango/description
  Pango is a library for laying out and rendering of text, with an emphasis \
on internationalization.
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/opt/include/harfbuzz

CONFIGURE_ARGS += \
	--enable-explicit-deps=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/{include,lib}
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/* $(1)/opt/lib/
endef

define Package/pango/install
	$(INSTALL_DIR) $(1)/opt/{bin,lib}
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pango-view $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango*.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,pango))
