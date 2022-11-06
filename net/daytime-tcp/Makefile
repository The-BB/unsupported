# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=daytime-tcp
PKG_VERSION:=0.0.0
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2018-04-13
PKG_SOURCE_VERSION:=918f5dacd775a81e2cbbe9404f917f86267085b4

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/iJinjin/daytime-tcp
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/daytime-tcp/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Time Synchronization
  TITLE:=Simple daytime TCP client/server
  URL:=https://github.com/iJinjin/daytime-tcp
endef

define Package/daytimecli
  $(call Package/daytime-tcp/Default)
  TITLE+= (client)
endef

define Package/daytimeserv
  $(call Package/daytime-tcp/Default)
  TITLE+= (server)
endef

define Package/daytimecli/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daytimecli $(1)/opt/bin
endef

define Package/daytimeserv/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daytimeserv $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S02daytimeserv $(1)/opt/etc/init.d
endef

$(eval $(call BuildPackage,daytimecli))
$(eval $(call BuildPackage,daytimeserv))
