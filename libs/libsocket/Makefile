# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libsocket
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dermesser/libsocket/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0afe2ece985caa0b44546d10426b15a506164d5b96d7242890c7d0337f479689

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libsocket/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ultimate socket library
  URL:=https://github.com/dermesser/libsocket
endef

define Package/libsocket
  $(call Package/libsocket/Default)
endef

define Package/libsocketpp
  $(call Package/libsocket/Default)
  TITLE+=(++)
  DEPENDS:=+libstdcpp
endef

define Package/libsocket/Default/description
  The ultimate socket library for C and C++, supporting TCP, UDP and Unix
  sockets (DGRAM and STREAM) on Linux, FreeBSD, Solaris.
endef

define Package/libsocket/description
  $(call Package/libsocket/Default/description)
  .
  (C only)
endef

define Package/libsocketpp/description
  $(call Package/libsocket/Default/description)
  .
  (C++ only)
endef

define Package/libsocket/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsocket.so $(1)/opt/lib
endef

define Package/libsocketpp/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsocket++.so $(1)/opt/lib
endef

$(eval $(call BuildPackage,libsocket))
$(eval $(call BuildPackage,libsocketpp))
