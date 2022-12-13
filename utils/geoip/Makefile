# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=geoip
PKG_VERSION:=1.6.12
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=@DEBIAN/pool/main/g/geoip
PKG_HASH:=99b119f8e21e94f1dfd6d49fbeed29a70df1544896e76cd456f25e397b07d476

PKG_LICENSE:=LGPL-2.1-only
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=$(TAR) -C $(PKG_BUILD_DIR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1

define Package/geoip/Default
  SUBMENU:=Database
  TITLE:=tools and libs that use the GeoIP
  URL:=http://www.maxmind.com/
endef

define Package/libgeoip
  $(call Package/geoip/Default)
  SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/geoip
  $(call Package/geoip/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libgeoip
  MENU:=1
endef

define Package/geoip/description
  GeoIP is a C library and command line tools that enables the user to find
  the country that any IP address or hostname originates from.
endef

Package/libgeoip/description=$(Package/geoip/description)

define Package/geoip/config
  source "$(SOURCE)/Config.in"
endef

GEOIP:=GeoIP.dat.gz
define Download/geoip
  FILE:=$(GEOIP)
  URL_FILE:=$(GEOIP)
  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
  HASH:=025e516ec14a8a705fb479880ffce43f9fdb8869666d522c38c791069f4b0acf
endef

$(eval $(call Download,geoip))

GEOIPV6:=GeoIPv6.dat.gz
define Download/geoipv6
  FILE:=$(GEOIPV6)
  URL_FILE:=$(GEOIPV6)
  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
  HASH:=4538364e5e97c8b23e15427e381a5a814134153f6de96cfcce4e7f0d1732164f
endef

$(eval $(call Download,geoipv6))

GEOLITECITY:=GeoLiteCity.dat.xz
define Download/geolitecity
  FILE:=$(GEOLITECITY)
  URL_FILE:=$(GEOLITECITY)
  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
  HASH:=2b71217ae18ecdbb521c49624c0d1320d971b33bd312127406605a0677b570d3
endef

$(eval $(call Download,geolitecity))

GEOLITECITYV6:=GeoLiteCityv6.dat.gz
define Download/geolitecityv6
  FILE:=$(GEOLITECITYV6)
  URL_FILE:=$(GEOLITECITYV6)
  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
  HASH:=54745e189726fd79761b2fe22197221cdf5d501b81214343b990405a726a852d
endef

$(eval $(call Download,geolitecityv6))

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/usr/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/usr/include/

	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libGeoIP.{a,so*} $(1)/opt/usr/lib/

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/geoip.pc $(1)/opt/usr/lib/pkgconfig/

	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/usr/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/usr/lib,' \
			$(1)/opt/usr/lib/pkgconfig/geoip.pc
endef

define Package/libgeoip/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so.* $(1)/opt/lib/
endef

define Package/geoip/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/geoiplookup{,6} $(1)/opt/bin
  ifeq ($(CONFIG_GEOIP_GEOIP),y)
	$(INSTALL_DIR) $(1)/opt/share/GeoIP
	gzip -dc $(DL_DIR)/$(GEOIP) > $(1)/opt/share/GeoIP/GeoIP.dat
  endif
  ifeq ($(CONFIG_GEOIP_GEOIPV6),y)
	$(INSTALL_DIR) $(1)/opt/share/GeoIP
	gzip -dc $(DL_DIR)/$(GEOIPV6) > $(1)/opt/share/GeoIP/GeoIPv6.dat
  endif
  ifeq ($(CONFIG_GEOIP_GEOLITECITY),y)
	$(INSTALL_DIR) $(1)/opt/share/GeoIP
	xzcat -dc $(DL_DIR)/$(GEOLITECITY) > $(1)/opt/share/GeoIP/GeoLiteCity.dat
  endif
  ifeq ($(CONFIG_GEOIP_GEOLITECITYV6),y)
	$(INSTALL_DIR) $(1)/opt/share/GeoIP
	gzip -dc $(DL_DIR)/$(GEOLITECITYV6) > $(1)/opt/share/GeoIP/GeoLiteCityv6.dat
  endif
endef

$(eval $(call BuildPackage,libgeoip))
$(eval $(call BuildPackage,geoip))
