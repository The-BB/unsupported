#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool-latest
PKG_VERSION:=1.7.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://oss.oetiker.ch/rrdtool/pub
PKG_SOURCE:=rrdtool-$(PKG_VERSION).tar.gz
PKG_HASH:=cd948e89cd2d8825fab4a6fb0323f810948d934af7d92c9ee8b5e9e1350e52d7

PKG_BUILD_DIR:=$(BUILD_DIR)/rrdtool-$(PKG_VERSION)

LICENSE:=GPL-2.0-or-later

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/rrdtool-latest/Default
  CATEGORY:=Utilities
  SECTION:=utils
  TITLE:=Round Robin Database (RRD)
  URL:=http://oss.oetiker.ch/rrdtool/
  DEPENDS:=+libpango +libxml2 +libpcre $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/librrd-latest
$(call Package/rrdtool-latest/Default)
  CATEGORY:=Libraries
  SECTION:=libs
  TITLE+= management library (v$(PKG_VERSION))
endef

define Package/rrdcgi-latest
$(call Package/rrdtool-latest/Default)
  SUBMENU:=Database
  TITLE+= CGI graphing tool (v$(PKG_VERSION))
  DEPENDS+= +librrd-latest
endef

define Package/rrdtool-latest
$(call Package/rrdtool-latest/Default)
  SUBMENU:=Database
  TITLE+= management tools (v$(PKG_VERSION))
  DEPENDS+= +librrd-latest
endef

CONFIGURE_ARGS += \
	--disable-docs \
	--disable-examples \
	--disable-libdbi \
	--disable-librados \
	--disable-libwrap \
	--disable-lua \
	--disable-perl \
	--disable-python \
	--disable-ruby \
	--disable-tcl

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/tmp/rrdtool-$(PKG_VERSION)/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/rrd{,_client,_format}.h \
		$(1)/opt/tmp/rrdtool-$(PKG_VERSION)/include/

	$(INSTALL_DIR) $(1)/opt/tmp/rrdtool-$(PKG_VERSION)/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.{a,so*} \
		$(1)/opt/tmp/rrdtool-$(PKG_VERSION)/lib/

	$(INSTALL_DIR) $(1)/opt/tmp/rrdtool-$(PKG_VERSION)/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/librrd.pc \
		$(1)/opt/tmp/rrdtool-$(PKG_VERSION)/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/tmp/rrdtool-$(PKG_VERSION)/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/tmp/rrdtool-$(PKG_VERSION)/lib,' \
			$(1)/opt/tmp/rrdtool-$(PKG_VERSION)/lib/pkgconfig/librrd.pc
endef

define Package/librrd-latest/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.so.* $(1)/opt/lib/
endef

define Package/rrdcgi-latest/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rrdcgi $(1)/opt/bin
endef

define Package/rrdtool-latest/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rrd{cached,tool,update} $(1)/opt/bin
	$(LN) rrdupdate $(1)/opt/bin/rrdcreate
	$(LN) rrdupdate $(1)/opt/bin/rrdinfo
endef

$(eval $(call BuildPackage,librrd-latest))
$(eval $(call BuildPackage,rrdcgi-latest))
$(eval $(call BuildPackage,rrdtool-latest))
