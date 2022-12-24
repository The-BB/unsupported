# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=lximediaserver
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/lximedia
PKG_HASH:=ddab400fde2f7825773ab6d5bd464edaea154d3ec0cf231785c4f006c51cf210

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/lximediaserver
  CATEGORY:=Multimedia
  SECTION:=multimedia
  TITLE:=LXiMedia
  URL:=http://www.admiraal.dds.nl/lximediaserver/
  DEPENDS:=+libstdcpp +libuuid +libvlc
endef

define Package/lximediaserver/description
  A DLNA compatible, fully transcoding, media server designed for serving
  media (movies, TV shows, music, photos) to DLNA compliant televisions
  and media players (Streamium, PS3, XBox 360). Also subtitles and audio
  language selection are supported.
endef

TARGET_LDFLAGS += $(if $(ICONV_FULL),-liconv)

define Package/lximediaserver/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/lximediaserver $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S97lximediaserver $(1)/opt/etc/init.d
endef

$(eval $(call BuildPackage,lximediaserver))
