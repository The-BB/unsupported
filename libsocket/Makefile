#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsocket
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/dermesser/libsocket/archive/v$(PKG_VERSION)
PKG_HASH:=0afe2ece985caa0b44546d10426b15a506164d5b96d7242890c7d0337f479689

PKG_LICENSE:=BSD-2-Clause

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libsocket
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ultimate socket library
  URL:=https://github.com/dermesser/libsocket
  DEPENDS:=+libstdcpp
endef

define Package/libsocket/description
  The ultimate socket library for C and C++, supporting TCP, UDP and Unix
  sockets (DGRAM and STREAM) on Linux, FreeBSD, Solaris.
endef

define Package/libsocket/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsocket{,++}.so $(1)/opt/lib
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/libsocket
	$(CP) $(PKG_INSTALL_DIR)/opt/include/libsocket/*.h $(1)/opt/include/libsocket

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsocket{,++}.so $(1)/opt/lib
endef

$(eval $(call BuildPackage,libsocket))
