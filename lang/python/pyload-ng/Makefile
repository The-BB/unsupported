# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pyload-ng
PKG_VERSION:=0.5.0b2.dev9
PKG_RELEASE:=1

PYPI_NAME:=pyload-ng
PKG_HASH:=d5696d660b666f0676d5fdcfbb0040346a46e1177539202b7ff8a39d3d247b2b

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.md

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/pyload-ng
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Download Manager
  TITLE:=Download Manager written in pure Python
  URL:=https://pyload.net
## install
  DEPENDS:= \
	+python3-bitmath \
	+python3-cheroot \
	+python3-cryptography \
	+python3-curl \
	+python3-filetype \
	+python3-flask \
	+python3-flask-babel \
	+python3-flask-caching \
	+python3-flask-compress \
	+python3-flask-session \
	+python3-flask-themes2 \
	+python3-js2py \
	+python3-semver \
	+python3-setuptools
## all,build,plugin
  DEPENDS+= \
	+python3-babel \
	+python3-beautifulsoup4 \
	+python3-colorlog \
	+python3-jinja2 \
	+python3-pillow \
	+python3-pyopenssl \
	+python3-send2trash \
	+python3-slixmpp
endef

define Package/pyload-ng/description
  The free and open-source Download Manager written in pure Python.
endef

#define Package/pyload-ng-plugins
#$(call Package/pyload-ng)
#  TITLE:=(plugins)
#  DEPENDS:=+pyload-ng
#endef

#define Package/pyload-ng-plugins/description
#  A collection of plugins for pyload.
#endef

# FIXME plugins don`t work if they compiled into bytecode
#define Py3Package/pyload-ng/filespec
#+|$(PYTHON3_PKG_DIR)
#-|$(PYTHON3_PKG_DIR)/pyload/plugins
#endef

define Package/pyload-ng/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pyload $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S51pyload $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* $(1)$(PYTHON3_PKG_DIR)/
	$(call Python3/FixShebang,$(1)/opt/bin/pyload \
		$(1)$(PYTHON3_PKG_DIR)/pyload/plugins/anticaptchas/CoinHive.py \
		$(1)$(PYTHON3_PKG_DIR)/pyload/__main__.py)
endef

#define Package/pyload-ng-plugins/install
#	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)/pyload
#	$(CP) $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/pyload/plugins \
#		$(1)$(PYTHON3_PKG_DIR)/pyload
#endef

#$(eval $(call Py3Package,pyload-ng))
$(eval $(call BuildPackage,pyload-ng))
#$(eval $(call BuildPackage,pyload-ng-src))

#$(eval $(call BuildPackage,pyload-ng-plugins))
