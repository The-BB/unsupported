#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=imagick
PECL_LONGNAME:=Provides a wrapper to the ImageMagick library

PKG_VERSION:=3.4.3
PKG_RELEASE:=1
PKG_HASH:=1f3c5b5eeaa02800ad22f506cd100e8889a66b2ec937e192eaaa30d74562567c

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHPv3.01
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS+= \
	--with-imagick=$(STAGING_DIR)/opt

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+imagemagick-jpeg +imagemagick-png +imagemagick-tiff +imagemagick-tools,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
