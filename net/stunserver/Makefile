# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=stunserver
PKG_VERSION:=1.2.16
# deps openssl 3.x
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=cfadf9c3836d5ae63a682913de24ba085df924f3
PKG_SOURCE_URL:=https://github.com/jselbie/stunserver
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=Apache-2.0

PKG_BUILD_DEPENDS:=boost

include $(INCLUDE_DIR)/package.mk

define Package/stunserver/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  TITLE:=STUNTMAN
  URL:=https://github.com/jselbie/stunserver
  DEPENDS:=+libopenssl +libstdcpp
endef

define Package/stunclient
$(call Package/stunserver/Default)
  TITLE+= (stunclient)
endef

define Package/stunserver
$(call Package/stunserver/Default)
  TITLE+= (stunserver)
endef

define Package/stuntestcode
$(call Package/stunserver/Default)
  TITLE+= (stuntestcode)
endef

define Package/stunserver/Default/description
  STUNTMAN - An open source STUN server.
endef

define Package/stunclient/description
$(call Package/stunserver/Default/description)
  .
  stunclient
endef

define Package/stunserver/description
$(call Package/stunserver/Default/description)
  .
  stunserver
endef

define Package/stuntestcode/description
$(call Package/stunserver/Default/description)
  .
  stuntestcode
endef

TARGET_CXXFLAGS += -DBOOST_BIND_GLOBAL_PLACEHOLDERS

define Package/stunclient/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/stunclient $(1)/opt/bin
endef

define Package/stunserver/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/stunserver $(1)/opt/bin
endef

define Package/stuntestcode/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/stuntestcode $(1)/opt/bin
endef

$(eval $(call BuildPackage,stunclient))
$(eval $(call BuildPackage,stunserver))
$(eval $(call BuildPackage,stuntestcode))
