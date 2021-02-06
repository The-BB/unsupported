#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=zigbee2mqtt
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=1.17.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://registry.npmjs.org/$(PKG_NPM_NAME)/-/
PKG_HASH:=620f3531db9886c4f6b3d6d3615846f4aab4284e436755233029a3d9b050e60e

PKG_BUILD_DEPENDS:=node/host
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0-only

include $(INCLUDE_DIR)/package.mk

define Package/node-zigbee2mqtt
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Zigbee to MQTT bridge
  URL:=https://www.zigbee2mqtt.io
  DEPENDS:=+node-npm
endef

define Package/node-zigbee2mqtt/description
  Allows you to use your Zigbee devices without the vendors bridge or gateway.
endef

define Package/node-zigbee2mqtt/conffiles
/opt/var/lib/.z2m/configuration.yaml
endef

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))
TMPNPM:=$(shell mktemp -u XXXXXXXXXX)

TARGET_CFLAGS += $(FPIC)
TARGET_CXXFLAGS += $(FPIC)

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
endef

define Build/Compile
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_arch=$(NODEJS_CPU) \
	npm_config_target_arch=$(NODEJS_CPU) \
	npm_config_build_from_source=true \
	npm_config_nodedir=$(STAGING_DIR)/opt \
	npm_config_prefix=$(PKG_INSTALL_DIR)/opt \
	npm_config_cache=$(TMP_DIR)/npm-cache-$(TMPNPM) \
	npm_config_tmp=$(TMP_DIR)/npm-tmp-$(TMPNPM) \
	npm install -g $(DL_DIR)/$(PKG_SOURCE)
	rm -rf $(TMP_DIR)/npm-tmp-$(TMPNPM)
	rm -rf $(TMP_DIR)/npm-cache-$(TMPNPM)
endef

define Package/node-zigbee2mqtt/install
	$(INSTALL_DIR) $(1)/opt/lib/node_modules
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/node_modules/* $(1)/opt/lib/node_modules/
	$(INSTALL_DIR) $(1)/opt/bin
	$(LN) ../lib/node_modules/zigbee2mqtt/cli.js $(1)/opt/bin/zigbee2mqtt
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99zigbee2mqtt $(1)/opt/etc/init.d
	# XXX fix exec path in scripts
	$(FIND) $(1)/opt/lib -type f -exec $(SED) \
		's,^#!.*bash,#!/opt/bin/bash,; \
		 s,^#!.*node$$$$,#!/opt/bin/node,; \
		 s,^#!.* sh,#!/bin/sh,' {} +
	$(INSTALL_DIR) $(1)/opt/var/lib/.z2m
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/node_modules/zigbee2mqtt/data/* \
		$(1)/opt/var/lib/.z2m
endef

$(eval $(call BuildPackage,node-zigbee2mqtt))
