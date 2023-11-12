# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/trojan-go

include $(TOPDIR)/rules.mk

PKG_NAME:=trojan-go
PKG_VERSION:=0.10.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=2dc60f52e79ff8b910e78e444f1e80678e936450
PKG_SOURCE_URL:=https://github.com/p4gefau1t/trojan-go
PKG_MIRROR_HASH:=60d63a5235c087faae30827aa607e0b1d2b6cab58237ecb936a7d7392b059a1a

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/trojan-go/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A Trojan proxy written in Go
  URL:=https://p4gefau1t.github.io/trojan-go
  DEPENDS:=+ca-bundle
endef

define Package/trojan-go
  $(call Package/trojan-go/Default)
  VARIANT:=hf
endef

define Package/trojan-go_nohf
  $(call Package/trojan-go/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/trojan-go/description
  Trojan features multiple protocols over TLS to avoid both active/passive
  detections and ISP QoS limitations.
endef

Package/trojan-go_nohf/description=$(Package/trojan-go/description)

define Package/trojan-go/conffiles
/opt/etc/trojan-go/client.json
/opt/etc/trojan-go/server.json
endef

Package/trojan-go_nohf/conffiles=$(Package/trojan-go/conffiles)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/constant.Version=v$(PKG_VERSION)' \
	-X '$(XIMPORTPATH)/constant.Commit=$(COMMIT_SHORT)'

GO_TAGS:= -tags=full

define GeoDB
	( cd $(PKG_BUILD_DIR); $(MAKE) geoip.dat geosite.dat )
endef

Hooks/Compile/Pre += GeoDB

define Package/trojan-go/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S24trojan-go $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/etc/trojan-go
	$(CP) $(PKG_BUILD_DIR)/example/*.json $(1)/opt/etc/trojan-go
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/trojan-go $(1)/opt/sbin/trojan-go
	$(INSTALL_DIR) $(1)/opt/share/trojan-go
	$(CP) $(PKG_BUILD_DIR)/geo*.dat $(1)/opt/share/trojan-go
endef

Package/trojan-go_nohf/install=$(Package/trojan-go/install)

$(eval $(call BuildPackage,trojan-go))
$(eval $(call BuildPackage,trojan-go_nohf))
