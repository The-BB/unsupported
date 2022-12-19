# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/net/git-lfs

include $(TOPDIR)/rules.mk

PKG_NAME:=git-lfs
PKG_VERSION:=3.3.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/git-lfs/git-lfs

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=77deabdf9a18f8a07ecfd3e0f4aa572ffbbab8d4
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=3a59794fb2aa13af29abdbf7c365bbd145b9fea96307befd8e2595d3f207689a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/git-lfs/Default
  SECTION:=net
  CATEGORY:=Network
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

define Build/FixHelp
	( cd $(GO_SRC_DIR); $(GO_BIN) generate ./commands )
endef

Hooks/Compile/Pre += Build/FixHelp

GIT_LFS_SHA:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/v3/config.Vendor=Entware' \
	-X '$(PKG_GOGET)/v3/config.GitCommit=$(GIT_LFS_SHA)'

GO_BUILD_ARGS += -trimpath

define Package/git-lfs/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/git-lfs $(1)/opt/bin
endef

Package/git-lfs_nohf/install=$(Package/git-lfs/install)

$(eval $(call BuildPackage,git-lfs))
$(eval $(call BuildPackage,git-lfs_nohf))
