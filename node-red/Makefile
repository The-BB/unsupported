#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=node-red
PKG_NAME:=$(PKG_NPM_NAME)
PKG_VERSION:=1.2.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://registry.npmjs.org/$(PKG_NPM_NAME)/-/
PKG_HASH:=ce7984f40a9bbb8342faeaefc8d863de4807ddf84953078d459e8b7209a8ca4d

PKG_BUILD_DEPENDS:=node/host
PKG_USE_MIPS16:=0

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/node-red
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node-RED is a programming tool
  URL:=https://nodered.org
  DEPENDS:=+node-npm
endef

define Package/node-red/description
 Low-code programming for event-driven applications.
endef

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))
TMPNPM:=$(shell mktemp -u XXXXXXXXXX)

TARGET_CFLAGS+=$(FPIC)

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
endef

define Build/Compile
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_arch=$(NODEJS_CPU) \
	npm_config_target_arch=$(NODEJS_CPU) \
	npm_config_build_from_source=true \
	npm_config_nodedir=$(STAGING_DIR)/opt/ \
	npm_config_prefix=$(PKG_INSTALL_DIR)/opt/ \
	npm_config_cache=$(TMP_DIR)/npm-cache-$(TMPNPM) \
	npm_config_tmp=$(TMP_DIR)/npm-tmp-$(TMPNPM) \
	npm install -g $(DL_DIR)/$(PKG_SOURCE)
	rm -rf $(TMP_DIR)/npm-tmp-$(TMPNPM)
	rm -rf $(TMP_DIR)/npm-cache-$(TMPNPM)
endef

define Package/node-red/install
	$(INSTALL_DIR) $(1)/opt/lib/node_modules
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/node_modules/* $(1)/opt/lib/node_modules/
	$(INSTALL_DIR) $(1)/opt/bin
	$(LN) ../lib/node_modules/node-red/red.js $(1)/opt/bin/node-red
	$(LN) ../lib/node_modules/node-red/bin/node-red-pi $(1)/opt/bin/node-red-pi
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99node-red $(1)/opt/etc/init.d
	# XXX fix exec path in scripts
	$(FIND) $(1)/opt/lib -type f -exec \
	$(SED) \
	    's,^#!.*bash$$$$,#!/opt/bin/bash,;s,^#!.*node$$$$,#!/opt/bin/node,' {} \;
	$(SED) 's,^#!.*node,#!/opt/bin/node,' \
	    $(1)/opt/lib/node_modules/node-red/node_modules/bcryptjs/bin/bcrypt
	$(SED) 's,^exec .*node,exec /opt/bin/node,' \
	    $(1)/opt/lib/node_modules/node-red/bin/node-red-pi
	$(SED) 's,^#!.*sh,#!/bin/sh,' \
	    $(1)/opt/lib/node_modules/node-red/node_modules/ajv/scripts/prepare-tests
endef

$(eval $(call BuildPackage,node-red))
