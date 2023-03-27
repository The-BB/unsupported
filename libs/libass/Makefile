# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libass
PKG_VERSION:=0.17.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/libass/libass/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=5ba42655d7e8c5e87bba3ffc8a2b1bc19c29904240126bb0d4b924f39429219f

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libass
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=is an SSA/ASS subtitles rendering library
  URL:=https://github.com/libass/libass
  DEPENDS:=+fontconfig +libfreetype +libfribidi +libharfbuzz $(ICONV_DEPENDS)
endef

define Package/libass/description
  libass is a portable subtitle renderer for the ASS/SSA
  (Advanced Substation Alpha/Substation Alpha) subtitle
  format. It is mostly compatible with VSFilter.
endef

TARGET_LDFLAGS += $(if $(ICONV_FULL),-liconv)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/ass
	$(CP) $(PKG_INSTALL_DIR)/opt/include/ass/*.h $(1)/opt/include/ass

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libass.{a,so*} $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/libass.pc $(1)/opt/lib/pkgconfig
endef

define Package/libass/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libass.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libass))
