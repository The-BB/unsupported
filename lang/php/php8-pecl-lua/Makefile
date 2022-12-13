# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=lua
PECL_LONGNAME:=Embedded lua interpreter

PKG_VERSION:=2.0.7
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=86545e1e09b79e3693dd93f2a5a8f15ea161b5a1928f315c7a27107744ee8772

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += \
	--with-lua=shared,"$(STAGING_DIR)/opt"

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+liblua,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
