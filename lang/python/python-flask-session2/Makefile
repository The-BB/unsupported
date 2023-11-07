# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=flask-session2
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PYPI_NAME:=Flask-Session2
PKG_HASH:=171e986d4e314795f448a527095e42df6abfba76c3e4ce5c8e4c61c857c59cb2

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-poetry-core/host

# FIXME
# FileNotFoundError: [Errno 2] No such file or directory: '.../Flask_Session2-1.3.1-*.whl'
PYTHON3_PKG_FORCE_DISTUTILS_SETUP:=1

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-session2
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Flask Session 2
  URL:=https://github.com/christopherpickering/flask-session2
  DEPENDS:= \
	+python3-cachelib \
	+python3-flask \
	+python3-pytz \
	+python3-uuid
  PROVIDES:=python3-flask-session
endef

define Package/python3-flask-session2/description
  Adds support for Server-side Session to your Flask application.
endef

$(eval $(call Py3Package,python3-flask-session2))
$(eval $(call BuildPackage,python3-flask-session2))
#$(eval $(call BuildPackage,python3-flask-session2-src))
