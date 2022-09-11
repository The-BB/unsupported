# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=highlight
PKG_VERSION:=4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.andre-simon.de/zip
PKG_HASH:=ed3efdb9b416b236e503989f9dfebdd94bf515536cfd183aefe36cefdd0d0468

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/highlight
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a universal sourcecode to formatted text converter
  URL:=http://www.andre-simon.de/
  DEPENDS:=+libstdcpp +lua
endef

define Package/highlight/description
  Highlight converts source code to formatted text with syntax highlighting.
endef

Build/Configure:=:

define Package/highlight/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/highlight $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/highlight
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/etc/highlight/*.conf \
		 $(1)/opt/etc/highlight

	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/highlight $(1)/opt/share
endef

$(eval $(call BuildPackage,highlight))