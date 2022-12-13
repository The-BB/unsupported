# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=rrd
PECL_LONGNAME:=PHP bindings to rrd tool system

PKG_VERSION:=2.0.3
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=a42161e58cdc8a853b72cff298989dcbde82b0f76456dd59ce02854c92b730f7

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

ADD_PKG_CONFIG_PATH=$(STAGING_DIR)/opt/usr/lib/pkgconfig

CONFIGURE_ARGS += \
	PKG_CONFIG_PATH="$(ADD_PKG_CONFIG_PATH):$$$$PKG_CONFIG_PATH"

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+librrd-latest,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
