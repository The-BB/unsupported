# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=geoip
PKG_VERSION:=1.6.12
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://http.debian.net/debian/pool/main/g/geoip
PKG_HASH:=99b119f8e21e94f1dfd6d49fbeed29a70df1544896e76cd456f25e397b07d476

PKG_LICENSE:=LGPL-2.1-only

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=$(TAR) -C $(PKG_BUILD_DIR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1

define Package/geoip
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Database
  TITLE:=tools and libs that use the GeoIP
  URL:=http://www.maxmind.com/
endef

define Package/geoip/description
  GeoIP is a C library and command line tools that enables the user to find
  the country that any IP address or hostname originates from.
endef

BASE_FILE1:=GeoIP.dat.gz
define Download/geoip_dat
  FILE:=$(BASE_FILE1)
  URL_FILE:=$(BASE_FILE1)
  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
  HASH:=025e516ec14a8a705fb479880ffce43f9fdb8869666d522c38c791069f4b0acf
endef
$(eval $(call Download,geoip_dat))

#BASE_FILE2:=GeoLiteCity.dat.xz
#define Download/geolitecity_dat
#  FILE:=$(BASE_FILE2)
#  URL_FILE:=$(BASE_FILE2)
#  URL:=https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database
#  HASH:=2b71217ae18ecdbb521c49624c0d1320d971b33bd312127406605a0677b570d3
#endef
#$(eval $(call Download,geolitecity_dat))

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/usr/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/usr/include/

	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libGeoIP.{a,so*} $(1)/opt/usr/lib/

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/geoip.pc $(1)/opt/usr/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/usr/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/usr/lib,' \
			$(1)/opt/usr/lib/pkgconfig/geoip.pc
endef

define Package/geoip/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/geoiplookup{,6} $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so.* $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/share/GeoIP
	# unpack db
	$(CP) $(DL_DIR)/$(BASE_FILE1) $(1)/opt/share/GeoIP
	cd $(1)/opt/share/GeoIP && gzip -d $(BASE_FILE1)
#	$(CP) $(DL_DIR)/$(BASE_FILE2) $(1)/opt/share/GeoIP
#	cd $(1)/opt/share/GeoIP && xz --decompress $(BASE_FILE2)
endef

$(eval $(call BuildPackage,geoip))
