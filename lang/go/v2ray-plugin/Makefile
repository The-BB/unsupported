# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=v2ray-plugin
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_GOGET:=github.com/shadowsocks/v2ray-plugin

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ddd7ab46b4aeee0ca8b272efed9d7da3e3a6e52c
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=e90f118dc2603f34dbf01e120b912b3c479ce464106a2b8a22da75bf60ae6f0a

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
  URL:=https://github.com/shadowsocks/v2ray-plugin
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

GO_BUILD_ARGS += -trimpath -a
GO_LDFLAGS += -X 'main.VERSION=v$(PKG_VERSION)'

define Package/v2ray-plugin/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/v2ray-plugin $(1)/opt/bin
endef

Package/v2ray-plugin_nohf/install=$(Package/v2ray-plugin/install)

$(eval $(call BuildPackage,v2ray-plugin))
$(eval $(call BuildPackage,v2ray-plugin_nohf))
