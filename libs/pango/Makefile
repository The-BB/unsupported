# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.50.11
PKG_RELEASE:=1

PANGO_MAJOR_VER:=$(word 1,$(subst ., ,$(PKG_VERSION))).$(word 2,$(subst ., ,$(PKG_VERSION)))

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://download.gnome.org/sources/pango/$(PANGO_MAJOR_VER)/
PKG_HASH:=8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae

PKG_LICENSE:=LGPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DEPENDS:=glib2/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libpango
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Internationalized text layout and rendering
  URL:=http://www.pango.org/
  DEPENDS:=+libfribidi +libharfbuzz
endef

define Package/libpango/description
  Pango is a library for laying out and rendering of text, with an emphasis
  on internationalization.
endef

MESON_ARGS += \
	-Dintrospection=disabled \
	-Dlibthai=disabled \
	-Dxft=disabled

define Build/Prepare
	$(Build/Prepare/Default)
	rm -rf $(PKG_BUILD_DIR)/subprojects/*.wrap
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/pango-1.0/pango
	$(CP) $(PKG_INSTALL_DIR)/opt/include/pango-1.0/pango/*.h \
		 $(1)/opt/include/pango-1.0/pango/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango*.so* \
		$(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/pango*.pc \
		$(1)/opt/lib/pkgconfig/
endef

define Package/libpango/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libpango*.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libpango))
