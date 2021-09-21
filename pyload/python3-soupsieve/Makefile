# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-soupsieve
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PYPI_NAME:=soupsieve
PKG_HASH:=a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232

PKG_LICENSE:=MIT

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-soupsieve
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A modern CSS selector implementation for Beautiful Soup
  URL:=https://github.com/facelessuser/soupsieve
  DEPENDS:= \
	+python3-light
endef

define Package/python3-soupsieve/description
  A modern CSS selector implementation for Beautiful Soup.
endef

$(eval $(call Py3Package,python3-soupsieve))
$(eval $(call BuildPackage,python3-soupsieve))
#$(eval $(call BuildPackage,python3-soupsieve-src))
