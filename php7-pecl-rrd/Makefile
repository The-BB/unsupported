#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=rrd
PECL_LONGNAME:=PHP bindings to rrd tool system

PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=39f5ae515de003d8dad6bfd77db60f5bd5b4a9f6caa41479b1b24b0d6592715d

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-2-Clause

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

RRDTOOL_VER=$(shell grep ^PKG_VER ../rrdtool-latest/Makefile | cut -f2 -d"=")

CONFIGURE_ARGS+= \
	PKG_CONFIG_LIBDIR='$(STAGING_DIR)/opt/tmp/rrdtool-$(RRDTOOL_VER)/lib/pkgconfig'

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+rrdtool-latest,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
