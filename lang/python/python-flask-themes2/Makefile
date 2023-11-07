# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=flask-themes2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PYPI_NAME:=Flask-Themes2
PKG_HASH:=d14d1c49d05d75bf7e206dc253acd43e5c5a261425c4e57a38b8319cd0c2872f

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
  DEPENDS:=+python3-flask
endef

define Package/python3-flask-themes2/description
  Provides infrastructure for theming Flask applications
  (and supports Flask>=0.6!).
endef

$(eval $(call Py3Package,python3-flask-themes2))
$(eval $(call BuildPackage,python3-flask-themes2))
#$(eval $(call BuildPackage,python3-flask-themes2-src))
