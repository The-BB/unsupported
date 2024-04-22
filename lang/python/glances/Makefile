# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=glances
PKG_VERSION:=3.4.0.5
PKG_RELEASE:=1

PYPI_NAME:=Glances
PKG_HASH:=2aaae0222744837e1223f63bd2efffbc6a3fdae42c95b2ebd1925cf94ae2a85b

PKG_LICENSE:=LGPL-3.0-only
PKG_LICENSE_FILES:=COPYING

PKG_CONFIG_DEPENDS:= \
	CONFIG_GLANCES_BROWSER_MODE \
	CONFIG_GLANCES_IP \
	CONFIG_GLANCES_WEB_MODE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/glances
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=a curses-based monitoring tool (python)
  URL:=https://github.com/nicolargo/glances
  DEPENDS:= \
	+python3-codecs \
	+python3-ctypes \
	+python3-decimal \
	+python3-logging \
	+python3-multiprocessing \
	+python3-ncurses \
	+python3-openssl \
	+python3-pydoc \
	+python3-urllib \
	+python3-uuid \
	+python3-xml \
	+python3-defusedxml \
	+python3-psutil \
	+python3-packaging \
	+python3-ujson \
	+GLANCES_BROWSER_MODE:python3-zeroconf \
	+GLANCES_IP:python3-netifaces \
	+GLANCES_WEB_MODE:python3-bottle \
	+GLANCES_WEB_MODE:python3-requests
endef

define Package/glances/description
  Glances is an open-source system cross-platform monitoring tool.
endef

define Package/glances/conffiles
/opt/etc/glances/glances.conf
endef

define Package/glances/config
config GLANCES_BROWSER_MODE
	bool "Autodiscover (browser) mode"
	depends on PACKAGE_glances
	default y

config GLANCES_IP
	bool "IP plugin"
	depends on PACKAGE_glances
	default y

config GLANCES_WEB_MODE
	bool "Web server mode"
	depends on PACKAGE_glances
	default y
endef

define Py3Package/glances/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/glances $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/glances
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/conf/glances.conf $(1)/opt/etc/glances
	$(INSTALL_DIR) $(1)/opt/var/cache/glances
endef

$(eval $(call Py3Package,glances))
$(eval $(call BuildPackage,glances))
#$(eval $(call BuildPackage,glances-src))
