# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=gocryptfs
PKG_VERSION:=2.4.0
PKG_RELEASE:=1
SOURCE_DATE:=2023-06-10

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=8979cca43ea2ed15cf6ff577619298b9473d2882
PKG_SOURCE_URL:=https://github.com/rfjakob/gocryptfs
PKG_MIRROR_HASH:=d5e71c55c21dfdd6346eae815920994f90ff0f12a95f5722096579e034d16505

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/gocryptfs/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Encryption
  TITLE:=Encrypted overlay filesystem written in Go
  URL:=https://nuetzlich.net/gocryptfs
  DEPENDS:=+fuse-utils +libopenssl
endef

define Package/gocryptfs
  $(call Package/gocryptfs/Default)
  VARIANT:=hf
endef

define Package/gocryptfs_nohf
  $(call Package/gocryptfs/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/gocryptfs/description
  An encrypted overlay filesystem written in Go.
endef

Package/gocryptfs_nohf/description=$(Package/gocryptfs/description)

GO_LDFLAGS += \
	-X 'main.GitVersion=$(PKG_VERSION)' \
	-X 'main.GitVersionFuse="[unknown]"' \
	-X 'main.BuildDate=$(SOURCE_DATE)'

#GO_TARGET:=./gocryptfs-xray ./contrib/statfs ./contrib/findholes ./contrib/atomicrename

define Package/gocryptfs/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/gocryptfs $(1)/opt/bin
endef

Package/gocryptfs_nohf/install=$(Package/gocryptfs/install)

$(eval $(call BuildPackage,gocryptfs))
$(eval $(call BuildPackage,gocryptfs_nohf))
