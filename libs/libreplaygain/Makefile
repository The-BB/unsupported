# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libreplaygain
PKG_VERSION:=r475
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.musepack.net/source
PKG_HASH:=8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/libreplaygain
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ReplayGain library
  URL:=http://www.musepack.net/
endef

define Package/libreplaygain/description
  Replay Gain library from Musepack.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_BUILD_DIR)/include/replaygain $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libreplaygain.so* $(1)/opt/lib
endef

define Package/libreplaygain/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libreplaygain.so.* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libreplaygain))
