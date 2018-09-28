#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.14.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://www.cairographics.org/releases
PKG_HASH:=8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16

PKG_LICENSE:=LGPL-2.1, MPL-1.1

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/cairo
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cairo library
  URL:=https://www.cairographics.org/
  DEPENDS:=+pixman +fontconfig +libfreetype +libpng +liblzo +glib2 $(INTL_DEPENDS)
endef

define Package/cairo/description
  Cairo is a 2D graphics library with support for multiple output devices.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/{include,lib}
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/* $(1)/opt/lib/
endef

define Package/cairo/install
	$(INSTALL_DIR) $(1)/opt/lib/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cairo/*.so* $(1)/opt/lib/cairo/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,cairo))
