# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cloudreve
PKG_VERSION:=3.5.3
PKG_RELEASE:=2

PKG_GOGET:=github.com/cloudreve/Cloudreve

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=96daed26b4453093d9d1a4dfe8d9ee334a7338af
PKG_HASH:=skip

PKG_MAINTAINER:=Entware team, https://entware.net
PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node/host node-yarn/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/cloudreve/Default
  $(call Package/gopackage/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=A project helps you build your own cloud in minutes
  URL:=https://cloudreve.org
  DEPENDS:=+ca-bundle
endef

define Package/cloudreve
  $(call Package/cloudreve/Default)
  VARIANT:=hf
endef

define Package/cloudreve_nohf
  $(call Package/cloudreve/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/cloudreve/description
  Self-deployed file management and sharing system, supports multiple
  storage providers.
endef

Package/cloudreve_nohf/description=$(Package/cloudreve/description)

define Download/frontend
  VERSION:=e428b86964988cadf329014349a1e3bf5f44b12a
  SUBDIR:=assets
  FILE:=frontend-$$(VERSION).tar.xz
  URL:=https://github.com/cloudreve/frontend.git
  MIRROR_HASH:=skip
  PROTO:=git
endef

define Prepare/frontend
	$(eval $(Download/frontend))
	xzcat $(DL_DIR)/$(FILE) | \
		tar -C $(PKG_BUILD_DIR)/src/$(PKG_GOGET) $(TAR_OPTIONS)
endef

define Build/Compile
	$(eval $(call Download,frontend))
	$(Prepare/frontend)

	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		\
		pushd $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/assets; \
		yarn install; \
		yarn run build; \
		find ./build -name "*.map" -type f -delete; \
		popd; \
		\
		zip -r - assets/build >assets.zip; \
		\
		CC=$(TARGET_CROSS)gcc \
		CGO_ENABLED=1 \
		GO111MODULE=on \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/cloudreve \
		-ldflags="-s -w -I /opt/lib/$(DYNLINKER) \
			-X $(PKG_GOGET)/v3/pkg/conf.BackendVersion=$(PKG_VERSION) \
			-X $(PKG_GOGET)/v3/pkg/conf.LastCommit=$(PKG_COMMIT)"; \
	)
endef


define Package/cloudreve/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/cloudreve $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99cloudreve $(1)/opt/etc/init.d
endef

Package/cloudreve_nohf/install=$(Package/cloudreve/install)

$(eval $(call BuildPackage,cloudreve))
$(eval $(call BuildPackage,cloudreve_nohf))
