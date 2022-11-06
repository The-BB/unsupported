# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=outline-ss-server
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/Jigsaw-Code/outline-ss-server

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=80a21448be6e7f950943b3bc54ed21c361b7295c
PKG_HASH:=skip

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/outline-ss-server/Default
  $(call Package/gopackage/Default)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Outline Shadowsocks server
  URL:=https://getoutline.org/
endef

define Package/outline-ss-server
  $(call Package/outline-ss-server/Default)
  VARIANT:=hf
endef

define Package/outline-ss-server_nohf
  $(call Package/outline-ss-server/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/outline-ss-server/description
  Outline ss-server.
endef

Package/outline-ss-server_nohf/description=$(Package/outline-ss-server/description)

define Package/outline-ss-server/conffiles
/opt/etc/outline-ss-server.yml
endef

Package/outline-ss-server_nohf/conffiles=$(Package/outline-ss-server/conffiles)

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		$(SED) 's,"dev","$(PKG_VERSION)",' server.go; \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/outline-ss-server \
		-ldflags="-s -w"; \
	)
endef

define Package/outline-ss-server/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/outline-ss-server $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/config_example.yml \
		$(1)/opt/etc/outline-ss-server.yml
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99outline-ss-server $(1)/opt/etc/init.d
endef

Package/outline-ss-server_nohf/install=$(Package/outline-ss-server/install)

$(eval $(call BuildPackage,outline-ss-server))
$(eval $(call BuildPackage,outline-ss-server_nohf))
