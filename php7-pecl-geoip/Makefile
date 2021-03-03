# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PECL_NAME:=geoip
PECL_LONGNAME:=Map IP address to geographic places

PKG_VERSION:=1.1.1
PKG_RELEASE:=2

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--with-geoip=shared,"$(STAGING_DIR)/opt/usr"

$(eval $(call PHP7PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+geoip,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
