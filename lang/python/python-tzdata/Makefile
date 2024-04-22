# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=tzdata
PKG_VERSION:=2024.1
PKG_RELEASE:=1

PYPI_NAME:=tzdata
PKG_HASH:=2674120f8d891909751c38abcdfd386ac0a5a1127954fbc332af6b5ceae07efd

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=licenses/LICENSE_APACHE LICENSE

PKG_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-tzdata
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Provider of IANA time zone data
  URL:=https://github.com/python/tzdata
  DEPENDS:=+python3-light
endef

define Package/python3-tzdata/description
  Python package wrapping the IANA time zone database.
endef

$(eval $(call Py3Package,python3-tzdata))
$(eval $(call BuildPackage,python3-tzdata))
#$(eval $(call BuildPackage,python3-tzdata-src))
