# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pyaxmlparser
PKG_VERSION:=0.3.28
PKG_RELEASE:=1

PYPI_NAME:=pyaxmlparser
PKG_HASH:=c482826380fd84ce1a6386183861f2a6728017241a230c13d521e3e7737e803e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-pyaxmlparser
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A simple parser to parse Android XML file
  URL:=https://github.com/appknox/pyaxmlparser
  DEPENDS:= \
	+python3-asn1crypto \
	+python3-click \
	+python3-logging \
	+python3-lxml \
	+python3-xml
endef

define Package/python3-pyaxmlparser/description
  Python3 Parser for Android XML file and get Application Name
  without using Androguard.
endef

$(eval $(call Py3Package,python3-pyaxmlparser))
$(eval $(call BuildPackage,python3-pyaxmlparser))
#$(eval $(call BuildPackage,python3-pyaxmlparser-src))
