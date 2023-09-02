# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hugo
PKG_VERSION:=0.118.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=da7983ac4b94d97d776d7c2405040de97e95c03d
PKG_SOURCE_URL:=https://github.com/gohugoio/hugo
PKG_MIRROR_HASH:=781605288896b1cc8d79c21a14330fd3ed28837bf771383d4fbd30aa39319fe6

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

include ../goenv.mk
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

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/common/hugo.vendorInfo=Entware'

GO_TAGS:=-tags=extended

define Package/hugo/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/hugo $(1)/opt/bin
endef

Package/hugo_nohf/install=$(Package/hugo/install)

$(eval $(call BuildPackage,hugo))
$(eval $(call BuildPackage,hugo_nohf))
