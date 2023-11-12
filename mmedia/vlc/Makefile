# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=vlc
PKG_VERSION:=3.0.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:= \
	https://get.videolan.org/vlc/$(PKG_VERSION) \
	https://mirrors.netix.net/vlc/vlc/$(PKG_VERSION)
PKG_HASH:=adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5

PKG_LICENSE:=GPL-2.0-or-later LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING COPYING.LIB
PKG_CPE_ID:=cpe:/a:videolan:vlc_media_player

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_BUILD_PATENTED \
	CONFIG_VLC_ALSA_LIB \
	CONFIG_VLC_DBUS \
	CONFIG_VLC_FAAD \
	$(if $(CONFIG_VLC_FFMPEG), \
	CONFIG_VLC_FFMPEG_AVCODEC \
	CONFIG_VLC_FFMPEG_AVFORMAT \
	CONFIG_VLC_FFMPEG_POSTPROC \
	CONFIG_VLC_FFMPEG_SWSCALE) \
	CONFIG_VLC_FLAC \
	CONFIG_VLC_FONTCONFIG \
	CONFIG_VLC_FREETYPE \
	CONFIG_VLC_FRIBIDI \
	CONFIG_VLC_GNUTLS \
	CONFIG_VLC_GST1_PLUGINS_BASE \
	CONFIG_VLC_HARFBUZZ \
	CONFIG_VLC_LIBARCHIVE \
	CONFIG_VLC_LIBASS \
	CONFIG_VLC_LIBAVAHI_CLIENT \
	CONFIG_VLC_LIBGCRYPT \
	CONFIG_VLC_LIBJPEG \
	CONFIG_VLC_LIBMAD \
	CONFIG_VLC_LIBMATROSKA \
	CONFIG_VLC_LIBMPEG2 \
	CONFIG_VLC_LIBNFS \
	CONFIG_VLC_LIBOGG \
	CONFIG_VLC_LIBPNG \
	CONFIG_VLC_LIBSAMPLERATE \
	CONFIG_VLC_LIBSOXR \
	CONFIG_VLC_LIBSSH2 \
	CONFIG_VLC_LIBTHEORA \
	CONFIG_VLC_LIBUPNP \
	CONFIG_VLC_LIBV4L \
	CONFIG_VLC_LIBVORBIS \
	CONFIG_VLC_LIBVPX \
	CONFIG_VLC_LIBXML2 \
	CONFIG_VLC_LIVE555 \
	CONFIG_VLC_LUA \
	CONFIG_VLC_MPG123 \
	CONFIG_VLC_MUSEPACK \
	CONFIG_VLC_NCURSES \
	CONFIG_VLC_OGGSPOTS \
	CONFIG_VLC_OPUS \
	CONFIG_VLC_PULSEAUDIO \
	CONFIG_VLC_SAMBA4 \
	CONFIG_VLC_SNDIO \
	CONFIG_VLC_SPEEX \
	CONFIG_VLC_TAGLIB \
	CONFIG_VLC_TREMOR \
	CONFIG_VLC_UDEV \
	CONFIG_VLC_X264 \
	CONFIG_VLC_X26410b

PKG_BUILD_DEPENDS:=libmatroska lua/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/vlc/Default
  TITLE:=VLC media player
  URL:=https://www.videolan.org/
endef

define Package/libvlc
$(call Package/vlc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (LibVLC control API)
  DEPENDS:=+libidn $(ICONV_DEPENDS) $(INTL_DEPENDS)
  DEPENDS+=+VLC_DBUS:libdbus
endef

define Package/libvlc/description
  VLC media player external control library.
endef

define Package/libvlc-plugins
$(call Package/vlc/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (VLC plugin API)
  DEPENDS:=+libstdcpp +libvlc +zlib @AUDIO_SUPPORT
  DEPENDS+=+VLC_ALSA_LIB:alsa-lib #access audio_output
  DEPENDS+=+VLC_HARFBUZZ:libharfbuzz #text_renderer
  DEPENDS+=+VLC_FAAD:libfaad2 #codec
  DEPENDS+=+VLC_FFMPEG_AVFORMAT:libffmpeg #codec video_chroma video_filter
  DEPENDS+=+VLC_FFMPEG_POSTPROC:libffmpeg #codec video_chroma video_filter
  DEPENDS+=+VLC_FLAC:libflac #codec
  DEPENDS+=+VLC_FONTCONFIG:fontconfig #text_renderer
  DEPENDS+=+VLC_FREETYPE:libfreetype #text_renderer
  DEPENDS+=+VLC_FRIBIDI:libfribidi #text_renderer
  DEPENDS+=+VLC_GNUTLS:libgnutls #misc
  DEPENDS+=+VLC_GST1_PLUGINS_BASE:libgst1app +VLC_GST1_PLUGINS_BASE:libgst1video #codec
  DEPENDS+=+VLC_LIBARCHIVE:libarchive #stream_extractor
  DEPENDS+=+VLC_LIBAVAHI_CLIENT:libavahi-client +VLC_LIBAVAHI_CLIENT:libavahi-dbus-support #services_discovery
  DEPENDS+=+VLC_LIBASS:libass #codec
  DEPENDS+=+VLC_LIBGCRYPT:libgcrypt #access{,_output} demux spu stream_out
  DEPENDS+=+VLC_LIBJPEG:libjpeg-turbo #codec
  DEPENDS+=+VLC_LIBMAD:libmad #audio_filter
  DEPENDS+=+VLC_LIBMPEG2:libmpeg2  #codec
  DEPENDS+=+VLC_LIBNFS:libnfs #access demux
  DEPENDS+=+VLC_LIBOGG:libogg #demux
  DEPENDS+=+VLC_LIBPNG:libpng #codec
  DEPENDS+=+VLC_LIBSAMPLERATE:libsamplerate  #audio_filter
  DEPENDS+=+VLC_LIBSOXR:libsoxr #audio_filter
  DEPENDS+=+VLC_LIBSSH2:libssh2 #access
  DEPENDS+=+VLC_LIBTHEORA:libtheora #codec
  DEPENDS+=+VLC_LIBUPNP:libupnp #services_discovery
  DEPENDS+=+VLC_LIBVORBIS:libvorbis #codec
  DEPENDS+=+VLC_LIBVPX:libvpx #codec
  DEPENDS+=+VLC_LIBXML2:libxml2 #misc
  DEPENDS+=+VLC_LIVE555:liblive555 #access
  DEPENDS+=+VLC_LUA:liblua #lua
  DEPENDS+=+VLC_MPG123:libmpg123 #codec
  DEPENDS+=+VLC_MUSEPACK:libmpcdec #demux
  DEPENDS+=+VLC_NCURSES:libncursesw #gui
  DEPENDS+=+VLC_OGGSPOTS:libogg #codec
  DEPENDS+=+VLC_OPUS:libopus #codec
  DEPENDS+=+VLC_PULSEAUDIO:pulseaudio-daemon #access audio_output services_discovery
  DEPENDS+=+VLC_SNDIO:libsndio #audio_output
  DEPENDS+=+VLC_SAMBA4:samba4-libs #access services_discovery
  DEPENDS+=+VLC_SPEEX:libspeex +VLC_SPEEX:libspeexdsp #audio_filter codec
  DEPENDS+=+VLC_TAGLIB:taglib #meta_engine
  DEPENDS+=+VLC_TREMOR:libvorbisidec #codec
  DEPENDS+=+VLC_UDEV:libudev-zero #services_discovery
# FIXME error: recursive dependency detected!
  ifeq ($(or $(CONFIG_VLC_X264),$(CONFIG_VLC_X26410b)),y)
    DEPENDS+=+libx264 #codec
  endif
  MENU:=1
endef

define Package/libvlc-plugins/description
  VLC media player plugin interface.
endef

define Package/vlc
$(call Package/vlc/Default)
  CATEGORY:=Multimedia
  SECTION:=multimedia
  DEPENDS:=+libvlc-plugins
endef

define Package/vlc/description
  VLC is a popular libre and open source media player and multimedia engine,
  used by a large number of individuals, professionals, companies and
  institutions.
endef

define Package/libvlc-plugins/config
source "$(SOURCE)/Config.in"
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(SED) 's/PKG_WITH_MODULES/VLC_PKG_WITH_MODULES/g' \
		-e 's/PKG_HAVE_WITH_MODULES/VLC_PKG_HAVE_WITH_MODULES/g' \
		$(PKG_BUILD_DIR)/configure.ac $(PKG_BUILD_DIR)/m4/with_pkg.m4
endef

ifneq ($(CONFIG_VLC_OPTIMIZE_SPEED),y)
CONFIGURE_ARGS += \
	--disable-optimizations
endif

CONFIGURE_ARGS += \
	--enable-optimize-memory \
	--enable-nls \
	--enable-realrtsp \
	--enable-run-as-root

CONFIGURE_ARGS += \
	--disable-a52 \
	--disable-addonmanagermodules \
	--disable-aom \
	--disable-aribb25 \
	--disable-aribsub \
	--disable-asdcp \
	--disable-bluray \
	--disable-bpg \
	--disable-caca \
	--disable-chromaprint \
	--disable-chromecast \
	--disable-crystalhd \
	--disable-dav1d \
	--disable-dc1394 \
	--disable-dca \
	--disable-decklink \
	--disable-dsm \
	--disable-dv1394 \
	--disable-dvbpsi \
	--disable-dvdnav \
	--disable-dvdread \
	--disable-fluidlite \
	--disable-fluidsynth \
	--disable-freerdp \
	--disable-gles2 \
	--disable-gme \
	--disable-goom \
	--disable-jack \
	--disable-kai \
	--disable-kate \
	--disable-kva \
	--disable-kwallet \
	--disable-libcddb \
	--disable-libplacebo \
	--disable-libva \
	--disable-linsys \
	--disable-mfx \
	--disable-microdns \
	--disable-mmal \
	--disable-mod \
	--disable-mtp \
	--disable-notify \
	--disable-opencv \
	--disable-projectm \
	--disable-qt \
	--disable-schroedinger \
	--disable-sdl-image \
	--disable-secret \
	--disable-shine \
	--disable-shout \
	--disable-sid \
	--disable-skins2 \
	--disable-spatialaudio \
	--disable-srt \
	--disable-svg \
	--disable-svgdec \
	--disable-telx \
	--disable-tiger \
	--disable-twolame \
	--disable-vdpau \
	--disable-vnc \
	--disable-vsxu \
	--disable-wasapi \
	--disable-wayland \
	--disable-x262 \
	--disable-x265 \
	--disable-xcb \
	--disable-zvbi \
	--enable-run-as-root \
	--without-x

CONFIGURE_ARGS += \
	--$(if $(CONFIG_VLC_ALSA_LIB),en,dis)able-alsa \
	--$(if $(CONFIG_VLC_DBUS),en,dis)able-dbus \
	--$(if $(CONFIG_VLC_FAAD),en,dis)able-faad \
	--$(if $(CONFIG_VLC_FFMPEG),en,dis)able-merge-ffmpeg \
	--$(if $(CONFIG_VLC_FFMPEG_AVCODEC),en,dis)able-avcodec \
	--$(if $(CONFIG_VLC_FFMPEG_AVFORMAT),en,dis)able-avformat \
	--$(if $(CONFIG_VLC_FFMPEG_POSTPROC),en,dis)able-postproc \
	--$(if $(CONFIG_VLC_FFMPEG_SWSCALE),en,dis)able-swscale \
	--$(if $(CONFIG_VLC_FLAC),en,dis)able-flac \
	--$(if $(CONFIG_VLC_FONTCONFIG),en,dis)able-fontconfig \
	--$(if $(CONFIG_VLC_FREETYPE),en,dis)able-freetype \
	--$(if $(CONFIG_VLC_FRIBIDI),en,dis)able-fribidi \
	--$(if $(CONFIG_VLC_GNUTLS),en,dis)able-gnutls \
	--$(if $(CONFIG_VLC_GST1_PLUGINS_BASE),en,dis)able-gst-decode \
	--$(if $(CONFIG_VLC_HARFBUZZ),en,dis)able-harfbuzz \
	--$(if $(CONFIG_VLC_LIBARCHIVE),en,dis)able-archive \
	--$(if $(CONFIG_VLC_LIBAVAHI_CLIENT),en,dis)able-avahi \
	--$(if $(CONFIG_VLC_LIBASS),en,dis)able-libass \
	--$(if $(CONFIG_VLC_LIBGCRYPT),en,dis)able-libgcrypt \
	--$(if $(CONFIG_VLC_LIBJPEG),en,dis)able-jpeg \
	--$(if $(CONFIG_VLC_LIBMAD),en,dis)able-mad \
	--$(if $(CONFIG_VLC_LIBMATROSKA),en,dis)able-matroska \
	--$(if $(CONFIG_VLC_LIBMPEG2),en,dis)able-libmpeg2 \
	--$(if $(CONFIG_VLC_LIBNFS),en,dis)able-nfs \
	--$(if $(CONFIG_VLC_LIBOGG),en,dis)able-ogg \
	--$(if $(CONFIG_VLC_LIBPNG),en,dis)able-png \
	--$(if $(CONFIG_VLC_LIBSAMPLERATE),en,dis)able-samplerate \
	--$(if $(CONFIG_VLC_LIBSOXR),en,dis)able-soxr \
	--$(if $(CONFIG_VLC_LIBSSH2),en,dis)able-sftp \
	--$(if $(CONFIG_VLC_LIBTHEORA),en,dis)able-theora \
	--$(if $(CONFIG_VLC_LIBUPNP),en,dis)able-upnp \
	--$(if $(CONFIG_VLC_LIBV4L),en,dis)able-v4l2 \
	--$(if $(CONFIG_VLC_LIBVORBIS),en,dis)able-vorbis \
	--$(if $(CONFIG_VLC_LIBVPX),en,dis)able-vpx \
	--$(if $(CONFIG_VLC_LIBXML2),en,dis)able-libxml2 \
	--$(if $(CONFIG_VLC_LIVE555),en,dis)able-live555 \
	--$(if $(CONFIG_VLC_LUA),en,dis)able-lua \
	--$(if $(CONFIG_VLC_MPG123),en,dis)able-mpg123 \
	--$(if $(CONFIG_VLC_MUSEPACK),en,dis)able-mpc \
	--$(if $(CONFIG_VLC_NCURSES),en,dis)able-ncurses \
	--$(if $(CONFIG_VLC_OGGSPOTS),en,dis)able-oggspots \
	--$(if $(CONFIG_VLC_OPUS),en,dis)able-opus \
	--$(if $(CONFIG_VLC_PULSEAUDIO),en,dis)able-pulse \
	--$(if $(CONFIG_VLC_SAMBA4),en,dis)able-smbclient \
	--$(if $(CONFIG_VLC_SNDIO),en,dis)able-sndio \
	--$(if $(CONFIG_VLC_SPEEX),en,dis)able-speex \
	--$(if $(CONFIG_VLC_TAGLIB),en,dis)able-taglib \
	--$(if $(CONFIG_VLC_TREMOR),en,dis)able-tremor \
	--$(if $(CONFIG_VLC_UDEV),en,dis)able-udev \
	--$(if $(CONFIG_VLC_X264),en,dis)able-x264 \
	--$(if $(CONFIG_VLC_X26410b),en,dis)able-x26410b

ifeq ($(CONFIG_VLC_LIBMATROSKA),y)
CONFIGURE_VARS += \
	MATROSKA_LIBS="-L$(STAGING_DIR)/opt/lib -lmatroska -lebml"
endif

ifeq ($(CONFIG_VLC_SAMBA4),y)
ADD_PKG_CONFIG_PATH=$(STAGING_DIR)/opt/usr/lib/pkgconfig

CONFIGURE_ARGS += \
	PKG_CONFIG_PATH="$(ADD_PKG_CONFIG_PATH):$$$$PKG_CONFIG_PATH"
endif

CONFIGURE_VARS += \
	have_minizip="no" \
	have_systemd="no"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/vlc $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libvlc{,core}.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/libvlc.pc $(1)/opt/lib/pkgconfig
endef

define Package/libvlc/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libvlc{,core}.so* $(1)/opt/lib
endef

define Package/libvlc-plugins/install
	$(INSTALL_DIR) $(1)/opt/lib/vlc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/lib/vlc/vlc-cache-gen $(1)/opt/lib/vlc
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/vlc/plugins $(1)/opt/lib/vlc
  ifeq ($(CONFIG_VLC_PULSEAUDIO),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/vlc/libvlc_pulse.so* $(1)/opt/lib/vlc
  endif
  ifeq ($(CONFIG_VLC_LUA),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/vlc/lua $(1)/opt/lib/vlc
	$(INSTALL_DIR) $(1)/opt/share/vlc
	$(CP) $(PKG_INSTALL_DIR)/opt/share/vlc/lua $(1)/opt/share/vlc
  endif
	$(FIND) $(1)/opt/lib/vlc -type f -a -name '*.la' -delete
endef

define Package/vlc/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/{,c,r}vlc $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/vlc-wrapper $(1)/opt/bin
  ifeq ($(CONFIG_VLC_NCURSES),y)
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nvlc $(1)/opt/bin
  endif
endef

# gen plugin.dat
define Package/libvlc-plugins/postinst
#!/bin/sh

echo -e "\n\tGenerating the LibVLC plugins cache...\n"
/opt/lib/vlc/vlc-cache-gen /opt/lib/vlc/plugins
endef

$(eval $(call BuildPackage,libvlc))
$(eval $(call BuildPackage,libvlc-plugins))
$(eval $(call BuildPackage,vlc))
