# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=corosync
PKG_VERSION:=3.1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/corosync/corosync/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=7e99adc515e4c339c6b72dd0e48c7971b336e376d2b5821ba742caa9dc5bf75c

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/corosync/Default
  TITLE:=The Corosync Cluster Engine
  URL:=https://corosync.github.io/corosync
endef

define Package/libcorosync
  $(call Package/corosync/Default)
  SECTION:=lib
  CATEGORY:=Libraries
  DEPENDS:=+libqb
endef

define Package/corosync
  $(call Package/corosync/Default)
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcorosync +libknet +libreadline +libstatgrab
endef

define Package/corosync/description
  The Corosync Cluster Engine and Application Programming Interfaces.
endef

Package/libcorosync/description=$(Package/corosync/description)

define Package/corosync/conffiles
/opt/etc/corosync/corosync.conf
endef

CONFIGURE_ARGS += \
	--enable-monitoring \
	--enable-vqsim

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/corosync $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.{a,so*} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig
endef

define Package/libcorosync/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.so* $(1)/opt/lib
endef

define Package/corosync/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/corosync-* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(PKG_INSTALL_DIR)/opt/etc/{corosync,logrotate.d} $(1)/opt/etc
	$(CP) ./files/corosync.conf $(1)/opt/etc/corosync
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/etc/init.d/corosync \
		$(1)/opt/etc/init.d/S20corosync
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/etc/init.d/corosync-notifyd \
		$(1)/opt/etc/init.d/S23corosync-notifyd
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/sbin/corosync* $(1)/opt/sbin
#	$(INSTALL_DIR) $(1)/opt/share
#	$(CP) $(PKG_INSTALL_DIR)/opt/share/snmp $(1)/opt/share
	$(INSTALL_DIR) $(1)/opt/var
	$(CP) $(PKG_INSTALL_DIR)/opt/var/{lib,log} $(1)/opt/var
endef

$(eval $(call BuildPackage,libcorosync))
$(eval $(call BuildPackage,corosync))
