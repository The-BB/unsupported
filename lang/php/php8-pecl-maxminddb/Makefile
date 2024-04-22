# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=maxminddb
PECL_LONGNAME:=Reader for the MaxMind DB file format

PKG_VERSION:=1.11.1
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=22d7ad7709b7ed7ce1b0e68b8c87e6ea67bcb0aa1924d221dbb79538560174b4

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR)/ext; mv * $(PKG_BUILD_DIR)/ )
	$(if $(QUILT),,( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize8 ))
endef

CONFIGURE_ARGS += --with-maxminddb

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libmaxminddb,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
