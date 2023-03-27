# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=httpdirfs
PKG_VERSION:=1.2.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fangfufu/httpdirfs/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=d0a85600c3813064ba3cad9491b66fcf458151a49d3926818f5458ab6f615038

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/httpdirfs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  TITLE:=HTTP Directory Filesystem
  URL:=https://github.com/fangfufu/httpdirfs
  DEPENDS:=+libcurl +libexpat +libfuse +libgumbo +libopenssl +libuuid
endef

define Package/httpdirfs/description
  HTTPDirFS - HTTP Directory Filesystem with a permanent cache,
  and Airsonic / Subsonic server support.
endef

define Package/httpdirfs/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/httpdirfs $(1)/opt/bin
endef

$(eval $(call BuildPackage,httpdirfs))
