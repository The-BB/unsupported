# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=go-shadowsocks2
PKG_VERSION:=0.1.5
PKG_RELEASE:=1

PKG_GOGET:=github.com/shadowsocks/go-shadowsocks2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=71a35d3383128957db1327991445fca643feb4e2
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=4ea81f539173c4a8d3b88ac474fc28db89d22cc3e4f1675d7d801395199cef70

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/go-shadowsocks2/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Modern Shadowsocks in Go
  URL:=https://github.com/cloudflare/go-shadowsocks2
endef

define Package/go-shadowsocks2
  $(call Package/go-shadowsocks2/Default)
  VARIANT:=hf
endef

define Package/go-shadowsocks2_nohf
  $(call Package/go-shadowsocks2/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/go-shadowsocks2/description
  A fresh implementation of Shadowsocks in Go.
endef

Package/go-shadowsocks2_nohf/description=$(Package/go-shadowsocks2/description)

define Package/go-shadowsocks2/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/go-shadowsocks2 $(1)/opt/bin
endef

Package/go-shadowsocks2_nohf/install=$(Package/go-shadowsocks2/install)

$(eval $(call BuildPackage,go-shadowsocks2))
$(eval $(call BuildPackage,go-shadowsocks2_nohf))
