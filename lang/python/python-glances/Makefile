# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=glances
PKG_VERSION:=3.4.0.3
PKG_RELEASE:=1

PYPI_NAME:=Glances
PKG_HASH:=e7b1d54180db9961613f5485bf8e2a9fe93d0e58c1bcec0a451b4efe5687c85d

PKG_LICENSE:=LGPL-3.0-only
PKG_LICENSE_FILES:=COPYING

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-glances
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=a curses-based monitoring tool
  URL:=https://github.com/nicolargo/glances
  DEPENDS:= \
	+python3-codecs \
	+python3-ctypes \
	+python3-logging \
	+python3-multiprocessing \
	+python3-ncurses \
	+python3-openssl \
	+python3-urllib \
	+python3-uuid \
	+python3-xml \
	+python3-defusedxml \
	+python3-psutil \
	+python3-packaging \
	+python3-ujson
endef

define Package/python3-glances/description
  Glances is an open-source system cross-platform monitoring tool.
endef

define Package/python3-glances/conffiles
/opt/etc/glances/glances.conf
endef

# FIXME plugins don`t work if they compiled into bytecode
define Package/python3-glances/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/glances $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/glances
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/conf/glances.conf $(1)/opt/etc/glances
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* $(1)$(PYTHON3_PKG_DIR)/
	$(INSTALL_DIR) $(1)/opt/var/cache/glances
	$(call Python3/FixShebang,$(1)/opt/bin/glances)
endef

#$(eval $(call Py3Package,python3-glances))
$(eval $(call BuildPackage,python3-glances))
#$(eval $(call BuildPackage,python3-glances-src))
