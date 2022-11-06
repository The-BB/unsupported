# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=filebrowser
PKG_VERSION:=2.22.4
PKG_RELEASE:=1

PKG_GOGET:=github.com/filebrowser/filebrowser

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=ceec4dcfe6e9a0a383429429512286b8fdf31132
PKG_HASH:=skip

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/filebrowser/Default
	$(call Package/gopackage/Default)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Filesystem
	TITLE:=Web File Browser
	URL:=https://filebrowser.org
endef

define Package/filebrowser
	$(call Package/filebrowser/Default)
	VARIANT:=hf
endef

define Package/filebrowser_nohf
	$(call Package/filebrowser/Default)
	VARIANT:=nohf
	DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/filebrowser/description
  filebrowser provides a file managing interface within a specified
  directory and it can be used to upload, delete, preview, rename and
  edit your files. It allows the creation of multiple users and each
  user can have its own directory. It can be used as a standalone app
  or as a middleware.
endef

Package/filebrowser_nohf/description=$(Package/filebrowser/description)

define Package/filebrowser/conffiles
/opt/etc/filebrowser/filebrowser.conf
endef

Package/filebrowser_nohf/conffiles=$(Package/filebrowser/conffiles)

VERSION_HASH:=$(shell echo $(PKG_COMMIT) | cut -b -9)
MODULE:=$(PKG_GOGET)/v2

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		\
		pushd $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/frontend ; \
		npm ci; \
		npm run build; \
		popd; \
		\
		GOGC=off \
		GO111MODULE=on \
		CGO_ENABLED=0 \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/filebrowser \
		-ldflags="-s -w -X $(MODULE)/version.Version=$(PKG_VERSION) \
			-X $(MODULE)/version.CommitSHA=$(VERSION_HASH)"; \
	)
endef

define Package/filebrowser/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/filebrowser $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99filebrowser $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/etc/filebrowser
	$(INSTALL_CONF) files/filebrowser.conf $(1)/opt/etc/filebrowser
endef

Package/filebrowser_nohf/install=$(Package/filebrowser/install)

$(eval $(call BuildPackage,filebrowser))
$(eval $(call BuildPackage,filebrowser_nohf))
