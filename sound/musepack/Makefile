# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=musepack
PKG_VERSION:=r475
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_src_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.musepack.net/source
PKG_HASH:=a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b

PKG_LICENSE:=BSD-3-Clause LGPL-2.1-or-later
PKG_LICENSE_FILES:=libmpcdec/COPYING

PKG_BUILD_DEPENDS:=libcuefile

# XXX force disable
PKG_USE_NINJA:=0
PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/musepack/Default
  TITLE:=Musepack SV8 libs & tools
  URL:=http://www.musepack.net/
endef

define Package/libmpcdec
  $(call Package/musepack/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (libs)
endef

define Package/musepack
  $(call Package/musepack/Default)
  SECTION:=sound
  CATEGORY:=Sound
  TITLE+= (tools)
  DEPENDS:=+libmpcdec +libreplaygain
endef

define Package/musepack/description
  Musepack is an audio compression format with a strong
  emphasis on high quality. It's not lossless, but it is
  designed for transparency, so that you won't be able to
  hear differences between the original wave file and the
  much smaller MPC file.
endef

Package/libmpcdec/description=$(Package/musepack/description)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/mpc
	$(CP) $(PKG_BUILD_DIR)/include/mpc/*.h $(1)/opt/include/mpc

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmpcdec.so* $(1)/opt/lib
endef

define Package/libmpcdec/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmpcdec.so.* $(1)/opt/lib
endef

define Package/musepack/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef

$(eval $(call BuildPackage,libmpcdec))
$(eval $(call BuildPackage,musepack))
