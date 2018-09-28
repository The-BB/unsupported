#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libatomic_ops
PKG_VERSION:=7.6.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.hboehm.info/gc/gc_source/
PKG_HASH:=219724edad3d580d4d37b22e1d7cb52f0006d282d26a9b8681b560a625142ee6

PKG_LICENSE:=MIT (main library) / GPL-2.0+ (gpl extension)

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
    Libatomic-ops implements a large collection of operations, each one of which
is a combination of an (optional) atomic memory operation, and a memory barrier.
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
