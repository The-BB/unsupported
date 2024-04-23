# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=debianutils
PKG_VERSION:=5.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@DEBIAN/pool/main/d/debianutils
PKG_HASH:=367654878388f532cd8a897fe64766e2d57ae4c60da1d4d8f20dcdf2fb0cbde8

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/debianutils/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Miscellaneous utilities specific to Debian
  URL:=https://packages.debian.org/sid/debianutils
endef

define Package/debianutils/description
 This package provides a number of small utilities which
 are used primarily by the installation scripts of Debian
 packages, although you may use them directly.
endef

#define Package/ischroot
#  $(call Package/debianutils/Default)
#  TITLE:=detect if running in a chroot
#endef

#define Package/ischroot/description
#  $(call Package/debianutils/description)
#  .
#  ischroot - detect if running in a chroot.
#endef

define Package/run-parts
  $(call Package/debianutils/Default)
  TITLE:=run scripts or programs in a directory
  ALTERNATIVES:=300:/opt/bin/run-parts:/opt/libexec/run-parts
endef

define Package/run-parts/description
  $(call Package/debianutils/description)
  .
  run-parts - run scripts or programs in a directory.
endef

#define Package/ischroot/install
#	$(INSTALL_DIR) $(1)/opt/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ischroot $(1)/opt/bin
#endef

define Package/run-parts/install
	$(INSTALL_DIR) $(1)/opt/libexec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/run-parts $(1)/opt/libexec
endef

#$(eval $(call BuildPackage,ischroot))
$(eval $(call BuildPackage,run-parts))
