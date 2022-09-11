# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-cheroot
PKG_VERSION:=8.4.8
PKG_RELEASE:=1

PYPI_NAME:=cheroot
PKG_HASH:=1089c28a9c320d19fdf9a4b0ed6ace23a0948db1c171a36ac985f3741bc62865

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=setuptools-scm

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-cheroot
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Highly-optimized, pure-python HTTP server
  URL:=https://cheroot.cherrypy.org/
  DEPENDS:= \
	+python3-ctypes \
	+python3-email \
	+python3-logging \
	+python3-openssl \
	+python3-urllib
  DEPENDS+= \
	+python3-jaraco-functools \
	+python3-more-itertools \
	+python3-six
endef

define Package/python3-cheroot/description
  Cheroot is the high-performance, pure-Python HTTP server used by CherryPy.
endef

$(eval $(call Py3Package,python3-cheroot))
$(eval $(call BuildPackage,python3-cheroot))
#$(eval $(call BuildPackage,python3-cheroot-src))
