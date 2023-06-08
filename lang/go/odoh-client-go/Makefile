# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=odoh-client-go
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=8d45d054d3e85da96d5764c0634475deb5e88c4c
PKG_SOURCE_URL:=https://github.com/cloudflare/odoh-client-go
PKG_MIRROR_HASH:=4eee0f2792a607bf17db7513701e9aa0898f556942fcb8bcc4a58d9821570ca8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/odoh-client-go/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Oblivious DoH client
  URL:=https://github.com/cloudflare/odoh-client-go
endef

define Package/odoh-client-go
  $(call Package/odoh-client-go/Default)
  VARIANT:=hf
endef

define Package/odoh-client-go_nohf
  $(call Package/odoh-client-go/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/odoh-client-go/description
  odoh-client is a command line interface as a client for making
  Oblivious DNS-over-HTTPS queries.
endef

Package/odoh-client-go_nohf/description=$(Package/odoh-client-go/description)

GO_BUILD_ARGS += -a

GO_LDFLAGS += \
	-X 'main.Version=$(PKG_VERSION)' \
	-X 'main.CommitId=$(COMMIT_SHORT)'

GO_TARGET:=./cmd/...

define Package/odoh-client-go/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/cmd $(1)/opt/bin/odoh-client
endef

Package/odoh-client-go_nohf/install=$(Package/odoh-client-go/install)

$(eval $(call BuildPackage,odoh-client-go))
$(eval $(call BuildPackage,odoh-client-go_nohf))
