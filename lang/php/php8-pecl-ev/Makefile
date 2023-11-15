# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=ev
PECL_LONGNAME:=Provides interface to libev library

PKG_VERSION:=1.1.5
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=2590e6b249ba15e7fbc85102643cbbde030a091f69de55fdbf25d10ea28b07db

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += --enable-ev

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libev +php8-mod-sockets,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
