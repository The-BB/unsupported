# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=kronosnet
PKG_VERSION:=1.28
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://kronosnet.org/releases
PKG_HASH:=ebc3a7529dd10dcfbf168856a45d0c98c69247fed89bd01b504b2f469f483458

PKG_LICENSE:=GPL-2.0-or-later LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.applications COPYING.libraries COPYRIGHT

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

#PKG_BUILD_DEPENDS:=liblz4 libnl lzo 

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libknet
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=kronosnet library
  URL:=https://kronosnet.org
endef

define Package/libnozzle
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=library to manage a pool of tap devices
  URL:=https://kronosnet.org
  DEPENDS:=+libnl-route
endef

CONFIGURE_ARGS += \
	--disable-compress-all \
	--disable-crypto-all \
	--disable-functional-tests \
	--disable-libknet-sctp \
	--disable-man

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.{a,so*} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig
endef

define Package/libknet/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libknet.so* $(1)/opt/lib
endef

define Package/libnozzle/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libnozzle.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libknet))
$(eval $(call BuildPackage,libnozzle))
