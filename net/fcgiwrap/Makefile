# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgiwrap
PKG_VERSION:=1.1.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/gnosek/fcgiwrap/tar.gz/refs/tags/$(PKG_VERSION)?
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

TARGET_CFLAGS += $(TARGET_CPPFLAGS)
TARGET_CFLAGS += -I$(STAGING_DIR)/opt/usr/include
TARGET_LDFLAGS += -L$(STAGING_DIR)/opt/usr/lib

CONFIGURE_ARGS += \
	--without-systemd

define Package/fcgiwrap/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fcgiwrap $(1)/opt/sbin
endef

$(eval $(call BuildPackage,fcgiwrap))
