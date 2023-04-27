# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PECL_NAME:=yaml
PECL_LONGNAME:=YAML-1.1 parser and emitter

PKG_VERSION:=2.2.3
PKG_RELEASE:=1

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get
PKG_HASH:=5937eb9722ddf6d64626799cfa024598ff2452ea157992e4e67331a253f90236

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/php8/pecl.mk

CONFIGURE_ARGS += \
	--with-yaml=shared,"$(STAGING_DIR)/opt"

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libyaml,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
