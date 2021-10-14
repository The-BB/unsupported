# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-jaraco-functools
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PYPI_NAME:=jaraco.functools
PKG_HASH:=9fedc4be3117512ca3e03e1b2ffa7a6a6ffa589bfb7d02bfb324e55d493b94f4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-jaraco-functools
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Functools like those found in stdlib
  URL:=https://github.com/jaraco/jaraco.functools
  DEPENDS:= \
	+python3-more-itertools
endef

define Package/python3-jaraco-functools/description
  Additional functools in the spirit of stdlib’s functools.
endef

$(eval $(call Py3Package,python3-jaraco-functools))
$(eval $(call BuildPackage,python3-jaraco-functools))
#$(eval $(call BuildPackage,python3-jaraco-functools-src))
