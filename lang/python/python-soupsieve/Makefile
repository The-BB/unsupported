# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=soupsieve
PKG_VERSION:=2.4.1
PKG_RELEASE:=1

PYPI_NAME:=soupsieve
PKG_HASH:=89d12b2d5dfcd2c9e8c22326da9d9aa9cb3dfab0a83a024f05704076ee8d35ea

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

PKG_BUILD_DEPENDS:=python-hatchling/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-soupsieve
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A modern CSS selector implementation for Beautiful Soup
  URL:=https://github.com/facelessuser/soupsieve
  DEPENDS:=+python3-codecs
endef

define Package/python3-soupsieve/description
  A modern CSS selector implementation for Beautiful Soup.
endef

$(eval $(call Py3Package,python3-soupsieve))
$(eval $(call BuildPackage,python3-soupsieve))
#$(eval $(call BuildPackage,python3-soupsieve-src))
