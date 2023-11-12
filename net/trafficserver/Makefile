# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=trafficserver
PKG_VERSION:=9.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/apache/trafficserver/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=13f4f78c5b0c47733d291e67d7741f74103ba2d358d1804decb8343166930b9d

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/trafficserver
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Apache Traffic Server
  URL:=https://trafficserver.apache.org
  DEPENDS:=+libatomic +libcap +libcurl +libncursesw +libopenssl +libpcre
  DEPENDS+=+libstdcpp +zlib
endef

define Package/trafficserver/description
  Apache Traffic Server™ is a fast, scalable and extensible
  HTTP/1.1 and HTTP/2 compliant caching proxy server.
endef

TARGET_CFLAGS += -pthread
TARGET_LDFLAGS += -latomic -ldl

ifeq ($(CONFIG_ARCH_64BIT),)
CONFIGURE_ARGS += \
	--enable-32bit-build
endif

CONFIGURE_ARGS += \
	--disable-tests \
	--enable-experimental-plugins

define PreCompile
	( cd $(PKG_BUILD_DIR)/src/tscore; \
		HOST_CXX_FOR_BUILD="$(HOSTCXX)" \
		CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
		make CompileParseRules; \
	)
endef
Hooks/Compile/Pre += PreCompile

define Package/trafficserver/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/traffic_* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(PKG_INSTALL_DIR)/opt/etc/* $(1)/opt/etc
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib
	install -d -m0777 $(1)/opt/var/log/trafficserver
	install -d -m0777 $(1)/opt/var/trafficserver
endef

$(eval $(call BuildPackage,trafficserver))
