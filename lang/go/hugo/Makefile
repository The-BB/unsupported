# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hugo
PKG_VERSION:=0.125.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=4e483f5d4abae136c4312d397a55e9e1d39148df
PKG_SOURCE_URL:=https://github.com/gohugoio/hugo
PKG_MIRROR_HASH:=152f6d7712391ec09f5a23e6cd9a0b48f3e0608dfca173ffc565e418e08c075f

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
  DEPENDS+=@arm
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
