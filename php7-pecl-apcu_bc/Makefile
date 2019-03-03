#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=apcu_bc
PECL_LONGNAME:=APCu Backwards Compatibility Module

PKG_VERSION:=1.0.4
PKG_RELEASE:=1
PKG_HASH:=7cb1c22f67e31cfa99aad6298d1ea7fd7a995b0d9e4e05a64dcf2b4ed5e15ce5

PKG_NAME:=php7-pecl-apc
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_LICENSE:=PHPv3.01
PKG_LICENSE_FILES:=

PKG_BUILD_DEPENDS:=php7 php7-pecl-apcu
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

#APCU:=apcu-5.1.12.tgz

#define prepare_source_directory
#	mkdir -p $(PKG_BUILD_DIR)/ext/apcu
#	$(HOST_TAR) -C $(PKG_BUILD_DIR)/ext/apcu --strip-components=1 --wildcards "*.h" -xzf $(DL_DIR)/$(APCU)
#endef

#Hooks/Prepare/Pre += prepare_source_directory

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS+= --enable-apc

$(eval $(call PECLPackage,apc,$(PECL_LONGNAME),+php7-pecl-apcu,25))
$(eval $(call BuildPackage,$(PKG_NAME)))