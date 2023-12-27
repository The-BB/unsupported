# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=xray-plugin
PKG_VERSION:=1.8.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=62ee52b91b852aba4ff2ac8722cdb1ea5a84c66a
PKG_SOURCE_URL:=https://github.com/teddysun/xray-plugin
PKG_MIRROR_HASH:=72cd470b0474b2ea78772ca1ab595708fdee8b10bdaf6834d5c6b815c9cd9147

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/xray-plugin/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A SIP003 plugin based on Xray-core
  URL:=https://github.com/teddysun/xray-plugin
endef

define Package/xray-plugin
  $(call Package/xray-plugin/Default)
  VARIANT:=hf
endef

define Package/xray-plugin_nohf
  $(call Package/xray-plugin/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/xray-plugin/description
  Yet another SIP003 plugin for shadowsocks, based on Xray-core.
endef

Package/xray-plugin_nohf/description=$(Package/xray-plugin/description)

GO_LDFLAGS += -X 'main.VERSION=v$(PKG_VERSION)'

define Package/xray-plugin/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/xray-plugin $(1)/opt/bin
endef

Package/xray-plugin_nohf/install=$(Package/xray-plugin/install)

$(eval $(call BuildPackage,xray-plugin))
$(eval $(call BuildPackage,xray-plugin_nohf))
