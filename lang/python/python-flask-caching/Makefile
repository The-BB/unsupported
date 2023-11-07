# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=flask-caching
PKG_VERSION:=2.0.2
PKG_RELEASE:=1

PYPI_NAME:=Flask-Caching
PKG_HASH:=24b60c552d59a9605cc1b6a42c56cdb39a82a28dab4532bbedb9222ae54ecb4e

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-caching
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Adds easy cache support to Flask
  URL:=https://github.com/sh4nks/flask-caching
  DEPENDS:= \
	+python3-cachelib \
	+python3-flask \
	+python3-logging
endef

define Package/python3-flask-caching/description
  Adds caching support to your Flask application.
endef

$(eval $(call Py3Package,python3-flask-caching))
$(eval $(call BuildPackage,python3-flask-caching))
#$(eval $(call BuildPackage,python3-flask-caching-src))
