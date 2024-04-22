# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=grpcurl
PKG_VERSION:=1.9.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=400fa5f2d354f662c2e39c8b1f8ef71f50498075
PKG_SOURCE_URL:=https://github.com/fullstorydev/grpcurl
PKG_MIRROR_HASH:=c6b21c6e9f5d6ebd5c58ae4cac5428999e316104293858002abe32862eca9b0b

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
  DEPENDS:=@arm
endef

define Package/grpcurl/description
  grpcurl is a command-line tool that lets you interact with gRPC servers.
  It's basically curl for gRPC servers.
endef

Package/grpcurl_nohf/description=$(Package/grpcurl/description)

GO_LDFLAGS += -X 'main.version=$(PKG_VERSION)'

define Package/grpcurl/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/grpcurl $(1)/opt/sbin/grpcurl
endef

Package/grpcurl_nohf/install=$(Package/grpcurl/install)

$(eval $(call BuildPackage,grpcurl))
$(eval $(call BuildPackage,grpcurl_nohf))
