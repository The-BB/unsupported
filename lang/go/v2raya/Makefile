# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/v2raya

include $(TOPDIR)/rules.mk

PKG_NAME:=v2rayA
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_GOGET:=github.com/v2rayA/v2rayA

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=38afbd4f03a7b1816b7da30e7c5f5f9eb167f222
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=ea0fc3b56a2c59dbd2d08c85ce174d78574d470d9ef0ecf92b0f8de2d424a5ec

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/v2raya/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A Linux web GUI client of Project V
  URL:=https://v2raya.org
  DEPENDS:=+ca-bundle +iptables +v2ray
endef

define Package/v2raya
  $(call Package/v2raya/Default)
  VARIANT:=hf
endef

define Package/v2raya_nohf
  $(call Package/v2raya/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/v2raya/description
  v2rayA is a V2Ray Linux client supporting global transparent proxy,
  compatible with SS, SSR, Trojan(trojan-go), PingTunnel protocols.
endef

Package/v2raya_nohf/description=$(Package/v2raya/description)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/conf.Version=v$(PKG_VERSION)'

GO_SRC_SUBDIR:=service

define Build/Web
	( cd $(GO_SRC_DIR)/gui; \
		yarn install; \
		OUTPUT_DIR=../service/server/router/web yarn build; \
		for file in $$$$(find ../service/server/router/web | grep -v png | grep -v index.html | grep -v .gz); do \
			if [ ! -d $$$$file ];then gzip -9 $$$$file; fi; \
		done; \
	)
endef

Hooks/Compile/Pre += Build/Web

define Package/v2raya/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/v2rayA $(1)/opt/bin/v2raya
endef

Package/v2raya_nohf/install=$(Package/v2raya/install)

$(eval $(call BuildPackage,v2raya))
$(eval $(call BuildPackage,v2raya_nohf))
