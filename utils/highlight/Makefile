# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=highlight
PKG_VERSION:=4.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://andre-simon.de/zip
PKG_HASH:=080bdbc26342f11aaf78747e4a4db86ffedbaf2f053d4aad2d84d271f6647dcf

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=boost

include $(INCLUDE_DIR)/package.mk

define Package/highlight
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=an universal sourcecode to formatted text converter
  URL:=http://andre-simon.de/
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
