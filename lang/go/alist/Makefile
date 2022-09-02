# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=2.6.4
PKG_RELEASE:=2

PKG_GOGET:=github.com/alist-org/alist

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=bd52df19266754ffa22078ed315345ecd4c4508e
PKG_HASH:=skip

PKG_MAINTAINER:=Entware team, https://entware.net
PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node/host node-yarn/host
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

define Download/web-v2
  VERSION:=b095d5d28aa94ffb5ce87008dc67e3db95fbff72
  SUBDIR:=web-v2
  FILE:=web-v2-$$(VERSION).tar.xz
  URL:=https://github.com/alist-org/web-v2.git
  MIRROR_HASH:=skip
  PROTO:=git
endef

define Prepare/web-v2
	$(eval $(Download/web-v2))
	xzcat $(DL_DIR)/$(FILE) | \
		tar -C $(PKG_BUILD_DIR)/src/$(PKG_GOGET) $(TAR_OPTIONS)
endef

BUILD_DATE:=$(shell date +'%F %T %z')
GIT_COMMIT:=$(shell echo $(PKG_COMMIT) | cut -b -9)
GIT_TAG:=v$(PKG_VERSION)-$(GIT_COMMIT)
GO_VER:=$(shell $(GOROOT)/bin/go version | sed 's/go version //;s,/.*,/$(GOARCH),')
WEB_COMMIT:=b095d5d28

define Build/Compile
	$(eval $(call Download,web-v2))
	$(Prepare/web-v2)

	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		\
		pushd $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/web-v2; \
		yarn install; \
		yarn build; \
		$(SED) 's,/CDN_URL/,/,g;s,assets,/assets,g' dist/index.html; \
		mv dist/* ../public/ ; \
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
		-X 'github.com/Xhofe/alist/conf.BuiltAt=$(BUILD_DATE)' \
		-X 'github.com/Xhofe/alist/conf.GoVersion=$(GO_VER)' \
		-X 'github.com/Xhofe/alist/conf.GitAuthor=Entware' \
		-X 'github.com/Xhofe/alist/conf.GitCommit=$(GIT_COMMIT)' \
		-X 'github.com/Xhofe/alist/conf.GitTag=$(GIT_TAG)' \
		-X 'github.com/Xhofe/alist/conf.WebTag=$(WEB_COMMIT)'" \
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
