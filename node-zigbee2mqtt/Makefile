# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=zigbee2mqtt
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=1.18.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://registry.npmjs.org/$(PKG_NPM_NAME)/-/
PKG_HASH:=6a2bf71a3d6e73d8da167e4f87af341d59f4cf40e94d2eefefc3c79d708a52f4

PKG_LICENSE:=GPL-3.0-only

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node/host

include $(INCLUDE_DIR)/package.mk

define Package/node-zigbee2mqtt
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Zigbee to MQTT bridge using zigbee-shepherd
  URL:=https://www.zigbee2mqtt.io
  DEPENDS:=+node-npm
endef

define Package/node-zigbee2mqtt/description
  Allows you to use your Zigbee devices without the vendors bridge or gateway.
 It bridges events and allows you to control your Zigbee devices via MQTT.
 In this way you can integrate your Zigbee devices with whatever smart home
 infrastructure you are using.
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
	npm install -g --production $(DL_DIR)/$(PKG_SOURCE)
	rm -rf $(TMP_DIR)/npm-tmp-$(TMPNPM)
	rm -rf $(TMP_DIR)/npm-cache-$(TMPNPM)
endef

define Package/node-zigbee2mqtt/install
	$(INSTALL_DIR) $(1)/opt/lib/node_modules
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/node_modules/$(PKG_NPM_NAME) $(1)/opt/lib/node_modules/
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
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/node_modules/zigbee2mqtt/data/configuration.yaml \
		$(1)/opt/var/lib/.z2m
endef

$(eval $(call BuildPackage,node-zigbee2mqtt))
