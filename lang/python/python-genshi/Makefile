# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-genshi
PKG_VERSION:=0.7.7
PKG_RELEASE:=1

PYPI_NAME:=Genshi
PKG_HASH:=c100520862cd69085d10ee1a87e91289e7f59f6b3d9bd622bf58b2804e6b9aab

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-genshi
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A toolkit for generation of output for the web
  URL:=https://github.com/edgewall/genshi
  DEPENDS:= \
	+python3-cgi \
	+python3-six \
	+python3-xml
endef

define Package/python3-genshi/description
  Genshi is a Python library that provides an integrated set of
  components for parsing, generating, and processing HTML, XML or other
  textual content for output generation on the web. The major feature is
  a template language, which is heavily inspired by Kid.
endef

$(eval $(call Py3Package,python3-genshi))
$(eval $(call BuildPackage,python3-genshi))
#$(eval $(call BuildPackage,python3-genshi-src))
