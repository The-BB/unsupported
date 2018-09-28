#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgiwrap
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_REV:=99c942c90063c73734e56bacaa65f947772d9186
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/gnosek/fcgiwrap.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP:=autoreconf -i
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fcgiwrap
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=fcgiwrap for web server
  URL:=$(PKG_SOURCE_URL)
  DEPENDS:=+spawn-fcgi +fcgi
endef

define Package/fcgiwrap/description
   Simple FastCGI wrapper for CGI scripts.
endef

CONFIGURE_ARGS += \
	--prefix=/opt \
	--with-systemd=no

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/opt/include \
	-Wno-error=implicit-fallthrough

define Package/fcgiwrap/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/sbin/fcgiwrap $(1)/opt/sbin
endef

$(eval $(call BuildPackage,fcgiwrap))
