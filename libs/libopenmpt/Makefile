# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libopenmpt
PKG_VERSION:=0.6.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)+release.autotools.tar.gz
PKG_SOURCE_URL:=https://lib.openmpt.org/files/libopenmpt/src/
PKG_HASH:=479e975abb7dc0fa9cad41bdd31f255d78d43e0726546208058d3c3fcf7b6e5a

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_LIBOPENMPT_MPG123 \
	CONFIG_LIBOPENMPT_OGG \
	CONFIG_LIBOPENMPT_VORBIS \
	CONFIG_LIBOPENMPT_VORBISFILE \
	CONFIG_LIBOPENMPT_ZLIB \
	CONFIG_LIBOPENMPT_OPENMPT123 \
	CONFIG_OPENMPT123_FLAC \
	CONFIG_OPENMPT123_PORTAUDIO \
	CONFIG_OPENMPT123_PULSEAUDIO \
	CONFIG_OPENMPT123_SNDFILE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/libopenmpt
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=a cross-platform C++ and C library
  URL:=https://lib.openmpt.org/libopenmpt/
  DEPENDS:=+libstdcpp
  DEPENDS+= \
	+LIBOPENMPT_MPG123:libmpg123 \
	+LIBOPENMPT_OGG:libogg \
	+(LIBOPENMPT_VORBIS||LIBOPENMPT_VORBISFILE):libvorbis \
	+LIBOPENMPT_ZLIB:zlib
  MENU:=1
endef

define Package/libopenmpt/description
  libopenmpt is a cross-platform C++ and C library to decode
  tracked music files (modules) into a raw PCM audio stream.
endef

define Package/libopenmpt/config
  source "$(SOURCE)/Config.in"
endef

define Package/openmpt123
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=command line player
  URL:=https://lib.openmpt.org/libopenmpt/
  DEPENDS:=+alsa-lib +libopenmpt +libstdcpp
  DEPENDS+= \
	+OPENMPT123_FLAC:libflac \
	+OPENMPT123_SNDFILE:libsndfile \
	+OPENMPT123_PORTAUDIO:portaudio \
	+OPENMPT123_PULSEAUDIO:pulseaudio-daemon
  MENU:=1
endef

define Package/openmpt123/description
  openmpt123 command line player.
endef

define Package/openmpt123/config
  source "$(SOURCE)/Config-player.in"
endef

PULSE_LIBS:= \
	"-L$(STAGING_DIR)/opt/lib -lpulse -lpulse-simple \
	-L$(STAGING_DIR)/opt/lib/pulseaudio -lpulsecommon-14.2"

TARGET_CXXFLAGS += -std=c++17

CONFIGURE_ARGS += \
	--disable-doxygen-doc \
	--disable-doxygen-html \
	--disable-examples \
	--$(if $(CONFIG_LIBOPENMPT_OPENMPT123),en,dis)able-openmpt123 \
	--disable-tests \
	--with$(if $(CONFIG_OPENMPT123_FLAC),,out)-flac \
	--with$(if $(CONFIG_LIBOPENMPT_MPG123),,out)-mpg123 \
	--with$(if $(CONFIG_LIBOPENMPT_OGG),,out)-ogg \
	--with$(if $(CONFIG_OPENMPT123_PORTAUDIO),,out)-portaudio \
	--without-portaudiocpp \
	--with$(if $(CONFIG_OPENMPT123_PULSEAUDIO),,out)-pulseaudio \
	--with$(if $(CONFIG_OPENMPT123_SNDFILE),,out)-sndfile  \
	--with$(if $(CONFIG_LIBOPENMPT_VORBIS),,out)-vorbis \
	--with$(if $(CONFIG_LIBOPENMPT_VORBISFILE),,out)-vorbisfile \
	--with$(if $(CONFIG_LIBOPENMPT_ZLIB),,out)-zlib

ifeq ($(CONFIG_OPENMPT123_PULSEAUDIO),y)
CONFIGURE_ARGS += \
	PULSEAUDIO_LIBS=$(PULSE_LIBS)
endif

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/libopenmpt $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopenmpt.{a,so*} $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/libopenmpt.pc \
		$(1)/opt/lib/pkgconfig
endef

define Package/libopenmpt/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopenmpt.so.* $(1)/opt/lib
endef

ifeq ($(CONFIG_LIBOPENMPT_OPENMPT123),y)
  define Package/openmpt123/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/openmpt123 $(1)/opt/bin
  endef
endif

$(eval $(call BuildPackage,libopenmpt))
$(eval $(call BuildPackage,openmpt123))
