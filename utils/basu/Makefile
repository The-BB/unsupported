# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=basu
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/emersion/basu/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e2fda9b69fc6c4530173fcf8db94c29aa5f3ed932d948cc6a31892623cde5e4b

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=LICENSE.LGPL2.1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/basu/Default
  TITLE:=The sd-bus library, extracted from systemd
  URL:=https://sr.ht/~emersion/basu/
endef

define Package/libbasu
  $(call Package/basu/Default)
  SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/basu
  $(call Package/basu/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (busctl utility)
endef

MESON_ARGS += \
	-Dnobody-user=nobody \
	-Dsystem-bus-address=unix:path=/opt/var/run/dbus/system_bus_socket \
	-Daudit=false

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
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libbasu.so.* $(1)/opt/lib
endef

define Package/basu/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/basuctl $(1)/opt/bin
endef

$(eval $(call BuildPackage,libbasu))
$(eval $(call BuildPackage,basu))
