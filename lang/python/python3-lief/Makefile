# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-lief
PKG_VERSION:=0.12.2
PKG_RELEASE:=1

PYPI_NAME:=lief
PYPI_SOURCE_EXT:=zip
PKG_HASH:=d6fbab6a7cd4c30db83646c893aa4f43b15628e635711c2cf20e9a27be963469

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-lief
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Library to Instrument Executable Formats (LIEF)
  URL:=https://github.com/lief-project/LIEF
  DEPENDS:=+libstdcpp +python3-base
endef

define Package/python3-lief/description
  The purpose of this project is to provide a cross platform library which
  can parse, modify and abstract ELF, PE and MachO formats. 
endef

PYTHON3_PKG_SETUP_GLOBAL_ARGS += --ninja

define Package/python3-lief/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
	$(call Python3/FixShebang,$(1)/opt/bin/*)

	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* $(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call Py3Package,python3-lief))
$(eval $(call BuildPackage,python3-lief))
#$(eval $(call BuildPackage,python3-lief-src))
