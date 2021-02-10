# SPDX-License-Identifier: GPL-2.0-only

# Based on https://git.archive.openwrt.org/?p=packages.git;a=blob_plain;f=net/stun/Makefile;hb=HEAD

include $(TOPDIR)/rules.mk

PKG_NAME:=stund
PKG_VERSION:=0.97
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=@SF/stun
PKG_HASH:=83e1bf9c21399244c5e8ad19789121a3537399d6523a887a5abc6187adcdb1d7

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/stun/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libstdcpp
  URL:=http://sourceforge.net/projects/stun
endef

define Package/stun/Default/description
  The STUN protocol (Simple Traversal of UDP through NATs) is described in the
  IETF RFC 3489, available at http://www.ietf.org/rfc/rfc3489.txt. It's used to
  help clients behind NAT to tunnel incoming calls through. This server is the
  counterpart to help the client identify the NAT and have it open the proper
  ports for it.
endef

define Package/stund
$(call Package/stun/Default)
  TITLE:=STUN server
endef

define Package/stund/description
$(call Package/stun/Default/description)
endef

define Package/stun-client
$(call Package/stun/Default)
  TITLE:=STUN test client
endef

define Package/stun-client/description
$(call Package/stun/Default/description)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CXX="$(TARGET_CXX)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CXXFLAGS="$(TARGET_CFLAGS) -fno-rtti"  \
		CPPFLAGS="$$$$CPPFLAGS $(TARGET_CPPFLAGS)" \
		LDFLAGS="$$$$LDFLAGS $(TARGET_LDFLAGS)" \
		all
endef


define Package/stund/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/server $(1)/opt/sbin/stund
endef

define Package/stun-client/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/client $(1)/opt/sbin/stun-client
endef

$(eval $(call BuildPackage,stund))
$(eval $(call BuildPackage,stun-client))
