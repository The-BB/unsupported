# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=grpcurl
PKG_VERSION:=1.8.9
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=28c0ee28f02a3db8affaf8fcc0c786312167e0f6
PKG_SOURCE_URL:=https://github.com/fullstorydev/grpcurl
PKG_MIRROR_HASH:=af846138efbb87e64ed4c6b00bc7bd78a14c5a9c4bf0d5771a1ab18d0d91a498

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/grpcurl/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=CLI tool to interact with gRPC servers
  URL:=https://github.com/fullstorydev/grpcurl
endef

define Package/grpcurl
  $(call Package/grpcurl/Default)
  VARIANT:=hf
endef

define Package/grpcurl_nohf
  $(call Package/grpcurl/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/grpcurl/description
  grpcurl is a command-line tool that lets you interact with gRPC servers.
  It's basically curl for gRPC servers.
endef

Package/grpcurl_nohf/description=$(Package/grpcurl/description)

GO_LDFLAGS += -X 'main.version=$(PKG_VERSION)'

GO_TARGET:=./...

define Package/grpcurl/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/grpcurl $(1)/opt/sbin/grpcurl
endef

Package/grpcurl_nohf/install=$(Package/grpcurl/install)

$(eval $(call BuildPackage,grpcurl))
$(eval $(call BuildPackage,grpcurl_nohf))
