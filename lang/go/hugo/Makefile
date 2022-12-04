# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hugo
PKG_VERSION:=0.107.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/gohugoio/hugo

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=2221b5b30a285d01220a26a82305906ad3291880
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=bcdf56874a10d6b3a5d2176e7284cbe7cdce67330ebba5b585ea4c67b0973869

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/hugo/Default
  SECTION:=net
  CATEGORY:=Network
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

GO_TAGS:=-tags=extended

GO_VARS += GO111MODULE=on

define Package/hugo/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hugo $(1)/opt/bin
endef

Package/hugo_nohf/install=$(Package/hugo/install)

$(eval $(call BuildPackage,hugo))
$(eval $(call BuildPackage,hugo_nohf))
