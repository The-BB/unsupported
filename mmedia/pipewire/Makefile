# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pipewire
PKG_VERSION:=0.3.67
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PKG_VERSION)
PKG_HASH:=43dfad8ee64c90613fdc67db0d7706e4ae747ee5e4aed03c34d3869f3926e081

PKG_LICENSE:=GPL-2.0-only LGPL-2.1-or-later MIT
PKG_LICENSE_FILES:=COPYING LICENSE

PKG_CONFIG_DEPENDS:= \
	CONFIG_PIPEWIRE_ALSA_LIB \
	CONFIG_PIPEWIRE_AVAHI_LIBAVAHI_CLIENT \
	CONFIG_PIPEWIRE_DBUS \
	CONFIG_PIPEWIRE_FFMPEG \
	CONFIG_PIPEWIRE_LIBSNDFILE \
	CONFIG_PIPEWIRE_LIBUSB \
	CONFIG_PIPEWIRE_PIPEWIRE_EXAMPLES \
	CONFIG_PIPEWIRE_PULSEAUDIO \
	CONFIG_PIPEWIRE_RAOP \
	CONFIG_PIPEWIRE_UDEV

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pipewire/Default
  TITLE:=a server and user space API
  URL:=https://pipewire.org/
  DEPENDS:=@AUDIO_SUPPORT @USB_SUPPORT
endef

define Package/libpipewire
  $(call Package/pipewire/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
  DEPENDS:=$(INTL_DEPENDS)
endef

define Package/pipewire
  $(call Package/pipewire/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS+=+libncursesw +libpipewire +libreadline \
	+PIPEWIRE_ALSA_LIB:alsa-lib \
	+PIPEWIRE_AVAHI_LIBAVAHI_CLIENT:libavahi-client \
	+PIPEWIRE_AVAHI_LIBAVAHI_CLIENT:libavahi-nodbus-support \
	+PIPEWIRE_DBUS:libdbus \
	+PIPEWIRE_FFMPEG:libffmpeg \
	+PIPEWIRE_LIBSNDFILE:libsndfile \
	+PIPEWIRE_PULSEAUDIO:glib2 \
	+PIPEWIRE_PULSEAUDIO:pulseaudio-daemon \
	+PIPEWIRE_RAOP:libopenssl \
	+(PIPEWIRE_UDEV||PIPEWIRE_ALSA_LIB):libudev
  MENU:=1
endef

define Package/pipewire/description
  PipeWire is a server and user space API to deal with multimedia pipelines.
endef

Package/libpipewire/description=$(call Package/pipewire/description)

define Package/pipewire/config
  source "$(SOURCE)/Config.in"
endef

MESON_ARGS += \
	-Daudioconvert=enabled \
	-Daudiomixer=enabled \
	-Daudiotestsrc=enabled \
	-Davb=disabled \
	-Dbluez5-codec-lc3=disabled \
	-Dbluez5-codec-lc3plus=disabled \
	-Dbluez5-codec-opus=disabled \
	-Dbluez5=disabled \
	-Dcontrol=enabled \
	-Ddocs=disabled \
	-Decho-cancel-webrtc=disabled \
	-Devl=disabled \
	-Dflatpak=disabled \
	-Dgstreamer=disabled \
	-Djack=disabled \
	-Dlegacy-rtkit=false \
	-Dlibcamera=disabled \
	-Dlibcanberra=disabled \
	-Dlv2=disabled \
	-Dman=disabled \
	-Dpipewire-jack=disabled \
	-Dpipewire-v4l2=disabled \
	-Dsdl2=disabled \
	-Dsession-managers=[] \
	-Dspa-plugins=enabled \
	-Dsupport=enabled \
	-Dsystemd-system-service=disabled \
	-Dsystemd-user-service=disabled \
	-Dsystemd=disabled \
	-Dtest=disabled \
	-Dtests=disabled \
	-Dudevrulesdir=/opt/lib/udev/rules.d \
	-Dv4l2=disabled \
	-Dvideoconvert=enabled \
	-Dvideotestsrc=enabled \
	-Dvolume=enabled \
	-Dvulkan=disabled \
	-Dx11-xfixes=disabled \
	-Dx11=disabled

MESON_ARGS += \
	-Dalsa=$(if $(CONFIG_PIPEWIRE_ALSA_LIB),en,dis)abled \
	-Davahi=$(if $(CONFIG_PIPEWIRE_AVAHI_LIBAVAHI_CLIENT),en,dis)abled \
	-Ddbus=$(if $(CONFIG_PIPEWIRE_DBUS),en,dis)abled \
	-Dexamples=$(if $(CONFIG_PIPEWIRE_PIPEWIRE_EXAMPLES),en,dis)abled \
	-Dffmpeg=$(if $(CONFIG_PIPEWIRE_FFMPEG),en,dis)abled \
	-Dlibpulse=$(if $(CONFIG_PIPEWIRE_PULSEAUDIO),en,dis)abled \
	-Dlibusb=$(if $(CONFIG_PIPEWIRE_LIBUSB),en,dis)abled \
	-Dpipewire-alsa=$(if $(CONFIG_PIPEWIRE_ALSA_LIB),en,dis)abled \
	-Dpw-cat=$(if $(CONFIG_PIPEWIRE_LIBSNDFILE),en,dis)abled \
	-Draop=$(if $(CONFIG_PIPEWIRE_RAOP),en,dis)abled \
	-Dsndfile=$(if $(CONFIG_PIPEWIRE_LIBSNDFILE),en,dis)abled \
	-Dudev=$(if $(CONFIG_PIPEWIRE_UDEV),en,dis)abled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/{pipewire,spa}-* $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpipewire*.so* $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/lib{pipewire,spa}-*.pc \
		$(1)/opt/lib/pkgconfig
endef

define Package/libpipewire/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpipewire*.so.* $(1)/opt/lib
endef

define Package/pipewire/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pipewire-* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/spa-* $(1)/opt/lib

  ifeq ($(CONFIG_PIPEWIRE_ALSA_LIB),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/{alsa-lib,udev} $(1)/opt/lib
  endif

	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/pipewire $(1)/opt/share

  ifeq ($(CONFIG_PIPEWIRE_ALSA_LIB),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/share/alsa{,-card-profile} $(1)/opt/share
  endif
endef

$(eval $(call BuildPackage,libpipewire))
$(eval $(call BuildPackage,pipewire))
