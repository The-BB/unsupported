# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=caddy
PKG_VERSION:=2.7.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=0e204b730aa2b1fa0835336b1117eff8c420f713
PKG_SOURCE_URL:=https://github.com/caddyserver/caddy
PKG_MIRROR_HASH:=01181b00dfba6b837f1609802284c45e99b12a79b1d8a472f4d9698c4608c0f4

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/caddy/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=multi-platform HTTP/1-2-3 web server
  URL:=https://caddyserver.com
endef

define Package/caddy
  $(call Package/caddy/Default)
  VARIANT:=hf
endef

define Package/caddy_nohf
  $(call Package/caddy/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/caddy/description
  Caddy is an extensible server platform that uses TLS by default.
endef

Package/caddy_nohf/description=$(Package/caddy/description)

GO_TARGET:=./cmd/caddy

define Package/caddy/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/caddy $(1)/opt/sbin/caddy
endef

Package/caddy_nohf/install=$(Package/caddy/install)

$(eval $(call BuildPackage,caddy))
$(eval $(call BuildPackage,caddy_nohf))
