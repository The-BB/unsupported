# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/v2raya

include $(TOPDIR)/rules.mk

PKG_NAME:=v2rayA
PKG_VERSION:=2.2.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=c3ba6a8e4825001fdc483cf599ebb9ab109b0dd4
PKG_SOURCE_URL:=https://github.com/v2rayA/v2rayA
PKG_MIRROR_HASH:=0053f470be7ba67e34cd7f1f964f7e6e7fdcedbc89f0311a4fe16cb2f360f02c

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/v2raya/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A Linux web GUI client of Project V
  URL:=https://v2raya.org
  DEPENDS:=+ca-bundle +iptables
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
  A web GUI client of Project V which supports VMess,
  VLESS, SS, SSR, Trojan, Tuic and Juicity protocols.
endef

Package/v2raya_nohf/description=$(Package/v2raya/description)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/conf.Version=v$(PKG_VERSION)'

GO_SRC_SUBDIR:=service

define Build/Web
	( cd $(PKG_BUILD_DIR)/gui; \
		yarn install; \
		OUTPUT_DIR=../service/server/router/web yarn build; \
		$(FIND) ../service/server/router/web \
			\! -name \*.png -a \
			\! -name \*.gz -a \
			\! -name index.html -a \
			! -type d -exec gzip -9 {} +; \
	)
endef

Hooks/Compile/Pre += Build/Web

define Package/v2raya/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/v2rayA $(1)/opt/bin/v2raya
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S24v2raya $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/etc/v2raya
	$(INSTALL_DIR) $(1)/opt/share/v2ray
endef

Package/v2raya_nohf/install=$(Package/v2raya/install)

$(eval $(call BuildPackage,v2raya))
$(eval $(call BuildPackage,v2raya_nohf))
