# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dnsproxy
PKG_VERSION:=0.46.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/AdguardTeam/dnsproxy

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=95ef855f83c328636e7e529b130cfe50affd9d16
PKG_HASH:=skip

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/dnsproxy/Default
	$(call Package/gopackage/Default)
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

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		CGO_ENABLED=0 \
		GO111MODULE='on' \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -o $(PKG_BUILD_DIR)/bin/dnsproxy \
		-ldflags="-s -w -X main.VersionString=$(PKG_VERSION)"; \
	)
endef

define Package/dnsproxy/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/dnsproxy $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/config.yaml.dist \
		$(1)/opt/etc/dnsproxy.yaml

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S90dnsproxy $(1)/opt/etc/init.d
endef

Package/dnsproxy_nohf/install=$(Package/dnsproxy/install)

$(eval $(call BuildPackage,dnsproxy))
$(eval $(call BuildPackage,dnsproxy_nohf))
