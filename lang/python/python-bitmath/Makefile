# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bitmath
PKG_VERSION:=1.3.3.1
PKG_RELEASE:=1

PYPI_NAME:=bitmath
PKG_HASH:=293325f01e65defe966853111df11d39215eb705a967cb115851da8c4cfa3eb8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-bitmath
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=module for representing and manipulating file sizes
  URL:=https://github.com/tbielawa/bitmath
  DEPENDS:=+python3-light
endef

define Package/python3-bitmath/description
  Pythonic module for representing and manipulating file sizes with different
  prefix notations (file size unit conversion).
endef

$(eval $(call Py3Package,python3-bitmath))
$(eval $(call BuildPackage,python3-bitmath))
#$(eval $(call BuildPackage,python3-bitmath-src))
