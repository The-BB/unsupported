# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=lshw
PKG_VERSION:=B.02.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.ezix.org/software/files/
PKG_HASH:=06d9cf122422220e5dc94e8ea5b01816a69bb6b59368f63d7f21fff31fc6922a

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lshw
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=HardWare LiSter
  URL:=http://lshw.ezix.org
  DEPENDS:=+libstdcpp
endef

define Package/lshw/description
  lshw is a small tool to provide detailed information on the hardware
  configuration of the machine. It can report exact memory configuration,
  firmware version, mainboard configuration, CPU version and speed, cache
  configuration, bus speed, etc.
endef

define Package/lshw/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/sbin/lshw $(1)/opt/sbin
	$(INSTALL_DIR) $(1)/opt/share/lshw
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/share/lshw/* $(1)/opt/share/lshw
endef

$(eval $(call BuildPackage,lshw))
