#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=apcu
PECL_LONGNAME:=APCu - APC User Cache

PKG_VERSION:=5.1.19
PKG_RELEASE:=1

PKG_NAME:=php7-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/
PKG_HASH:=837fbc99d5c79efb510fafaf585ef0c06e02baf8310a7d77f93e402c93276ce0

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php7/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=PHP-3.01

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php7/pecl.mk

CONFIGURE_ARGS += \
	--enable-apcu

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/opt/include/php7/ext/$(PECL_NAME)
	$(CP) $(PKG_BUILD_DIR)/*.h $(STAGING_DIR)/opt/include/php7/ext/$(PECL_NAME)/
endef

$(eval $(call PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,20))
$(eval $(call BuildPackage,$(PKG_NAME)))
