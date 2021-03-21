# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PECL_NAME:=smbclient
PECL_LONGNAME:=A PHP wrapper for libsmbclient

PKG_VERSION:=1.0.6
PKG_RELEASE:=2

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/
PKG_HASH:=66c433743b7a34b45606c03be689bdce4c52bc1eb306cbef3e15c966b5ff28d7

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-clause

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

TARGET_CPPFLAGS += -I$(STAGING_DIR)/opt/usr/include/samba-4.0

CONFIGURE_ARGS += \
	--with-libsmbclient=$(STAGING_DIR)/opt/usr

CONFIGURE_VARS += \
	ac_cv_lib_smbclient_smbc_setPort=yes \
	ac_cv_lib_smbclient_smbc_setOptionUseNTHash=yes

$(eval $(call PHP7PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+samba4-libs,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
