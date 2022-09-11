# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colorlog
PKG_VERSION:=6.4.1
PKG_RELEASE:=1

PYPI_NAME:=colorlog
PKG_HASH:=af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-colorlog
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A colored formatter for the python logging module
  URL:=https://github.com/borntyping/python-colorlog
  DEPENDS:= \
	+python3-logging
endef

define Package/python3-colorlog/description
  Add colours to the output of Python's logging module.
endef

$(eval $(call Py3Package,python3-colorlog))
$(eval $(call BuildPackage,python3-colorlog))
#$(eval $(call BuildPackage,python3-colorlog-src))
