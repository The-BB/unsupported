# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PECL_NAME:=apcu_bc
PECL_LONGNAME:=APCu Backwards Compatibility Module

PKG_VERSION:=1.0.5
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-apc
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/
PKG_HASH:=40d8e44dbbb6fc3fc019824683d215717413633e5f0a70d34cfa8a09bd064055

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01

PKG_BUILD_PARALLEL:=1

#APCU:=apcu-5.1.20.tgz

#define prepare_source_directory
#	mkdir -p $(PKG_BUILD_DIR)/ext/apcu
#	$(HOST_TAR) -C $(PKG_BUILD_DIR)/ext/apcu --strip-components=1 --wildcards "*.h" -xzf $(DL_DIR)/$(APCU)
#endef

#Hooks/Prepare/Pre += prepare_source_directory

PKG_BUILD_DEPENDS:=php7-pecl-apcu

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--enable-apc

$(eval $(call PHP7PECLPackage,apc,$(PECL_LONGNAME),+php7-pecl-apcu,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
