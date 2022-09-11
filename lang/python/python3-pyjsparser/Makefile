# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-pyjsparser
PKG_VERSION:=2.7.1
PKG_RELEASE:=1

PYPI_NAME:=pyjsparser
PKG_HASH:=be60da6b778cc5a5296a69d8e7d614f1f870faf94e1b1b6ac591f2ad5d729579

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-pyjsparser
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Fast JavaScript parser for Python
  URL:=https://github.com/PiotrDabkowski/pyjsparser
  DEPENDS:= \
	+python3-codecs
endef

define Package/python3-pyjsparser/description
  Fast JavaScript parser - manual translation of esprima.js to python.
endef

$(eval $(call Py3Package,python3-pyjsparser))
$(eval $(call BuildPackage,python3-pyjsparser))
#$(eval $(call BuildPackage,python3-pyjsparser-src))
