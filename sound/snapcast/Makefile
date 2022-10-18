# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=snapcast
PKG_VERSION:=0.26.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/badaix/snapcast/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=166353267a5c461a3a0e7cbd05d78c4bfdaebeda078801df3b76820b54f27683

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=boost

PKG_CONFIG_DEPENDS:= \
	CONFIG_SNAPCAST_AVAHI \
	CONFIG_SNAPCAST_EXPAT \
	CONFIG_SNAPCAST_FLAC \
	CONFIG_SNAPCAST_OPUS \
	CONFIG_SNAPCAST_PULSE \
	CONFIG_SNAPCAST_TREMOR \
	CONFIG_SNAPCAST_VORBIS

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/snapcast/Default
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=Multiroom client-server audio player
  URL:=https://github.com/badaix/snapcast
  DEPENDS:=+alsa-lib +libsoxr +libstdcpp
  DEPENDS+= \
	+SNAPCAST_AVAHI:libavahi-client \
	+SNAPCAST_FLAC:libflac \
	+SNAPCAST_OPUS:libopus \
	+SNAPCAST_PULSE:pulseaudio-daemon \
	+SNAPCAST_VORBIS:libogg \
	+SNAPCAST_VORBIS:libvorbis
endef

define Package/snapcast-client
  $(call Package/snapcast/Default)
  TITLE+=(Snapcast client)
  DEPENDS+=+snapcast-server +SNAPCAST_TREMOR:libvorbisidec
endef

define Package/snapcast-server
  $(call Package/snapcast/Default)
  TITLE+=(Snapcast server)
  DEPENDS+=+SNAPCAST_EXPAT:libexpat
  MENU:=1
endef

define Package/snapcast-snapweb
  $(call Package/snapcast/Default)
  TITLE+=(Snapweb)
  DEPENDS:=+snapcast-server
endef

define Package/snapcast/description/Default
  Snapcast is a multiroom client-server audio player, where all clients are
  time synchronized with the server to play perfectly synced audio. It's not
  a standalone player, but an extension that turns your existing audio player
  into a Sonos-like multiroom solution.
endef

Package/snapcast-client/description=$(Package/snapcast/description/Default)
Package/snapcast-server/description=$(Package/snapcast/description/Default)
Package/snapcast-snapweb/description=$(Package/snapcast/description/Default)

define Package/snapcast-server/config
  source "$(SOURCE)/Config.in"
endef

define Package/snapcast-server/conffiles
/opt/etc/snapserver.conf
endef

TARGET_CFLAGS += -pthread

ifeq ($(CONFIG_SNAPCAST_PULSE),y)
TARGET_LDFLAGS += -L$(STAGING_DIR)/opt/lib/pulseaudio -lpulsecommon-14.2
endif

CMAKE_OPTIONS += \
	-DBUILD_WITH_AVAHI=$(if $(CONFIG_SNAPCAST_AVAHI),ON,OFF) \
	-DBUILD_WITH_EXPAT=$(if $(CONFIG_SNAPCAST_EXPAT),ON,OFF) \
	-DBUILD_WITH_FLAC=$(if $(CONFIG_SNAPCAST_FLAC),ON,OFF) \
	-DBUILD_WITH_OPUS=$(if $(CONFIG_SNAPCAST_OPUS),ON,OFF) \
	-DBUILD_WITH_PULSE=$(if $(CONFIG_SNAPCAST_PULSE),ON,OFF) \
	-DBUILD_WITH_TREMOR=$(if $(CONFIG_SNAPCAST_TREMOR),ON,OFF) \
	-DBUILD_WITH_VORBIS=$(if $(CONFIG_SNAPCAST_VORBIS),ON,OFF)

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
	$(SED) 's,^#!.*python,#!/opt/bin/python,' \
		$(1)/opt/share/snapserver/plug-ins/meta_mpd.py
endef

$(eval $(call BuildPackage,snapcast-client))
$(eval $(call BuildPackage,snapcast-server))
$(eval $(call BuildPackage,snapcast-snapweb))
