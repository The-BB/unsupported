# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=jaraco-functools
PKG_VERSION:=3.8.1
PKG_RELEASE:=1

PYPI_NAME:=jaraco.functools
PKG_HASH:=e96a0d4ea455005a4092ce89a69ea0f7fb7e22807ad3b1008f9bf70c48d1cf2e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-setuptools-scm/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-jaraco-functools
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Functools like those found in stdlib
  URL:=https://github.com/jaraco/jaraco.functools
  DEPENDS:=+python3-more-itertools
endef

define Package/python3-jaraco-functools/description
  Additional functools in the spirit of stdlib’s functools.
endef

$(eval $(call Py3Package,python3-jaraco-functools))
$(eval $(call BuildPackage,python3-jaraco-functools))
#$(eval $(call BuildPackage,python3-jaraco-functools-src))
