# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=xdebug
PECL_LONGNAME:=Step Debugger and Debugging Aid for PHP

PKG_VERSION:=3.1.5
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_HASH:=55f6ef381245da079b2fc5ce1cfbcb7961197d0c0e04f9d977613cf9aa969a79

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Xdebug-1.02

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += \
	--enable-xdebug

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
