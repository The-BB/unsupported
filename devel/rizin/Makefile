# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rizin
PKG_VERSION:=0.6.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rizinorg/rizin/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5f78a5ca71d3029664447f341d48b2ec7767929aa2dc51ac2d3597ab7f3f2a32

PKG_LICENSE:=GPL-3.0-or-later LGPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING COPYING.LESSER

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/rizin
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=UNIX-like reverse engineering framework
  URL:=https://rizin.re/
  DEPENDS:=+liblz4 +libmagic +libopenssl +libzip +zlib
endef

define Package/rizin/description
  Rizin is a fork of the radare2 reverse engineering framework with a focus
  on usability, working features and code cleanliness.
endef

MESON_ARGS += \
	-Denable_tests=false \
	-Denable_rz_test=false \
	-Dinstall_sigdb=true \
	-Dportable=true \
	-Duse_sys_libzip=enabled \
	-Duse_sys_lz4=enabled \
	-Duse_sys_magic=auto \
	-Duse_sys_zlib=enabled

#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/opt/include
#	$(CP) $(PKG_INSTALL_DIR)/opt/include/librz $(1)/opt/include/
#	$(INSTALL_DIR) $(1)/opt/lib
#	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librz_*.so* $(1)/opt/lib/
#	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
#	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig/
#endef

define Package/rizin/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librz_*.so.* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/share/rizin
	$(CP) $(PKG_INSTALL_DIR)/opt/share/rizin/* $(1)/opt/share/rizin
endef

$(eval $(call BuildPackage,rizin))
