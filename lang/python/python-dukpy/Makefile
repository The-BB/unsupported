# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dukpy
PKG_VERSION:=0.3.1
PKG_RELEASE:=1

PYPI_NAME:=dukpy
PKG_HASH:=e935ca7583d3e7b3364099bd1444f66da9dccbb66ff7262cda27aab3c25e0b6b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-dukpy
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Simple JavaScript interpreter for Python
  URL:=https://github.com/amol-/dukpy
  DEPENDS:=+python3-logging +python3-urllib
endef

define Package/python3-dukpy/description
  DukPy is a simple javascript interpreter for Python built on top
  of duktape engine without any external dependency.
endef

$(eval $(call Py3Package,python3-dukpy))
$(eval $(call BuildPackage,python3-dukpy))
#$(eval $(call BuildPackage,python3-dukpy-src))
