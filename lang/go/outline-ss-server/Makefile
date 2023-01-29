# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=outline-ss-server
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/Jigsaw-Code/outline-ss-server

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=80a21448be6e7f950943b3bc54ed21c361b7295c
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=966d8b3f0c8573dfd9cfc574dbd111e723211d363ed4042c8d8c29ce29f0a97f

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/outline-ss-server/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=prometheus tools
  TITLE:=Outline Shadowsocks server
  URL:=https://getoutline.org/
  DEPENDS:=+go-shadowsocks2
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

define Package/outline-ss-server/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/outline-ss-server $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) $(GO_SRC_DIR)/config_example.yml \
		$(1)/opt/etc/outline-ss-server.yml
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99outline-ss-server $(1)/opt/etc/init.d
endef

Package/outline-ss-server_nohf/install=$(Package/outline-ss-server/install)

$(eval $(call BuildPackage,outline-ss-server))
$(eval $(call BuildPackage,outline-ss-server_nohf))
