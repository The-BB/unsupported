#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=ssh2
PECL_LONGNAME:=Bindings for the libssh2 library

PKG_VERSION:=1.1.2
PKG_RELEASE:=1
PKG_HASH:=87618d6a0981afe8c24b36d6b38c21a0aa0237b62e60347d0170bd86b51f79fb

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

CONFIGURE_ARGS += \
	--with-ssh2=$(STAGING_DIR)/opt

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libssh2,20))
$(eval $(call BuildPackage,$(PKG_NAME)))
