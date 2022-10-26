# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=fribidi
PKG_VERSION:=1.0.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fribidi/fribidi/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2e9e859876571f03567ac91e5ed3b5308791f31cda083408c2b60fa1fe00a39d

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libfribidi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A Free Implementation of the Unicode Bidirectional Algorithm
  URL:=https://github.com/fribidi/fribidi
endef

define Package/libfribidi/description
  The Free Implementation of the Unicode Bidirectional Algorithm.
endef

MESON_ARGS += \
	-Ddeprecated=false \
	-Ddocs=false \
	-Dbin=false \
	-Dtests=false \
	-Dfuzzer_ldflags=''

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/fribidi
	$(CP) $(PKG_INSTALL_DIR)/opt/include/fribidi/*.h $(1)/opt/include/fribidi

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfribidi.so* $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/fribidi.pc $(1)/opt/lib/pkgconfig
endef

define Package/libfribidi/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfribidi.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libfribidi))
