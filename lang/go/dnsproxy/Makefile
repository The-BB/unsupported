# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/net/dnsproxy

include $(TOPDIR)/rules.mk

PKG_NAME:=dnsproxy
PKG_VERSION:=0.50.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=1e3a23f10ad57cf17f8225849a22f8c2ea05b452
PKG_SOURCE_URL:=https://github.com/AdguardTeam/dnsproxy
PKG_MIRROR_HASH:=1a8f15d39121aa952669281ce156f722ddb5a1c2cdffb857ed52952b34e4df2a

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/dnsproxy/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support
  URL:=https://github.com/AdguardTeam/dnsproxy
  DEPENDS:=+ca-bundle
endef

define Package/dnsproxy
  $(call Package/dnsproxy/Default)
  VARIANT:=hf
endef

define Package/dnsproxy_nohf
  $(call Package/dnsproxy/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/dnsproxy/description
  A simple DNS proxy server that supports all existing DNS
  protocols including DNS-over-TLS, DNS-over-HTTPS, DNSCrypt,
  and DNS-over-QUIC. Moreover, it can work as a DNS-over-HTTPS,
  DNS-over-TLS or DNS-over-QUIC server.
endef

Package/dnsproxy_nohf/description=$(Package/dnsproxy/description)

define Package/dnsproxy/conffiles
/opt/etc/dnsproxy.yaml
endef

Package/dnsproxy_nohf/conffiles=$(Package/dnsproxy/conffiles)

GO_LDFLAGS += -X 'main.VersionString=$(PKG_VERSION)'
GO_VARS += GO111MODULE=on

define Package/dnsproxy/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/dnsproxy $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(PKG_BUILD_DIR)/config.yaml.dist $(1)/opt/etc/dnsproxy.yaml
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S90dnsproxy $(1)/opt/etc/init.d
endef

Package/dnsproxy_nohf/install=$(Package/dnsproxy/install)

$(eval $(call BuildPackage,dnsproxy))
$(eval $(call BuildPackage,dnsproxy_nohf))
