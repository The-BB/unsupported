# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=aiodns
PKG_VERSION:=3.2.0
PKG_RELEASE:=1

PYPI_NAME:=aiodns
PKG_HASH:=62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-aiodns
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Simple DNS resolver for asyncio
  URL:=https://github.com/saghul/aiodns
  DEPENDS:=+python3-asyncio +python3-pycares +python3-unittest
endef

define Package/python3-aiodns/description
  aiodns provides a simple way for doing asynchronous
  DNS resolutions using pycares.
endef

$(eval $(call Py3Package,python3-aiodns))
$(eval $(call BuildPackage,python3-aiodns))
#$(eval $(call BuildPackage,python3-aiodns-src))
