# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=chezmoi
PKG_VERSION:=2.33.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/twpayne/chezmoi

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ced12b81b493670520b177dcc62de2c67172858d
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=79cb88b5dc42f73745165f218f8c5f7b39b1e091c32b73fdd1b5aad91d6fabe5

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/chezmoi/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Manage dotfiles
  URL:=https://chezmoi.io/
endef

define Package/chezmoi
  $(call Package/chezmoi/Default)
  VARIANT:=hf
endef

define Package/chezmoi_nohf
  $(call Package/chezmoi/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/chezmoi/description
  Manage your dotfiles across multiple diverse machines, securely.
endef

Package/chezmoi_nohf/description=$(Package/chezmoi/description)

BUILDTIME:=$(shell date -u +%FT%TZ%z)
COMMIT:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X 'main.version=v$(PKG_VERSION)' \
	-X 'main.commit=$(COMMIT)' \
	-X 'main.date=$(BUILDTIME)' \
	-X 'main.builtBy=Entware'

define Package/chezmoi/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/chezmoi $(1)/opt/bin
endef

Package/chezmoi_nohf/install=$(Package/chezmoi/install)

$(eval $(call BuildPackage,chezmoi))
$(eval $(call BuildPackage,chezmoi_nohf))
