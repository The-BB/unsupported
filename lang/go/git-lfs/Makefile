#
# Copyright (C) 2022 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=git-lfs
PKG_VERSION:=3.2.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/git-lfs/git-lfs

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=45f849b999f70f5804b441f6eb5b8d5eead8bdfd
PKG_HASH:=skip

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/git-lfs/Default
  $(call Package/gopackage/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=Git Large File Storage
  URL:=https://git-lfs.github.com
  DEPENDS:=+git
endef

define Package/git-lfs
  $(call Package/git-lfs/Default)
  VARIANT:=hf
endef

define Package/git-lfs_nohf
  $(call Package/git-lfs/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/git-lfs/description
  Git Large File Storage (LFS) replaces large files such as audio samples,
  videos, datasets, and graphics with text pointers inside Git, while storing
  the file contents on a remote server like GitHub.com or GitHub Enterprise.
endef

Package/git-lfs_nohf/description=$(Package/git-lfs/description)

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -o $(PKG_BUILD_DIR)/bin/git-lfs \
		-ldflags="-s -w"; \
	)
endef


define Package/git-lfs/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/git-lfs $(1)/opt/bin
endef

Package/git-lfs_nohf/install=$(Package/git-lfs/install)

$(eval $(call BuildPackage,git-lfs))
$(eval $(call BuildPackage,git-lfs_nohf))
