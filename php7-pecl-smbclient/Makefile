#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=smbclient
PECL_LONGNAME:=A PHP wrapper for libsmbclient

PKG_VERSION:=0.9.0
PKG_RELEASE:=1
PKG_HASH:=368329cf1b9e60750eca470659c7eba6a78e5ce3adfbcc25ce5611006a121a70

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=BSD 2-clause
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS+= \
	--enable-smbclient \
	--with-libsmbclient=$(STAGING_DIR)/opt \
	CPPFLAGS=-I$(STAGING_DIR)/opt/include/samba-36

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+samba36-libsmbclient,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
