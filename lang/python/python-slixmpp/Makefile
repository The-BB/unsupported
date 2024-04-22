# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=slixmpp
PKG_VERSION:=1.8.5
PKG_RELEASE:=1

PYPI_NAME:=slixmpp
PKG_HASH:=75e3f0ad48555f7f5c9228e7066c1d4358b33d640b4fbe773ec34b03b7fae9a3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=python-cython/host

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
	+libidn \
	+python3-asyncio \
	+python3-codecs \
	+python3-distutils \
	+python3-logging \
	+python3-openssl \
	+python3-unittest \
	+python3-urllib \
	+python3-uuid \
	+python3-xml
  DEPENDS+= \
	+python3-aiodns \
	+python3-aiohttp \
	+python3-cryptography \
	+python3-defusedxml \
	+python3-emoji \
	+python3-pyasn1 \
	+python3-pyasn1-modules
endef

define Package/python3-slixmpp/description
  Slixmpp is an MIT licensed XMPP library for Python 3.7+.
  It is a fork of SleekXMPP.
endef

$(eval $(call Py3Package,python3-slixmpp))
$(eval $(call BuildPackage,python3-slixmpp))
#$(eval $(call BuildPackage,python3-slixmpp-src))
