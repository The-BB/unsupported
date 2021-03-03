# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PECL_NAME:=mosquitto
PECL_LONGNAME:=Extension for libmosquitto

PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=Mosquitto-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_HASH:=eec599110f733afe5e0331a85d8feb354ec079b088bdca2dd81a587c5b50f8e4

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_UNPACK:=$(TAR) -C $(PKG_BUILD_DIR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1

PKG_LICENSE:=BSD-3-Clause

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--with-mosquitto=$(STAGING_DIR)/opt

$(eval $(call PHP7PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libmosquitto,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
