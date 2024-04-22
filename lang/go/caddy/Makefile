# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=caddy
PKG_VERSION:=2.7.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6d9a83376b5e19b3c0368541ee46044ab284038b
PKG_SOURCE_URL:=https://github.com/caddyserver/caddy
PKG_MIRROR_HASH:=0ad51d16c7c4c61fd2a36088a52d66baf785f89778a6b6683cc589fac44bad35

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
  DEPENDS:=@arm
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
