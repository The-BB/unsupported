# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-flask-themes2
PKG_VERSION:=0.1.5
PKG_RELEASE:=1

PYPI_NAME:=Flask-Themes2
PKG_HASH:=aafabdf38ab4d4b39a1f9a5b38c2a81285e2b84615d1a1764b1752fb9ae671d2

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-themes2
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Easily theme your Flask app
  URL:=https://github.com/sysr-q/flask-themes2
  DEPENDS:= \
	+python3-flask \
	+python3-simplejson
endef

define Package/python3-flask-themes2/description
  Provides infrastructure for theming Flask applications
  (and supports Flask>=0.6!).
endef

$(eval $(call Py3Package,python3-flask-themes2))
$(eval $(call BuildPackage,python3-flask-themes2))
#$(eval $(call BuildPackage,python3-flask-themes2-src))
