# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-js2py
PKG_VERSION:=0.71
PKG_RELEASE:=1

PYPI_NAME:=Js2Py
PKG_HASH:=a41b1009dd1498ae7d436bfa5ac952a08ca92a4bb9e31dca6e8bb966b49f7fce

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-js2py
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Pure Python JavaScript Translator/Interpreter
  URL:=https://github.com/h2non/filetype.py
  DEPENDS:= \
	+python3-pyjsparser \
	+python3-six \
	+python3-tzlocal
endef

define Package/python3-js2py/description
  JavaScript to Python Translator & JavaScript interpreter written
  in 100% pure Python.
endef

$(eval $(call Py3Package,python3-js2py))
$(eval $(call BuildPackage,python3-js2py))
#$(eval $(call BuildPackage,python3-js2py-src))
