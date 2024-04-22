# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=outline-ss-server
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=4c35a5140307d58bded3fba7f8a29f0847250e71
PKG_SOURCE_URL:=https://github.com/Jigsaw-Code/outline-ss-server
PKG_MIRROR_HASH:=6f1250649a1bedb6df6efa07442072aaf3f9b0773d9266667fb47e163ad6e276

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
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
  DEPENDS+=@arm
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
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/outline-ss-server $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/cmd/outline-ss-server/config_example.yml \
		$(1)/opt/etc/outline-ss-server.yml
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99outline-ss-server $(1)/opt/etc/init.d
endef

Package/outline-ss-server_nohf/install=$(Package/outline-ss-server/install)

$(eval $(call BuildPackage,outline-ss-server))
$(eval $(call BuildPackage,outline-ss-server_nohf))
