#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=libsodium
PECL_LONGNAME:=Wrapper for the Sodium cryptographic library

PKG_VERSION:=2.0.11
PKG_RELEASE:=1
PKG_HASH:=ab3992a2f1188e713d8036f00ea600a1ec956df8563476d690d30f142d7a59b0

PKG_NAME:=php7-pecl-sodium
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=BSD 2-Clause

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk


CONFIGURE_ARGS += \
	--with-sodium=shared,"$(STAGING_DIR)/opt"

$(eval $(call PECLPackage,sodium,$(PECL_LONGNAME),+libsodium,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
