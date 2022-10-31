# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sdl2
PKG_VERSION:=2.24.1
PKG_RELEASE:=1

PKG_SOURCE:=SDL2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.libsdl.org/release
PKG_HASH:=bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b

PKG_MAINTAINER:=Entware team, https://entware.net
PKG_LICENSE:=Zlib
PKG_LICENSE_FILES:=LICENSE.txt

PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_LIBSDL2_ALSA \
	CONFIG_LIBSDL2_DBUS \
	CONFIG_LIBSDL2_UDEV

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/libsdl2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Simple DirectMedia Layer
  URL:=http://www.libsdl.org
  DEPENDS:=@AUDIO_SUPPORT
  DEPENDS+= \
	+LIBSDL2_ALSA:alsa-lib \
	+LIBSDL2_DBUS:libdbus \
	+LIBSDL2_UDEV:libudev
endef

 define Package/libsdl2/description
  Simple DirectMedia Layer 2 - SDL2 is a library that allows programs
  portable low level access to a video framebuffer, audio output,
  mouse, and keyboard. It is not compatible with SDL1.
endef

define Package/libsdl2/config
config LIBSDL2_ALSA
	depends on PACKAGE_libsdl2
	bool "Support the ALSA audio API"
	default y

config LIBSDL2_DBUS
	depends on PACKAGE_libsdl2
	bool "Enable D-Bus support"
	default y

config LIBSDL2_UDEV
	depends on PACKAGE_libsdl2
	bool "Enable libudev support"
	default y

endef

CONFIGURE_ARGS += \
	--disable-3dnow \
	--disable-arts \
	--disable-directx \
	--disable-esd \
	--disable-fcitx \
	--disable-hidapi-joystick \
	--disable-hidapi-libusb \
	--disable-ibus \
	--disable-ime \
	--disable-joystick-mfi \
	--disable-joystick-virtual \
	--disable-pulseaudio \
	--disable-render-d3d \
	--disable-rpath \
	--disable-sndio \
	--disable-sse \
	--disable-video-cocoa \
	--disable-video-directfb \
	--disable-video-dummy \
	--disable-video-kmsdrm \
	--disable-video-metal \
	--disable-video-offscreen \
	--disable-video-opengl \
	--disable-video-opengles \
	--disable-video-opengles1 \
	--disable-video-opengles2 \
	--disable-video-rpi \
	--disable-video-vivante \
	--disable-video-vulkan \
	--disable-video-wayland \
	--disable-video-x11 \
	--disable-video-x11-scrnsaver \
	--disable-video-x11-xcursor \
	--disable-video-x11-xinput \
	--disable-video-x11-xrandr \
	--disable-wasapi \
	--disable-xinput \
	--$(if $(CONFIG_LIBSDL2_ALSA),en,dis)able-alsa \
	--$(if $(CONFIG_LIBSDL2_DBUS),en,dis)able-dbus \
	--$(if $(CONFIG_LIBSDL2_UDEV),en,dis)able-libudev \
	--enable-static \
	--without-x

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/bin $(2)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sdl2-config $(1)/opt/bin
	$(SED) 's,^\(prefix\|exec_prefix\)=.*,\1=$(STAGING_DIR)/opt,g' \
		$(1)/opt/bin/sdl2-config
	$(LN) ../../opt/bin/sdl2-config $(2)/bin/sdl2-config

	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/SDL2 $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2*.{a,so*} $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/sdl2.pc $(1)/opt/lib/pkgconfig

	$(INSTALL_DIR) $(2)/share/aclocal/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/share/aclocal/* $(2)/share/aclocal
endef

define Package/libsdl2/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2*.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libsdl2))
