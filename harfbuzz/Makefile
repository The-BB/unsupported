#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=harfbuzz
PKG_VERSION:=1.8.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://www.freedesktop.org/software/harfbuzz/release
PKG_HASH:=a8e5c86e4d99e1cc9865ec1b8e9b05b98e413c2a885cd11f8e9bb9502dd3e3a9

PKG_LICENSE:=MIT

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/harfbuzz
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=HarfBuzz is an OpenType text shaping engine.
  URL:=https://www.freedesktop.org/wiki/Software/HarfBuzz/
  DEPENDS:=+libfreetype +icu +libstdcpp +glib2 $(INTL_DEPENDS)
endef

define Package/harfbuzz/description
  HarfBuzz is an OpenType text shaping engine.
endef

CONFUGURE_ARGS += \
	--with-coretext=no \
	--with-uniscribe=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/{include,lib}
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/* $(1)/opt/lib/
endef

define Package/harfbuzz/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,harfbuzz))
