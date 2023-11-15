# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=uv
PECL_LONGNAME:=libuv wrapper

PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=a11f9c987f4c466b70c79050714fcf0c916753c560421279bbe0f6b7dc737d3e

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += --with-uv

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libuv +php8-mod-sockets,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
