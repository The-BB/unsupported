# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=send2trash
PKG_VERSION:=1.8.2
PKG_RELEASE:=1

PYPI_NAME:=Send2Trash
PKG_HASH:=c132d59fa44b9ca2b1699af5c86f57ce9f4c5eb56629d5d55fbb7a35f84e2312

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-send2trash
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Send file to trash natively
  URL:=https://github.com/arsenetar/send2trash
  DEPENDS:=+python3-ctypes +python3-urllib
endef

define Package/python3-send2trash/description
  Python library to natively send files to Trash
  (or Recycle bin) on all platforms. 
endef

$(eval $(call Py3Package,python3-send2trash))
$(eval $(call BuildPackage,python3-send2trash))
#$(eval $(call BuildPackage,python3-send2trash-src))
