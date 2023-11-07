# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=emoji
PKG_VERSION:=2.7.0
PKG_RELEASE:=1

PYPI_NAME:=emoji
PKG_HASH:=375cc08589704266099846c553b6572ec5be591374b4d2cd1623b8343d5c9abb

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-emoji
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Emoji for Python
  URL:=https://github.com/carpedm20/emoji
  DEPENDS:=+python3-codecs
endef

define Package/python3-emoji/description
  Emoji for Python.
endef

$(eval $(call Py3Package,python3-emoji))
$(eval $(call BuildPackage,python3-emoji))
#$(eval $(call BuildPackage,python3-emoji-src))
