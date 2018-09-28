#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yaml
PECL_LONGNAME:=YAML-1.1 parser and emitter

PKG_VERSION:=2.0.2
PKG_RELEASE:=1
PKG_HASH:=c3afb0dad47b6c3a5b7b449f57a4938df27bf974efbe188d85c4fb998eff0039

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=MIT

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk


CONFIGURE_ARGS+= \
	--with-yaml=shared,"$(STAGING_DIR)/opt"

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libyaml,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
