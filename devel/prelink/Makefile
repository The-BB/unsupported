# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=prelink
PKG_VERSION:=20130503
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://people.redhat.com/jakub/prelink/
PKG_HASH:=6339c7605e9b6f414d1be32530c9c8011f38820d36431c8a62e8674ca37140f0

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xjf $(DL_DIR)/$(PKG_SOURCE)

define Package/prelink
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=ELF prelinking utility to speed up dynamic linking
  URL:=https://people.redhat.com/jakub/prelink/
  DEPENDS:=+libelf $(INTL_DEPENDS)
endef

define Package/prelink/description
  ELF prelinking utility to speed up dynamic linking.
endef

#CONFIGURE_VARS += \
#	ac_cv_sys_large_files=yes

define Package/prelink/install
	$(INSTALL_DIR) $(1)/opt/{,s}bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/execstack $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/sbin/prelink $(1)/opt/sbin

	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/prelink.conf $(1)/opt/etc
endef

$(eval $(call BuildPackage,prelink))
