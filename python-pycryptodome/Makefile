#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pycryptodome
PKG_VERSION:=3.6.5
PKG_RELEASE:=1

PKG_SOURCE:=pycryptodome-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/f7/e2/1a9beb4e838b9ab91fcf95b3801f07fa0d6c627fec479f286e8e497db324
PKG_HASH:=99d653f3a92f35e3c768a142aa83c8c7b104a787655c51e25dca89ed778960b8

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
