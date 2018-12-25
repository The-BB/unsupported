#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-uvloop
PKG_VERSION:=0.11.3
PKG_RELEASE:=1

PKG_SOURCE:=uvloop-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/46/60/8e46188acba22369848d5e9bcbee3ca04b68a12d0598bd625c1a3994f5df
PKG_HASH:=fd5042d0a2ea07b92d0e2190f7711feb91cde31cf2bf1829e2e8c4c0fdd1f1aa

PKG_BUILD_DIR:=$(BUILD_DIR)/uvloop-$(PKG_VERSION)

PKG_LICENSE:=MIT and Apache 2.0

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-uvloop
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=drop-in replacement of the built-in asyncio event loop
  URL:=http://github.com/MagicStack/uvloop
  DEPENDS:=+python3
endef

define Package/python3-uvloop/description
  uvloop is a fast, drop-in replacement of the built-in asyncio event loop.
uvloop is implemented in Cython and uses libuv under the hood.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/vendor/libuv; \
	$(CONFIGURE_VARS) \
	./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/opt \
	);
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,install \
		--prefix=/opt \
		--root=$(PKG_INSTALL_DIR) \
	)
endef

define Package/python3-uvloop/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
	    $(1)$(PYTHON3_PKG_DIR)/
	rm -f $(1)/opt/lib/python3.7/site-packages/uvloop-0.11.3-py3.7.egg-info/{dependency_links,SOURCES}.txt
endef

$(eval $(call BuildPackage,python3-uvloop))
