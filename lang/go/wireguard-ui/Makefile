# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard-ui
PKG_VERSION:=0.5.2
PKG_RELEASE:=2
SOURCE_DATE:=2023-06-23

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6bbe230fe8a25844cebe9997a5acf4645033f9b5
PKG_SOURCE_URL:=https://github.com/ngoduykhanh/wireguard-ui
PKG_MIRROR_HASH:=ab0f562b0b2c5b590f701ce997149cc2ba679e7cb5160d0c97880616e6026a31

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node-yarn/host

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/wireguard-ui/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Wireguard web interface
  URL:=https://github.com/ngoduykhanh/wireguard-ui
  DEPENDS:=+ca-bundle +jq +wireguard-tools @!LINUX_2_6_36
endef

define Package/wireguard-ui
  $(call Package/wireguard-ui/Default)
  VARIANT:=hf
endef

define Package/wireguard-ui_nohf
  $(call Package/wireguard-ui/Default)
  VARIANT:=nohf
  DEPENDS:=@TARGET_armv7_3_2
endef

define Package/wireguard-ui/description
  A web user interface to manage your WireGuard setup.
endef

Package/wireguard-ui_nohf/description=$(Package/wireguard-ui/description)

GO_BUILD_ARGS += -a

GO_LDFLAGS += \
	-X 'main.appVersion=v$(PKG_VERSION)' \
	-X 'main.buildTime=$(SOURCE_DATE)' \
	-X 'main.gitCommit=$(COMMIT_SHORT)' \
	-X 'main.gitRef=master'

define Build/Web
	( cd $(PKG_BUILD_DIR); $(SHELL) ./prepare_assets.sh; )
endef

Hooks/Compile/Pre += Build/Web

define Package/wireguard-ui/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S80wireguard-ui $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/wireguard-ui $(1)/opt/sbin/wireguard-ui
endef

Package/wireguard-ui_nohf/install=$(Package/wireguard-ui/install)

$(eval $(call BuildPackage,wireguard-ui))
$(eval $(call BuildPackage,wireguard-ui_nohf))
