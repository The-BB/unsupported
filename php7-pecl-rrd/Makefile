#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=rrd
PECL_LONGNAME:=PHP bindings to rrd tool system

PKG_VERSION:=2.0.1
PKG_RELEASE:=1
PKG_HASH:=39f5ae515de003d8dad6bfd77db60f5bd5b4a9f6caa41479b1b24b0d6592715d

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=BSD

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk


CONFIGURE_ARGS+= \
	--with-rrd=shared,"$(STAGING_DIR)/opt"

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+rrdtool,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
