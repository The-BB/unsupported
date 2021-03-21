# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=libgit2
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/libgit2/libgit2/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=41a6d5d740fd608674c7db8685685f45535323e73e784062cf000a633d420d1e

PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libgit2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=the Git linkable library
  URL:=https://libgit2.org
  DEPENDS:=+libopenssl +libpcre
endef

define Package/libgit2/description
  A cross-platform, linkable library implementation of Git that you can use in
  your application. 
endef

define Build/InstallDev
	$(call Build/InstallDev/cmake,$(1))
	$(SED) 's,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/lib,; \
		s,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/include,' \
			$(1)/opt/lib/pkgconfig/libgit2.pc
endef

define Package/libgit2/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libgit2.so.* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libgit2))
