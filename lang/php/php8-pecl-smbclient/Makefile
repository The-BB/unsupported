# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=smbclient
PECL_LONGNAME:=A PHP wrapper for libsmbclient

PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/
PKG_HASH:=84520d5c73f8b7c9f590371c510ccf1f0d77405cf9a76726687359e6df9e96b2

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

TARGET_CPPFLAGS += -I$(STAGING_DIR)/opt/usr/include/samba-4.0

CONFIGURE_ARGS += \
	--with-libsmbclient=$(STAGING_DIR_ROOT)/opt

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+samba4-libs,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
