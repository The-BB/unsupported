# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=timezonedb
PECL_LONGNAME:=Timezone Database

PKG_VERSION:=2024.1
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=6031d5c4fe7daba91e5b6cf46a58b0df89d8e1a963d28f38b3df091843c39c46

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += \
	--enable-timezonedb

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,20))
$(eval $(call BuildPackage,$(PKG_NAME)))
