# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.17.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://cairographics.org/snapshots
PKG_HASH:=5b10c8892d1b58d70d3f0ba5b47863a061262fa56b9dc7944161f8c8b783bc64

PKG_LICENSE:=LGPL-2.1-only MPL-1.1
PKG_LICENSE_FILES:=COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1

PKG_CONFIG_DEPENDS:= \
	CONFIG_CAIRO_FONTCONFIG \
	CONFIG_CAIRO_FREETYPE \
	CONFIG_CAIRO_GLIB2 \
	CONFIG_CAIRO_PNG

PKG_BUILD_DEPENDS:=glib2/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libcairo
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cairo library
  URL:=https://www.cairographics.org/
  DEPENDS:= \
	+pixman \
	+CAIRO_FONTCONFIG:fontconfig \
	+CAIRO_FREETYPE:libfreetype \
	+CAIRO_GLIB2:glib2 \
	+CAIRO_PNG:libpng
  MENU:=1
endef

define Package/libcairo/description
  Cairo is a 2D graphics library with support for multiple output devices.
endef

define Package/libcairo/config
  source "$(SOURCE)/Config.in"
endef

MESON_ARGS += \
	-Db_lto=true \
	-Ddwrite=disabled \
	-Dfontconfig=$(if $(CONFIG_CAIRO_FONTCONFIG),en,dis)abled \
	-Dfreetype=$(if $(CONFIG_CAIRO_FREETYPE),en,dis)abled \
	-Dglib=$(if $(CONFIG_CAIRO_GLIB2),en,dis)abled \
	-Dpng=$(if $(CONFIG_CAIRO_PNG),en,dis)abled \
	-Dtests=disabled \
	-Dxcb=disabled \
	-Dxlib=disabled \
	-Dzlib=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/include/cairo/*.h 	$(1)/opt/include/cairo/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo.so* $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo.pc \
		$(1)/opt/lib/pkgconfig/

  ifeq ($(CONFIG_CAIRO_FONTCONFIG),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo-fc.pc \
		$(1)/opt/lib/pkgconfig
  endif
  ifeq ($(CONFIG_CAIRO_FREETYPE),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo-ft.pc \
		$(1)/opt/lib/pkgconfig
  endif
  ifeq ($(CONFIG_CAIRO_GLIB2),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo-gobject.so* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo-gobject.pc \
		$(1)/opt/lib/pkgconfig
  endif
  ifeq ($(CONFIG_CAIRO_PNG),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/cairo-{png,svg}.pc \
		$(1)/opt/lib/pkgconfig
  endif
endef

define Package/libcairo/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo.so* $(1)/opt/lib
  ifeq ($(CONFIG_CAIRO_GLIB2),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo-gobject.so* $(1)/opt/lib
  endif
endef

$(eval $(call BuildPackage,libcairo))
