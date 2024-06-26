# SPDX-License-Identifier: WTFPL

# 0.37.0+ ERROR: Dependency "libplacebo" not found, tried pkgconfig and cmake

include $(TOPDIR)/rules.mk

PKG_NAME:=mpv
PKG_VERSION:=0.36.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mpv-player/mpv/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=29abc44f8ebee013bb2f9fe14d80b30db19b534c679056e4851ceadf5a5e8bf6

PKG_LICENSE:=GPL-2.1-or-later LGPL-2.1-or-later
PKG_LICENSE_FILES:=LICENSE.GPL LICENSE.LGPL

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/mpv/Default
  TITLE:=Command line video player
  URL:=https://mpv.io/
  DEPENDS:=+alsa-lib +libass +libffmpeg +libjpeg +liblua +zlib
endef

define Package/libmpv
  $(call Package/mpv/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
endef

define Package/mpv
  $(call Package/mpv/Default)
  CATEGORY:=Multimedia
  SECTION:=multimedia
endef

define Package/mpv/description
  mpv is a free (as in freedom) media player for the command line.
  It supports a wide variety of media file formats, audio and video
  codecs, and subtitle types.
endef

Package/libmpv/description=$(Package/mpv/description)

define Package/mpv/conffiles
/opt/etc/mpv/encoding-profiles.conf
endef

MESON_ARGS += \
	-Db_lto=true \
	-Dgl=disabled \
	-Dlibarchive=disabled \
	-Dlibmpv=true \
	-Dlua=enabled \
	-Dmanpage-build=disabled \
	-Dpipewire=disabled \
	-Dpulse=disabled \
	-Dsndio=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/mpv
	$(CP) $(PKG_INSTALL_DIR)/opt/include/mpv/*.h $(1)/opt/include/mpv
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmpv.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/mpv.pc $(1)/opt/lib/pkgconfig
endef

define Package/libmpv/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmpv.so* $(1)/opt/lib
endef

define Package/mpv/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mpv $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/mpv
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/etc/mpv/*.conf $(1)/opt/etc/mpv
endef

$(eval $(call BuildPackage,libmpv))
$(eval $(call BuildPackage,mpv))
