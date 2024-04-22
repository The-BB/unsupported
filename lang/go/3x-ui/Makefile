# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=3x-ui
PKG_VERSION:=2.3.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=2cf2c451c24a98d699d234ca073e1af9a0339833
PKG_SOURCE_URL:=https://github.com/MHSanaei/3x-ui
PKG_MIRROR_HASH:=6455934c206565e700ab0605f5383878da5791b8b3318c7e80f3b9fa66d775cc

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/3x-ui/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Xray panel
  URL:=https://github.com/MHSanaei/3x-ui
  DEPENDS:=+ca-bundle
endef

define Package/3x-ui
  $(call Package/3x-ui/Default)
  VARIANT:=hf
endef

define Package/3x-ui_nohf
  $(call Package/3x-ui/Default)
  VARIANT:=nohf
  DEPENDS+=@arm
endef

define Package/3x-ui/description
  Xray panel supporting multi-protocol multi-user expire day &
  traffic & ip limit (Vmess & Vless & Trojan & ShadowSocks).
endef

Package/3x-ui_nohf/description=$(Package/3x-ui/description)

define Package/3x-ui/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S24x-ui $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/x-ui $(1)/opt/sbin
	$(INSTALL_DIR) $(1)/opt/var/log/xui
endef

Package/3x-ui_nohf/install=$(Package/3x-ui/install)

define Package/3x-ui/postinst
#!/bin/sh

ansi_red="\033[1;31m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

if ! xray version > /dev/null 2>&1; then
  printf "\n$$ansi_red %s $$ansi_white %s $$ansi_std\n" "ERROR:" "xray not found!"
  printf "$$ansi_white %s $$ansi_std %s\n\n" "Please install it manually:" "opkg install xray-core"
fi
endef

Package/3x-ui_nohf/postinst=$(Package/3x-ui/postinst)

$(eval $(call BuildPackage,3x-ui))
$(eval $(call BuildPackage,3x-ui_nohf))
