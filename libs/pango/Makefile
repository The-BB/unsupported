# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.52.2
PKG_RELEASE:=1

PANGO_MAJOR_VER:=$(word 1,$(subst ., ,$(PKG_VERSION))).$(word 2,$(subst ., ,$(PKG_VERSION)))

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://download.gnome.org/sources/pango/$(PANGO_MAJOR_VER)/
PKG_HASH:=d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b

PKG_LICENSE:=LGPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DEPENDS:=glib2/host

PKG_CONFIG_DEPENDS:=\
	CONFIG_PANGO_CAIRO

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libpango
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Internationalized text handling
  URL:=http://www.pango.org/
  DEPENDS:= \
	+fontconfig +glib2 +libfreetype +libfribidi +libharfbuzz \
	+PANGO_CAIRO:libcairo
  MENU:=1
endef

define Package/libpango/description
  Pango is a library for laying out and rendering of text, with an emphasis
  on internationalization.
endef

define Package/libpango/config
  source "$(SOURCE)/Config.in"
endef

MESON_ARGS += \
	-Db_lto=true \
	-Dcairo=$(if $(CONFIG_PANGO_CAIRO),en,dis)abled \
	-Dintrospection=disabled \
	-Dlibthai=disabled \
	-Dxft=disabled

define Build/Prepare
	$(Build/Prepare/Default)
	rm -rf $(PKG_BUILD_DIR)/subprojects/*.wrap
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/pango-1.0 $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango{,ft2}-1.0.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/pango{,fc,ft2,ot}.pc \
		$(1)/opt/lib/pkgconfig/
  ifeq ($(CONFIG_PANGO_CAIRO),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpangocairo-1.0.so* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/pangocairo.pc \
		 $(1)/opt/lib/pkgconfig
  endif
endef

define Package/libpango/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango{,ft2}-1.0.so* $(1)/opt/lib/
  ifeq ($(CONFIG_PANGO_CAIRO),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpangocairo-1.0.so* $(1)/opt/lib
  endif
endef

$(eval $(call BuildPackage,libpango))
