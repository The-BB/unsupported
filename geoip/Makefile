#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#FIXME postinstall

include $(TOPDIR)/rules.mk

PKG_NAME:=geoip
PKG_VERSION:=1.6.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://http.debian.net/debian/pool/main/g/geoip
PKG_HASH:=99b119f8e21e94f1dfd6d49fbeed29a70df1544896e76cd456f25e397b07d476

PKG_UNPACK=$(TAR) -C $(PKG_BUILD_DIR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/geoip
  SUBMENU:=database
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=tools and libs that use the GeoIP
  URL:=http://www.maxmind.com/
endef

define Package/geoip/description
  GeoIP is a C library and command line tools that enables the user to find \
the country that any IP address or hostname originates from.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/{include,lib}
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libGeoIP.{a,so*} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/geoip.pc $(1)/opt/lib/pkgconfig/
endef

define Package/geoip/install
	$(INSTALL_DIR) $(1)/opt/{bin,lib,share/GeoIP}
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/geoiplookup{,6} $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib/
endef

define Package/geoip/postinst
#!/bin/sh

echo "e.g. download and install GeoIP Country database"
echo "if you need another, uncomment and rerun postinst"

cd /opt/share/GeoIP

if [ ! -f /opt/share/GeoIP/GeoIP.dat ]; then
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gzip -d GeoIP.dat.gz
fi

#if [ ! -f /opt/share/GeoIP/GeoIPv6.dat ]; then
#wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
#gzip -d GeoIPv6.dat.gz
#fi

#if [ ! -f /opt/share/GeoIP/GeoLiteCity.dat ]; then
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
#gzip -d GeoLiteCity.dat.gz
#fi

#if [ ! -f /opt/share/GeoIP/GeoLiteCityv6.dat ]; then
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz
#gzip -d GeoLiteCityv6.dat.gz
#fi

#if [ ! -f /opt/share/GeoIP/GeoIPASNum.dat ]; then
#wget http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz
#gzip -d GeoIPASNum.dat.gz
#fi

#if [ ! -f /opt/share/GeoIP/GeoIPASNumv6.dat ]; then
#wget http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz
#gzip -d GeoIPASNumv6.dat.gz
#fi

exit 0
endef

$(eval $(call BuildPackage,geoip))
