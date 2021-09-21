# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-flask-compress
PKG_VERSION:=1.10.1
PKG_RELEASE:=1

PYPI_NAME:=Flask-Compress
PKG_HASH:=28352387efbbe772cfb307570019f81957a13ff718d994a9125fa705efb73680

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-compress
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Compress responses in your Flask app
  URL:=https://github.com/colour-science/flask-compress
  DEPENDS:= \
	+python3-flask
endef

define Package/python3-flask-compress/description
  Compress responses in your Flask app with gzip, deflate or brotli.
endef

$(eval $(call Py3Package,python3-flask-compress))
$(eval $(call BuildPackage,python3-flask-compress))
#$(eval $(call BuildPackage,python3-flask-compress-src))
