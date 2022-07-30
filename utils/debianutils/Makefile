# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=debianutils
PKG_VERSION:=5.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=@DEBIAN/pool/main/d/debianutils
PKG_HASH:=27ec9e0e7e44dc8ab611aa576330471bacb07e4491ffecf0d3aa6909c92f9022

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

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
