# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PECL_NAME:=ssh2
PECL_LONGNAME:=Bindings for the libssh2 library

PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/
PKG_HASH:=9093a1f8d24dc65836027b0e239c50de8d5eaebf8396bc3331fdd38c5d69afd9

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--with-ssh2=$(STAGING_DIR)/opt

$(eval $(call PHP7PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libssh2,20))
$(eval $(call BuildPackage,$(PKG_NAME)))
