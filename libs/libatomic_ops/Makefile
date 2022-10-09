# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=libatomic_ops
PKG_VERSION:=7.6.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hboehm.info/gc/gc_source/
PKG_HASH:=390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292

PKG_LICENSE:=GPL-2.0-or-later MIT
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libatomic_ops
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=library for atomic operations
  URL:=https://github.com/ivmai/libatomic_ops/
endef

define Package/libatomic_ops/description
  Libatomic-ops implements a large collection of operations,
  each one of which is a combination of an (optional) atomic
  memory operation, and a memory barrier.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libatomic_ops*.{a,so*} $(1)/opt/lib/

	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/atomic_ops.pc $(1)/opt/lib/pkgconfig/
endef

define Package/libatomic_ops/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,libatomic_ops))
