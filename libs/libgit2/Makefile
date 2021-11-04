# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libgit2
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/libgit2/libgit2/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e

PKG_LICENSE:=GNU-2.0-or-later
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
