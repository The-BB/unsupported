# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hugo
PKG_VERSION:=0.101.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/gohugoio/hugo

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=466fa43c16709b4483689930a4f9ac8add5c9f66
PKG_HASH:=skip

PKG_MAINTAINER:=Entware team, https://entware.net
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/hugo/Default
  $(call Package/gopackage/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=framework for building websites
  URL:=https://gohugo.io/
  DEPENDS:=+libstdcpp
endef

define Package/hugo
  $(call Package/hugo/Default)
  VARIANT:=hf
endef

define Package/hugo_nohf
  $(call Package/hugo/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/hugo/description
  A Fast and Flexible Static Site Generator built with love by bep, spf13
  and friends in Go.
endef

Package/hugo_nohf/description=$(Package/hugo/description)

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		CC=$(TARGET_CROSS)gcc \
		CXX=$(TARGET_CROSS)g++ \
		CGO_ENABLED=1 \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/hugo \
		-ldflags="-s -w -I /opt/lib/$(DYNLINKER)" -tags=extended; \
	)
endef


define Package/hugo/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hugo $(1)/opt/bin
endef

Package/hugo_nohf/install=$(Package/hugo/install)

$(eval $(call BuildPackage,hugo))
$(eval $(call BuildPackage,hugo_nohf))
