# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=odoh-client-go
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_GOGET:=github.com/cloudflare/odoh-client-go

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=8d45d054d3e85da96d5764c0634475deb5e88c4c
PKG_HASH:=skip

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/odoh-client-go/Default
	$(call Package/gopackage/Default)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=
	TITLE:=Oblivious DoH client 
	URL:=https://github.com/cloudflare/odoh-client-go
endef

define Package/odoh-client-go
	$(call Package/odoh-client-go/Default)
	VARIANT:=hf
endef

define Package/odoh-client-go_nohf
	$(call Package/odoh-client-go/Default)
	VARIANT:=nohf
	DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/odoh-client-go/description
  odoh-client is a command line interface as a client for making
  Oblivious DNS-over-HTTPS queries.
endef

Package/odoh-client-go_nohf/description=$(Package/odoh-client-go/description)

COMMIT_ID:=$(shell echo $(PKG_COMMIT) | cut -b -9)

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		CGO_ENABLED=0 \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/odoh-client \
		-ldflags="-s -w -X main.Version=$(PKG_VERSION) \
			-X main.CommitId=$(COMMIT_ID)" ./cmd/*; \
	)
endef

define Package/odoh-client-go/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/odoh-client $(1)/opt/bin
endef

Package/odoh-client-go_nohf/install=$(Package/odoh-client-go/install)

$(eval $(call BuildPackage,odoh-client-go))
$(eval $(call BuildPackage,odoh-client-go_nohf))