# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=fribidi
PKG_VERSION:=1.0.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fribidi/fribidi/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f24e8e381bcf76533ae56bd776196f3a0369ec28e9c0fdb6edd163277e008314

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libfribidi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Unicode Bidirectional Algorithm Library
  URL:=https://github.com/fribidi/fribidi
endef

define Package/libfribidi/description
  The Free Implementation of the Unicode Bidirectional Algorithm.
endef

MESON_ARGS += \
	-Db_lto=true \
	-Dbin=false \
	-Ddeprecated=false \
	-Ddocs=false \
	-Dfuzzer_ldflags='' \
	-Dtests=false

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/fribidi $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfribidi.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig
endef

define Package/libfribidi/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfribidi.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libfribidi))
