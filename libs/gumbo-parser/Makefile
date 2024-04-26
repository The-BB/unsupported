# SPDX-License-Identifier: WTFPL

# repository has been archived by the owner on Feb 16, 2023.

include $(TOPDIR)/rules.mk

PKG_NAME:=gumbo-parser
PKG_VERSION:=0.10.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/google/gumbo-parser/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libgumbo
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=A fully-compliant HTML5 parser
  URL:=https://github.com/google/gumbo-parser
endef

define Package/libgumbo/description
  Gumbo - A pure-C HTML5 parser.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libgumbo.{a,so}* $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/gumbo.pc $(1)/opt/lib/pkgconfig
endef

define Package/libgumbo/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libgumbo.so.* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libgumbo))
