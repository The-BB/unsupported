# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=harfbuzz
PKG_VERSION:=8.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/harfbuzz/harfbuzz/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=9f1ca089813b05944ad1ce8c7e018213026d35dc9bab480a21eb876838396556

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_CONFIG_DEPENDS:= \
	CONFIG_HARFBUZZ_CAIRO \
	CONFIG_HARFBUZZ_FREETYPE \
	CONFIG_HARFBUZZ_GLIB2 \
	CONFIG_HARFBUZZ_ICU

PKG_BUILD_DEPENDS:=glib2/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libharfbuzz
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=HarfBuzz text shaping library
  URL:=https://www.freedesktop.org/wiki/Software/HarfBuzz/
  DEPENDS:= \
	$(INTL_DEPENDS) \
	+HARFBUZZ_CAIRO:libcairo \
	+HARFBUZZ_FREETYPE:libfreetype \
	+HARFBUZZ_GLIB2:glib2 \
	+HARFBUZZ_ICU:icu
  MENU:=1
endef

define Package/libharfbuzz/description
  HarfBuzz is an OpenType text shaping engine.
endef

define Package/libharfbuzz/config
  source "$(SOURCE)/Config.in"
endef

TARGET_CXXFLAGS += -DHB_MINI

MESON_ARGS += \
	-Db_lto=true \
	-Dbenchmark=disabled \
	-Dcairo=$(if $(CONFIG_HARFBUZZ_CAIRO),en,dis)abled \
	-Dcoretext=disabled \
	-Ddirectwrite=disabled \
	-Ddocs=disabled \
	-Dexperimental_api=false \
	-Dfreetype=$(if $(CONFIG_HARFBUZZ_FREETYPE),en,dis)abled \
	-Dfuzzer_ldflags="" \
	-Dgdi=disabled \
	-Dglib=$(if $(CONFIG_HARFBUZZ_GLIB2),en,dis)abled \
	-Dgobject=$(if $(CONFIG_HARFBUZZ_GLIB2),en,dis)abled \
	-Dicu=$(if $(CONFIG_HARFBUZZ_ICU),en,dis)abled \
	-Dicu_builtin=false \
	-Dintrospection=disabled \
	-Dtests=disabled \
	-Dutilities=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/harfbuzz $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib/cmake/harfbuzz
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake/harfbuzz/harfbuzz-config.cmake \
		$(1)/opt/lib/cmake/harfbuzz
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz{,-subset}.so* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz{,-subset}.pc \
		$(1)/opt/lib/pkgconfig
  ifeq ($(CONFIG_HARFBUZZ_CAIRO),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-cairo.so* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz-cairo.pc \
		$(1)/opt/lib/pkgconfig
  endif
  ifeq ($(CONFIG_HARFBUZZ_GLIB2),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-gobject.so* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz-gobject.pc \
		$(1)/opt/lib/pkgconfig
  endif
  ifeq ($(CONFIG_HARFBUZZ_ICU),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-icu.so* $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz-icu.pc \
		$(1)/opt/lib/pkgconfig
  endif
endef

define Package/libharfbuzz/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz{,-subset}.so* $(1)/opt/lib
  ifeq ($(CONFIG_HARFBUZZ_CAIRO),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-cairo.so* $(1)/opt/lib
  endif
  ifeq ($(CONFIG_HARFBUZZ_GLIB2),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-gobject.so* $(1)/opt/lib
  endif
  ifeq ($(CONFIG_HARFBUZZ_ICU),y)
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz-icu.so* $(1)/opt/lib
  endif
endef

$(eval $(call BuildPackage,libharfbuzz))
