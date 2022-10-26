# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=harfbuzz
PKG_VERSION:=5.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/harfbuzz/harfbuzz/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=5352ff2eec538ea9a63a485cf01ad8332a3f63aa79921c5a2e301cef185caea1

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
  TITLE:=an OpenType text shaping engine
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

MESON_ARGS += \
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
	-Dgobject=disabled \
	-Dgraphite=disabled \
	-Dicu=$(if $(CONFIG_HARFBUZZ_ICU),en,dis)abled \
	-Dicu_builtin=false \
	-Dintrospection=disabled \
	-Dtests=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/harfbuzz
	$(CP) $(PKG_INSTALL_DIR)/opt/include/harfbuzz/*.h \
		$(1)/opt/include/harfbuzz

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz{,-subset}.so* $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/harfbuzz{,-subset}.pc \
		$(1)/opt/lib/pkgconfig

	$(INSTALL_DIR) $(1)/opt/lib/cmake/harfbuzz
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake/harfbuzz/harfbuzz-config.cmake \
		$(1)/opt/lib/cmake/harfbuzz
endef

define Package/libharfbuzz/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libharfbuzz.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libharfbuzz))
