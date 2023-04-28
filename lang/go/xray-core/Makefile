# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/xray-core

include $(TOPDIR)/rules.mk

PKG_NAME:=Xray-core
PKG_VERSION:=1.7.5
PKG_RELEASE:=1

PKG_GOGET:=github.com/XTLS/Xray-core

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=15999e5c2aa92abe063cea03803d06b29e37e25b
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=455204e9308c867179499dc9c5e78efe307ae723aa585593b6b05a44b7ef1fb7

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
	-X '$(PKG_GOGET)/core.build=Entware' \
	-X '$(PKG_GOGET)/core.version=v$(PKG_VERSION)'

GO_TARGET:=./main

define Package/xray-core/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/main $(1)/opt/bin/xray
endef

Package/xray-core_nohf/install=$(Package/xray-core/install)

$(eval $(call BuildPackage,xray-core))
$(eval $(call BuildPackage,xray-core_nohf))
