# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=basu
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://git.sr.ht/~emersion/basu/refs/download/v$(PKG_VERSION)
PKG_HASH:=d9b373a9fcb5d5eb5f6c1c56355f76edb7f2f52bc744570e80604e83455a19bd

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=LICENSE.LGPL2.1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libbasu
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=basu library
  URL:=https://sr.ht/~emersion/basu
endef

define Package/basu
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=busctl utility
  URL:=https://sr.ht/~emersion/basu
  DEPENDS:=+libbasu
endef

define Package/libbasu/description
  The sd-bus library, extracted from systemd.
endef

Package/basu/description=$(Package/libbasu/description)

MESON_ARGS += \
	-Dnobody-user=nobody \
	-Dsystem-bus-address=unix:path=/opt/var/run/dbus/system_bus_socket \
	-Daudit=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/basu $(1)/opt/include
	$(LN) basu $(1)/opt/include/systemd
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libbasu.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/basu.pc $(1)/opt/lib/pkgconfig
endef

define Package/libbasu/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libbasu.so* $(1)/opt/lib
endef

define Package/basu/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/basuctl $(1)/opt/bin
endef

$(eval $(call BuildPackage,libbasu))
$(eval $(call BuildPackage,basu))
