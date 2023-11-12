# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sndio
PKG_VERSION:=1.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://sndio.org/
PKG_HASH:=f30826fc9c07e369d3924d5fcedf6a0a53c0df4ae1f5ab50fe9cf280540f699a

PKG_LICENSE:=ISCL
PKG_LICENSE_FILES:=

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sndio/Default
  TITLE:=An audio and MIDI framework
  URL:=https://sndio.com/
endef

define Package/libsndio
  $(call Package/sndio/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+alsa-lib
endef

define Package/sndio
  $(call Package/sndio/Default)
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libsndio
endef

define Package/sndio/description
  Sndio is a small audio and MIDI framework part of the OpenBSD
  project and ported to FreeBSD, Linux and NetBSD.
endef

Package/libsndio/description=$(call Package/sndio/description)

CONFIGURE_ARGS:=$(filter-out		\
	--disable-dependency-tracking	\
	--target=%			\
	--host=%			\
	--build=%			\
	--program-prefix=%		\
	--program-suffix=% 		\
	--sbindir=%			\
	--libexecdir=%			\
	--sysconfdir=%			\
	--localstatedir=%		\
	--infodir=%			\
	,$(CONFIGURE_ARGS))

CONFIGURE_ARGS += \
	--privsep-user=nobody

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt//include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/sndio.h $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsndio.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/sndio.pc $(1)/opt/lib/pkgconfig
endef

define Package/libsndio/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsndio.so* $(1)/opt/lib
endef

define Package/sndio/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/{au,midi}cat $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sndio{ctl,d} $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99sndiod $(1)/opt/etc/init.d
endef

$(eval $(call BuildPackage,libsndio))
$(eval $(call BuildPackage,sndio))
