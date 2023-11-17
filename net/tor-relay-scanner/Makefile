# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=tor-relay-scanner
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PYPI_NAME:=tor-relay-scanner
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ValdikSS/tor-relay-scanner/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=eb662266f67fd348d2c9c7d3e254a6c22f0f201b36a97fc9db7f5e1d71ecdfa7

PKG_BUILD_DIR:=$(BUILD_DIR)/pypi/$(PYPI_NAME)-$(PKG_VERSION)

PKG_LICENSE:=
PKG_LICENSE_FILES:=

PKG_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/tor-relay-scanner
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tor Relay Availability Checker
  URL:=https://github.com/ValdikSS/tor-relay-scanner
  DEPENDS:=+python3-asyncio +python3-requests +python3-pysocks +python3-urllib
endef

define Package/tor-relay-scanner/description
  This small script downloads all Tor Relay IP addresses
  from onionoo.torproject.org directly and via embedded proxies, and checks
  whether random Tor Relays are reachable from your Internet connection.
endef

define Package/tor-relay-scanner/postrm
#!/bin/sh

rm -fr $(PYTHON3_PKG_DIR)/tor_relay_scanner
rm -fr $(PYTHON3_PKG_DIR)/tor_relay_scanner-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,tor-relay-scanner))
$(eval $(call BuildPackage,tor-relay-scanner))
#$(eval $(call BuildPackage,tor-relay-scanner-src))
