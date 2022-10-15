# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=3.2.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/alist-org/alist

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=549355bb296726c5b6c196ea444bcc2c40054a24
PKG_HASH:=skip

PKG_MAINTAINER:=Entware team, https://entware.net
PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node-pnpm/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/alist/Default
  $(call Package/gopackage/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  TITLE:=A file list program that supports multiple storage
  URL:=https://alist-doc.nn.ci/
endef

define Package/alist
  $(call Package/alist/Default)
  VARIANT:=hf
endef

define Package/alist_nohf
  $(call Package/alist/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/alist/description
  A file list program that supports multiple storage.
endef

Package/alist_nohf/description=$(Package/alist/description)

define Download/alist-web
  VERSION:=bd16d935e4ebbf1ceddd38b43b25ed6980dbf5b4
  SUBDIR:=alist-web
  FILE:=alist-web-$$(VERSION).tar.xz
  URL:=https://github.com/alist-org/alist-web.git
  MIRROR_HASH:=skip
  PROTO:=git
endef

define Prepare/alist-web
	$(eval $(Download/alist-web))
	xzcat $(DL_DIR)/$(FILE) | \
		tar -C $(PKG_BUILD_DIR)/src/$(PKG_GOGET) $(TAR_OPTIONS)
endef

BUILD_DATE:=$(shell date +'%F %T %z')
GIT_COMMIT:=$(shell echo $(PKG_COMMIT) | cut -b -9)
GIT_TAG:=v$(PKG_VERSION)-$(GIT_COMMIT)
GO_VER:=$(shell $(GOROOT)/bin/go version | sed 's/go version //;s,/.*,/$(GOARCH),')
MODULE:=$(PKG_GOGET)/v3/internal
WEB_COMMIT:=bd16d935e

define Build/Compile
	$(eval $(call Download,alist-web))
	$(Prepare/alist-web)

	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		\
		pushd $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/alist-web; \
		pnpm install; \
		pnpm i18n; \
		pnpm build; \
		rm -rf ../public/dist; \
		mv dist ../public/; \
		popd; \
		\
		CC=$(TARGET_CROSS)gcc \
		CGO_ENABLED=1 \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/alist \
		-ldflags="-s -w -I /opt/lib/$(DYNLINKER) \
			-X $(MODULE)/conf.BuiltAt=$(BUILD_DATE) \
			-X $(MODULE)/conf.GoVersion=$(GO_VER) \
			-X $(MODULE)/conf.GitAuthor=Entware \
			-X $(MODULE)/conf.GitCommit=$(GIT_COMMIT) \
			-X $(MODULE)/conf.Version=$(PKG_VERSION) \
			-X $(MODULE)/conf.WebVersion=$(WEB_COMMIT)" \
		-tags=jsoniter; \
	)
endef

define Package/alist/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/alist $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99alist $(1)/opt/etc/init.d
endef

Package/alist_nohf/install=$(Package/alist/install)

$(eval $(call BuildPackage,alist))
$(eval $(call BuildPackage,alist_nohf))
