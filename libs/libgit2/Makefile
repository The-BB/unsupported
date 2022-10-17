# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libgit2
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/libgit2/libgit2/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e

PKG_LICENSE:=GNU-2.0-or-later
PKG_LICENSE_FILES:=COPYING

CMAKE_INSTALL:=1

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

define Package/libgit2/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libgit2.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libgit2))
