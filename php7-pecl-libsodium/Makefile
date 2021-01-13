#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=libsodium
PECL_LONGNAME:=Wrapper for the Sodium cryptographic library

PKG_VERSION:=2.0.23
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-sodium
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=f8c04533de8e4b48077f65de61b187e195c0919c41d4543e2263604fa0c50379

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-Clause

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--with-sodium=shared,"$(STAGING_DIR)/opt"

$(eval $(call PECLPackage,sodium,$(PECL_LONGNAME),+libsodium,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
