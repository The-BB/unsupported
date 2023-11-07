# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=cheroot
PKG_VERSION:=10.0.0
PKG_RELEASE:=1

PYPI_NAME:=cheroot
PKG_HASH:=59c4a1877fef9969b3c3c080caaaf377e2780919437853fc0d32a9df40b311f0

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

PKG_BUILD_DEPENDS:=python-setuptools-scm/host

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
	+python3-more-itertools
endef

define Package/python3-cheroot/description
  Cheroot is the high-performance, pure-Python HTTP server used by CherryPy.
endef

$(eval $(call Py3Package,python3-cheroot))
$(eval $(call BuildPackage,python3-cheroot))
#$(eval $(call BuildPackage,python3-cheroot-src))
