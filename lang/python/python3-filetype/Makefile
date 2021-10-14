# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-filetype
PKG_VERSION:=1.0.7
PKG_RELEASE:=1

PYPI_NAME:=filetype
PKG_HASH:=da393ece8d98b47edf2dd5a85a2c8733e44b769e32c71af4cd96ed8d38d96aa7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-filetype
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Infer file type and MIME type of any file/buffer
  URL:=https://github.com/h2non/filetype.py
  DEPENDS:=+python3-light
endef

define Package/python3-filetype/description
  Small and dependency free Python package to infer file type and MIME type 
checking the magic numbers signature of a file or buffer.
endef

define Py3Package/python3-filetype/filespec
+|$(PYTHON3_PKG_DIR)
-|$(PYTHON3_PKG_DIR)/examples
endef

$(eval $(call Py3Package,python3-filetype))
$(eval $(call BuildPackage,python3-filetype))
#$(eval $(call BuildPackage,python3-filetype-src))
