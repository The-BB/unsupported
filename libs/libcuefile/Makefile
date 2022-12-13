# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libcuefile
PKG_VERSION:=r475
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.musepack.net/source
PKG_HASH:=b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/libcuefile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=CUE File library
  URL:=http://www.musepack.net/
  BUILDONLY:=1
endef

define Package/libcuefile/description
  Cue File library from Musepack.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_BUILD_DIR)/include/cuetools $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcuefile.a $(1)/opt/lib
endef

$(eval $(call BuildPackage,libcuefile))
