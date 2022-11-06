# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-html5lib
PKG_VERSION:=1.1
PKG_RELEASE:=1

PYPI_NAME:=html5lib
PKG_HASH:=b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-html5lib
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=HTML parser
  URL:=https://github.com/html5lib/html5lib-python
  DEPENDS:= \
	+python3-chardet \
	+python3-genshi \
	+python3-lxml \
	+python3-six \
	+python3-webencodings \
	+python3-xml
endef

define Package/python3-html5lib/description
  Standards-compliant library for parsing and serializing HTML documents
  and fragments in Python.
endef

$(eval $(call Py3Package,python3-html5lib))
$(eval $(call BuildPackage,python3-html5lib))
#$(eval $(call BuildPackage,python3-html5lib-src))
