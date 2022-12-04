# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=kopia
PKG_VERSION:=0.12.1
PKG_RELEASE:=1

PKG_GOGET:=github.com/kopia/kopia

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=5227d74996b6520f9f96e4203cfe00b832a60d5f
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=5c791912e2c0310defdbb0aa72a17376a462ee3a8fe2c71d89b7517399da1daa

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/kopia/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Backup
  TITLE:=backup/restore tool
  URL:=https://kopia.io/
endef

define Package/kopia
  $(call Package/kopia/Default)
  VARIANT:=hf
endef

define Package/kopia_nohf
  $(call Package/kopia/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/kopia/description
  Kopia is a fast and secure open-source backup/restore tool that allows
  you to create encrypted snapshots of your data and save the snapshots
  to remote or cloud storage of your choice, to network-attached storage
  or server, or locally on your machine.
endef

Package/kopia_nohf/description=$(Package/kopia/description)

define Package/kopia/conffiles
/opt/etc/kopia/kopia.conf
endef

Package/kopia_nohf/conffiles=$(Package/kopia/conffiles)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/repo.BuildVersion=$(PKG_VERSION)' \
	-X '$(PKG_GOGET)/repo.BuildInfo=$(PKG_SOURCE_VERSION)' \
	-X '$(PKG_GOGET)/repo.BuildGitHubRepo=$(PKG_NAME)'

define Package/kopia/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/kopia $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/kopia
	$(INSTALL_DATA) files/kopia.conf $(1)/opt/etc/kopia
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99kopia $(1)/opt/etc/init.d
endef

Package/kopia_nohf/install=$(Package/kopia/install)

$(eval $(call BuildPackage,kopia))
$(eval $(call BuildPackage,kopia_nohf))
