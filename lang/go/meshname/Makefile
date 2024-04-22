# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=meshname
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=92a819e45af6b15ec83f07b41efb6b239818ec5b
PKG_SOURCE_URL:=https://github.com/zhoreeq/meshname
PKG_MIRROR_HASH:=7bf32c85b15294444625c6e5d5253435acb688e8b471d279138a21a2dace1feb

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/meshname/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=universal naming system for all IPv6-based mesh networks
  URL:=https://github.com/zhoreeq/meshname
  DEPENDS:=+ca-bundle
endef

define Package/meshname
  $(call Package/meshname/Default)
  VARIANT:=hf
endef

define Package/meshname_nohf
  $(call Package/meshname/Default)
  VARIANT:=nohf
  DEPENDS+=@arm
endef

define Package/meshname/description
  A universal naming system for all IPv6-based mesh networks,
  including CJDNS and Yggdrasil. Implements the Meshname protocol.
endef

Package/meshname_nohf/description=$(Package/meshname/description)

GO_TARGET:=./cmd/meshnamed

define Package/meshname/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/meshnamed $(1)/opt/sbin
endef

Package/meshname_nohf/install=$(Package/meshname/install)

$(eval $(call BuildPackage,meshname))
$(eval $(call BuildPackage,meshname_nohf))
