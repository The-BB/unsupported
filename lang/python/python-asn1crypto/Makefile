# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=asn1crypto
PKG_VERSION:=1.5.1
PKG_RELEASE:=1

PYPI_NAME:=asn1crypto
PKG_HASH:=13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-asn1crypto
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Fast ASN.1 parser and serializer
  URL:=https://github.com/wbond/asn1crypto
  DEPENDS:=+python3-codecs +python3-urllib
endef

define Package/python3-asn1crypto/description
  Python ASN.1 library with a focus on performance and a pythonic API.
endef

$(eval $(call Py3Package,python3-asn1crypto))
$(eval $(call BuildPackage,python3-asn1crypto))
#$(eval $(call BuildPackage,python3-asn1crypto-src))
