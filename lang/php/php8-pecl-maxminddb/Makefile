# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=maxminddb
PECL_LONGNAME:=Reader for the MaxMind DB file format

PKG_VERSION:=1.11.0
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=a57927e47341ee1d981ce11c09cd2d581366a18971e7c8b6b4aba86db6cf1c74

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
