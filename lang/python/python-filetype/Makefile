# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=filetype
PKG_VERSION:=1.2.0
PKG_RELEASE:=2

PYPI_NAME:=filetype
PKG_HASH:=66b56cd6474bf41d8c54660347d37afcc3f7d1970648de365c102ef77548aadb

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

$(eval $(call Py3Package,python3-filetype))
$(eval $(call BuildPackage,python3-filetype))
#$(eval $(call BuildPackage,python3-filetype-src))
