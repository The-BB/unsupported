#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pycryptodome
PKG_VERSION:=3.7.2
PKG_RELEASE:=1

PKG_SOURCE:=pycryptodome-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/a5/f5/ea666524f67b6e2b29112d33ad8d948281980b2a86015c264de8424400c2
PKG_HASH:=f5fc7e3b2d29552f0383063408ce2bd295e9d3c7ef13377599aa300a3d2baef7

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-pycryptodome-$(PKG_VERSION)

PKG_LICENSE:=BSD 2-Clause

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-pycryptodome/Default
  SECTION:=lang-python
  CATEGORY:=Languages
  SUBMENU:=Python
  URL:=https://www.pycryptodome.org
endef

define Package/python-pycryptodome
$(call Package/python-pycryptodome/Default)
  TITLE:=python-pycryptodome
  DEPENDS:=+PACKAGE_python-pycryptodome:python
  VARIANT:=python
  CONFLICTS:=python-crypto
endef

define Package/python3-pycryptodome
$(call Package/python-pycryptodome/Default)
  TITLE:=python3-pycryptodome
  DEPENDS:=+PACKAGE_python3-pycryptodome:python3
  VARIANT:=python3
  CONFLICTS:=python3-crypto
endef

define Package/python-pycryptodome/description
PyCryptodome is a self-contained Python package of low-level cryptographic primitives.
endef

define Package/python3-pycryptodome/description
$(call Package/python-pycryptodome/description)
.
(Variant for Python3)
endef

define PyBuild/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix=/opt --root=$(PKG_INSTALL_DIR),\
	)
endef

define Py3Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --prefix=/opt --root=$(PKG_INSTALL_DIR),\
	)
endef

$(eval $(call PyPackage,python-pycryptodome))
$(eval $(call BuildPackage,python-pycryptodome))

$(eval $(call Py3Package,python3-pycryptodome))
$(eval $(call BuildPackage,python3-pycryptodome))
