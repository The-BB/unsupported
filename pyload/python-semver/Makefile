# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-semver
PKG_VERSION:=2.10.2
PKG_RELEASE:=1

PYPI_NAME:=semver
PKG_HASH:=c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-semver
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python helper for Semantic Versioning
  URL:=https://semver.org/
  DEPENDS:= \
	+python3-light
endef

define Package/python3-semver/description
  A Python module for semantic versioning. Simplifies comparing versions.
endef

$(eval $(call Py3Package,python3-semver))
$(eval $(call BuildPackage,python3-semver))
#$(eval $(call BuildPackage,python3-semver-src))
