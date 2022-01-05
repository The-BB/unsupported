# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=snapcast
PKG_VERSION:=0.26.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/badaix/snapcast/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=skip

PKG_LICENSE:=GPL-3.0-or-later

PKG_BUILD_DEPENDS:=boost

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/snapcast/Default
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=Multiroom client-server audio player
  URL:=https://github.com/badaix/snapcast
  DEPENDS:=+alsa-lib +libatomic +libavahi-client +libflac +libogg +libopus +libsoxr +libstdcpp
endef

define Package/snapcast-client
  $(call Package/snapcast/Default)
  TITLE+=(Snapcast client)
  DEPENDS+=+libvorbisidec
endef

define Package/snapcast-server
  $(call Package/snapcast/Default)
  TITLE+=(Snapcast server)
  DEPENDS+=+libexpat +libvorbis
endef

define Package/snapcast-snapweb
  $(call Package/snapcast/Default)
  TITLE+=(Snapweb)
  DEPENDS:=+snapcast-server
endef

define Package/snapcast/description
  Snapcast is a multiroom client-server audio player, where all clients are
  time synchronized with the server to play perfectly synced audio. It's not
  a standalone player, but an extension that turns your existing audio player
  into a Sonos-like multiroom solution.
endef

define Package/snapcast-server/conffiles
/opt/etc/snapserver.conf
endef

#CMAKE_OPTIONS += \
#	-DBUILD_TESTS:BOOL=OFF \
#	-DBUILD_WITH_AVAHI:BOOL=OFF \
#	-DBoost_DIR:PATH=$(STAGING_DIR)/opt/lib/cmake \
#	-DBoost_INCLUDE_DIR:PATH=$(STAGING_DIR)/opt/include/boost

#	-DBUILD_WITH_EXPAT:BOOL=ON \
#	-DBUILD_WITH_FLAC:BOOL=ON \
#	-DBUILD_WITH_OPUS:BOOL=ON \
#	-DBUILD_WITH_TREMOR:BOOL=ON \
#	-DBUILD_WITH_VORBIS:BOOL=ON

define Package/snapcast-client/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/snapclient $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99snapclient $(1)/opt/etc/init.d
endef

define Package/snapcast-server/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/snapserver $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/opt/etc/snapserver.conf $(1)/opt/etc
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S98snapserver $(1)/opt/etc/init.d
endef

define Package/snapcast-snapweb/install
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/snapserver $(1)/opt/share/
endef

$(eval $(call BuildPackage,snapcast-client))
$(eval $(call BuildPackage,snapcast-server))
$(eval $(call BuildPackage,snapcast-snapweb))
