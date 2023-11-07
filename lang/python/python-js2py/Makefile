# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=js2py
PKG_VERSION:=0.74
PKG_RELEASE:=1

PYPI_NAME:=Js2Py
PKG_HASH:=39f3a6aa8469180efba3c8677271df27c31332fd1b471df1af2af58b87b8972f

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
	+python3-codecs \
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
