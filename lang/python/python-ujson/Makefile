# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=ujson
PKG_VERSION:=5.7.0
PKG_RELEASE:=1

PYPI_NAME:=ujson
PKG_HASH:=e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=python-setuptools-scm/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-ujson
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Ultra fast JSON encoder and decoder
  URL:=https://github.com/ultrajson/ultrajson
  DEPENDS:=+libstdcpp +python3-light
endef

define Package/python3-ujson/description
  UltraJSON is an ultra fast JSON encoder and decoder written in pure C
  with bindings for Python 3.7+.
endef

$(eval $(call Py3Package,python3-ujson))
$(eval $(call BuildPackage,python3-ujson))
#$(eval $(call BuildPackage,python3-ujson-src))
