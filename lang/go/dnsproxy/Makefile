# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/net/dnsproxy

include $(TOPDIR)/rules.mk

PKG_NAME:=dnsproxy
PKG_VERSION:=0.70.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-18
PKG_SOURCE_VERSION:=7d832999a812b3f237e1b0abd35c87ef559d35a4
PKG_SOURCE_URL:=https://github.com/AdguardTeam/dnsproxy
PKG_MIRROR_HASH:=08a9ec73f8b829d32eab82fa12a7159fc292e2d658b9642832a647ecbe0a1148

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
  DEPENDS+=@arm
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

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/internal/version.branch=master' \
	-X '$(XIMPORTPATH)/internal/version.committime=$(PKG_SOURCE_DATE)' \
	-X '$(XIMPORTPATH)/internal/version.revision=$(COMMIT_SHORT)' \
	-X '$(XIMPORTPATH)/internal/version.version=$(PKG_VERSION)'

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
