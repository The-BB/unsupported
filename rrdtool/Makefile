#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://oss.oetiker.ch/rrdtool/pub
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=cd948e89cd2d8825fab4a6fb0323f810948d934af7d92c9ee8b5e9e1350e52d7

LICENSE:=GPL-2.0+

#PKG_FIXUP:=autoreconf

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/rrdtool/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Round Robin Database (RRD)
  URL:=http://oss.oetiker.ch/rrdtool/
  DEPENDS:=+pango +cairo +libxml2 +glib2 +libpthread +libpcre $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/librrd
$(call Package/rrdtool/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= management library (1.7.x)
endef

define Package/rrdcgi
$(call Package/rrdtool/Default)
  TITLE+= CGI graphing tool (1.7.x)
  DEPENDS+= +librrd
endef

define Package/rrdtool
$(call Package/rrdtool/Default)
  TITLE+= management tools (1.7.x)
  DEPENDS+= +librrd
endef

CONFIGURE_ARGS += \
	--disable-nls \
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
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/rrd*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.{a,so*} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/librrd.pc $(1)/opt/lib/pkgconfig/
endef

define Package/librrd/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.so* $(1)/opt/lib/
endef

define Package/rrdcgi/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rrdcgi $(1)/opt/bin
endef

define Package/rrdtool/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rrd{cached,tool,update} $(1)/opt/bin
	(cd $(1)/opt/bin; \
		ln -fs rrdupdate rrdcreate ; \
		ln -fs rrdupdate rrdinfo ; \
	);
endef

$(eval $(call BuildPackage,librrd))
$(eval $(call BuildPackage,rrdcgi))
$(eval $(call BuildPackage,rrdtool))
