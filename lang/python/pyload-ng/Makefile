# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pyload-ng
PKG_PYLOAD_BUILD:=82
PKG_VERSION:=0.5.0b3.dev$(PKG_PYLOAD_BUILD)
PKG_RELEASE:=1

PYPI_NAME:=pyload_ng
PKG_HASH:=839a2a5d5f009f3c015e20b10316e85ec48fbe305324f543dc4d26c1d1062c70

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.md

PKG_BUILD_DEPENDS:=python-wheel/host
PKG_BUILD_DEPENDS += python-dukpy python-js2py

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/pyload-ng
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Download Manager
  TITLE:=Download Manager written in pure Python
  URL:=https://pyload.net
  DEPENDS:= \
	+python3-asyncio \
	+python3-cgi \
	+python3-codecs \
	+python3-ctypes \
	+python3-email \
	+python3-logging \
	+python3-openssl \
	+python3-sqlite3 \
	+python3-urllib \
	+python3-uuid \
	+python3-xml
## install
  DEPENDS+= \
	+python3-bitmath \
	+python3-certifi \
	+python3-cheroot \
	+python3-cryptography \
	+python3-curl \
	+python3-filetype \
	+python3-flask \
	+python3-flask-babel \
	+python3-flask-caching \
	+python3-flask-compress \
	+python3-flask-session2 \
	+python3-flask-themes2 \
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
  EXTRA_DEPENDS:=coreutils-nohup, \
	python3-dukpy (>=python3-3.12.2-1), \
	python3-js2py (<python3-3.12.2-1)
endef

define Package/pyload-ng/description
  The free and open-source Download Manager written in pure Python.
endef

PYTHON3_PKG_SETUP_VARS += PYLOAD_BUILD=$(PKG_PYLOAD_BUILD)

# FIXME plugins don`t work if they compiled into bytecode
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

#$(eval $(call Py3Package,pyload-ng))
$(eval $(call BuildPackage,pyload-ng))
#$(eval $(call BuildPackage,pyload-ng-src))
