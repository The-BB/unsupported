#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=harfbuzz
PKG_VERSION:=2.6.7
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://www.freedesktop.org/software/harfbuzz/release
PKG_HASH:=49e481d06cdff97bf68d99fa26bdf785331f411614485d892ea4c78eb479b218

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/harfbuzz/Default
  TITLE:=an OpenType text shaping engine
  URL:=https://www.freedesktop.org/wiki/Software/HarfBuzz/
endef

define Package/libharfbuzz
  $(call Package/harfbuzz/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+glib2 +libfreetype $(INTL_DEPENDS)
endef

define Package/harfbuzz
  $(call Package/harfbuzz/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+=(bin)
  DEPENDS:=+libharfbuzz @BROKEN
endef

define Package/harfbuzz/Default/description
  HarfBuzz is an OpenType text shaping engine.
endef

define Package/libharfbuzz/description
  $(call Package/harfbuzz/Default/description)
  .
  (lib)
endef

define Package/harfbuzz/description
  $(call Package/harfbuzz/Default/description)
  .
  (bin)
endef

CONFIGURE_ARGS += \
	--with-coretext=no \
	--with-uniscribe=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/harfbuzz
	$(CP) $(PKG_INSTALL_DIR)/opt/include/harfbuzz/hb*.h \
		$(1)/opt/include/harfbuzz/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz.so* \
		$(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz.pc \
		$(1)/opt/usr/lib/pkgconfig

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/lib,' \
			$(1)/opt/usr/lib/pkgconfig/harfbuzz.pc
endef

define Package/libharfbuzz/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz.so.* $(1)/opt/lib
endef

define Package/harfbuzz/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hb-* $(1)/opt/bin
endef

$(eval $(call BuildPackage,libharfbuzz))
#$(eval $(call BuildPackage,harfbuzz))
