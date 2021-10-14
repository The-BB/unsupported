# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-slixmpp
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PYPI_NAME:=slixmpp
PKG_HASH:=9af836dc5747259788651726f062d69a6f430d306ddbd8e6b141c1fec99549e7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-slixmpp
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=an elegant Python library for XMPP (aka Jabber)
  URL:=https://lab.louiz.org/poezio/slixmpp
  DEPENDS:= \
	+python3-light
endef

define Package/python3-slixmpp/description
  Slixmpp is an MIT licensed XMPP library for Python 3.7+.
  It is a fork of SleekXMPP.
endef

$(eval $(call Py3Package,python3-slixmpp))
$(eval $(call BuildPackage,python3-slixmpp))
#$(eval $(call BuildPackage,python3-slixmpp-src))
