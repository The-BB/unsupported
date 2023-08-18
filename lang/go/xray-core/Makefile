# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/xray-core

include $(TOPDIR)/rules.mk

PKG_NAME:=Xray-core
PKG_VERSION:=1.8.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6f9df63c701bb7f71abe335112b6b3819481feaa
PKG_SOURCE_URL:=https://github.com/XTLS/Xray-core
PKG_MIRROR_HASH:=490de3b9fda5146805762f77a59c9de67cb9a17ddadf4f275ea1c84f51fd39cd

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/xray-core/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Set of network penetration tools
  URL:=https://github.com/XTLS/Xray-core
  DEPENDS:=+ca-bundle
endef

define Package/xray-core
  $(call Package/xray-core/Default)
  VARIANT:=hf
endef

define Package/xray-core_nohf
  $(call Package/xray-core/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/xray-core/description
  Xray, Penetrates Everything. Also the best v2ray-core, with XTLS support.
  Fully compatible configuration.
endef

Package/xray-core_nohf/description=$(Package/xray-core/description)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/core.build=Entware' \
	-X '$(XIMPORTPATH)/core.version=v$(PKG_VERSION)'

GO_TARGET:=./main

define Package/xray-core/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/main $(1)/opt/bin/xray
endef

Package/xray-core_nohf/install=$(Package/xray-core/install)

$(eval $(call BuildPackage,xray-core))
$(eval $(call BuildPackage,xray-core_nohf))
