# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=flask-compress
PKG_VERSION:=1.13
PKG_RELEASE:=1

PYPI_NAME:=Flask-Compress
PKG_HASH:=ee96f18bf9b00f2deb4e3406ca4a05093aa80e2ef0578525a3b4d32ecdff129d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=python-setuptools-scm/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-compress
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Compress responses in your Flask app
  URL:=https://github.com/colour-science/flask-compress
  DEPENDS:=+python3-flask
endef

define Package/python3-flask-compress/description
  Compress responses in your Flask app with gzip, deflate or brotli.
endef

$(eval $(call Py3Package,python3-flask-compress))
$(eval $(call BuildPackage,python3-flask-compress))
#$(eval $(call BuildPackage,python3-flask-compress-src))
