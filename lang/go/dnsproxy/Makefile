# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/net/dnsproxy

include $(TOPDIR)/rules.mk

PKG_NAME:=dnsproxy
PKG_VERSION:=0.48.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/AdguardTeam/dnsproxy

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=74c86a99614cb1943758c6171a6d0cf819d9d415
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=16f593b86a6d3b6a6350658f876457131ed0d8a5d7c95ff69c8ee9c4a63726d1

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

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

GO_BUILD_ARGS += -trimpath
GO_LDFLAGS += -X 'main.VersionString=$(PKG_VERSION)'
GO_VARS += GO111MODULE=on

define Package/dnsproxy/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/dnsproxy $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(GO_SRC_DIR)/config.yaml.dist $(1)/opt/etc/dnsproxy.yaml

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S90dnsproxy $(1)/opt/etc/init.d
endef

Package/dnsproxy_nohf/install=$(Package/dnsproxy/install)

$(eval $(call BuildPackage,dnsproxy))
$(eval $(call BuildPackage,dnsproxy_nohf))
