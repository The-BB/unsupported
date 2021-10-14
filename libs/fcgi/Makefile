# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgi
PKG_VERSION:=2.4.2
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/FastCGI-Archives/fcgi2/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)2-$(PKG_VERSION)

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.TERMS

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fcgi
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Shared library of FastCGI
  URL:=https://fastcgi-archives.github.io/
endef

define Package/fcgi/description
 FastCGI is a language independent, scalable, open extension to
 CGI that provides high performance without the limitations of
 server specific APIs.
endef

TARGET_CXXFLAGS += -fno-rtti -flto
TARGET_LDFLAGS += -Wl,--gc-sections,--as-needed

CONFIGURE_VARS += \
	ac_cv_lib_socket_socket=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/usr/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/fastcgi.h $(1)/opt/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/fcgi{app,_config,misc,o,os,_stdio}.h $(1)/opt/usr/include/

	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfcgi.{a,so*} $(1)/opt/usr/lib/

	$(INSTALL_DIR) $(1)/opt/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/fcgi.pc $(1)/opt/usr/lib/pkgconfig/

	# XXX
	$(SED) 's,^includedir=.*/include,includedir=$(STAGING_DIR)/opt/usr/include,; \
		s,^libdir=.*/lib,libdir=$(STAGING_DIR)/opt/usr/lib,' \
			$(1)/opt/usr/lib/pkgconfig/*.pc
endef

define Package/fcgi/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/cgi-fcgi $(1)/opt/bin/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfcgi.so.* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,fcgi))
