# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool-latest
PKG_VERSION:=1.8.0
PKG_RELEASE:=1

PKG_SOURCE:=rrdtool-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/oetiker/rrdtool-1.x/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=88a59a645161d0cfd1af898459fc033af975816278cf132cc66bf0dd8d0559cc

PKG_BUILD_DIR:=$(BUILD_DIR)/rrdtool-1.x-$(PKG_VERSION)

LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYRIGHT LICENSE

#PKG_FIXUP:=autoreconf gettext-version
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/rrdtool-latest/Default
  SUBMENU:=Database
  TITLE:=Round Robin Database (RRD)
  URL:=http://oss.oetiker.ch/rrdtool/
endef

define Package/librrd-latest
  $(call Package/rrdtool-latest/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= management library (v$(PKG_VERSION))
  DEPENDS:=+libpango +libxml2
  PROVIDES:=librrd1 librrd
endef

define Package/rrdcgi-latest
  $(call Package/rrdtool-latest/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= CGI graphing tool (v$(PKG_VERSION))
  DEPENDS:=+librrd-latest
  PROVIDES:=rrdcgi1 rrdcgi
endef

define Package/rrdtool-latest
  $(call Package/rrdtool-latest/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= management tools (v$(PKG_VERSION))
  DEPENDS:=+librrd-latest
  PROVIDES:=rrdtool1 rrdtool
endef

TARGET_LDFLAGS += $(if $(INTL_FULL),-lintl)

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
	--disable-tcl \
	--enable-nls

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/usr/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/rrd{,_client,_format}.h \
		$(1)/opt/usr/include/

	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.{a,so*} \
		$(1)/opt/usr/lib/

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/librrd.pc \
		$(1)/opt/usr/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/usr/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/usr/lib,' \
			$(1)/opt/usr/lib/pkgconfig/librrd.pc
endef

define Package/librrd-latest/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librrd.so* $(1)/opt/lib/
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
