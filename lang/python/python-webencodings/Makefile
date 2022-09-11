# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-webencodings
PKG_VERSION:=0.5.1
PKG_RELEASE:=1

PYPI_NAME:=webencodings
PKG_HASH:=skip

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-webencodings
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Character encoding for the web
  URL:=https://github.com/gsnedders/python-webencodings
  DEPENDS:= \
	+python3-urllib
endef

define Package/python3-webencodings/description
  Character encoding aliases for legacy web content.
endef

$(eval $(call Py3Package,python3-webencodings))
$(eval $(call BuildPackage,python3-webencodings))
#$(eval $(call BuildPackage,python3-webencodings-src))
