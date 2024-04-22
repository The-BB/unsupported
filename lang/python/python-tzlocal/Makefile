# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=tzlocal
PKG_VERSION:=5.2
PKG_RELEASE:=1

PYPI_NAME:=tzlocal
PKG_HASH:=8d399205578f1a9342816409cc1e46a93ebd5755e39ea2d85334bea911bf0e6e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-tzlocal
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=tzinfo object for the local timezone
  URL:=https://github.com/regebro/tzlocal
  DEPENDS:= \
	+python3-logging \
	+python3-urllib \
	+python3-xml
endef

define Package/python3-tzlocal/description
  A Python module that tries to figure out what your local timezone is.
endef

define Py3Package/python3-tzlocal/filespec
+|$(PYTHON3_PKG_DIR)
-|$(PYTHON3_PKG_DIR)/$(PYPI_NAME)/win*.py
endef

$(eval $(call Py3Package,python3-tzlocal))
$(eval $(call BuildPackage,python3-tzlocal))
#$(eval $(call BuildPackage,python3-tzlocal-src))
