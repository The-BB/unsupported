#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgiwrap
PKG_VERSION:=1.1.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/gnosek/fcgiwrap/tar.gz/$(PKG_VERSION)?
PKG_HASH:=4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/fcgiwrap
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Simple FastCGI wrapper for CGI scripts
  URL:=https://github.com/gnosek/fcgiwrap
  DEPENDS:=+spawn-fcgi +fcgi
endef

define Package/fcgiwrap/description
   Simple FastCGI wrapper for CGI scripts.
endef

CONFIGURE_ARGS += \
	--with-systemd=no

TARGET_CFLAGS += $(TARGET_CPPFLAGS)

define Package/fcgiwrap/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fcgiwrap $(1)/opt/sbin
endef

$(eval $(call BuildPackage,fcgiwrap))
