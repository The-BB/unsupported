#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=lua
PECL_LONGNAME:=Embedded lua interpreter

PKG_VERSION:=2.0.5
PKG_RELEASE:=1
PKG_HASH:=bb49431ce5494ebebba98d9c477537df97234e13d4bd46529809ca1a2b8c287e

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHPv3.01

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk


CONFIGURE_ARGS+= \
	--with-lua=shared,"$(STAGING_DIR)/opt"

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+liblua,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
