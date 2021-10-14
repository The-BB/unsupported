# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=xdebug
PECL_LONGNAME:=Step Debugger and Debugging Aid for PHP

PKG_VERSION:=3.1.0
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_HASH:=b956930adaef4a20e7573ad637a2f0e7f9a94ae2adaf122856bc8bf0d1e39d3a

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Xdebug-1.02

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--enable-xdebug

$(eval $(call PHP7PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
