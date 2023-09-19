# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=v2ray-plugin
PKG_VERSION:=5.7.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ae6ce313002c3f55a074dd3e0b6581afb3f8d715
PKG_SOURCE_URL:=https://github.com/teddysun/v2ray-plugin
PKG_MIRROR_HASH:=36af5b5c2839955155cdcb5a77c213670230fa5351a885f7aca9b7e40794dfe9

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/v2ray-plugin/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A SIP003 plugin based on v2ray
  URL:=https://github.com/teddysun/v2ray-plugin
endef

define Package/v2ray-plugin
  $(call Package/v2ray-plugin/Default)
  VARIANT:=hf
endef

define Package/v2ray-plugin_nohf
  $(call Package/v2ray-plugin/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/v2ray-plugin/description
  Yet another SIP003 plugin for shadowsocks, based on v2ray.
endef

Package/v2ray-plugin_nohf/description=$(Package/v2ray-plugin/description)

GO_LDFLAGS += -X 'main.VERSION=v$(PKG_VERSION)'

define Package/v2ray-plugin/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/v2ray-plugin $(1)/opt/bin
endef

Package/v2ray-plugin_nohf/install=$(Package/v2ray-plugin/install)

$(eval $(call BuildPackage,v2ray-plugin))
$(eval $(call BuildPackage,v2ray-plugin_nohf))
