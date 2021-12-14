# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=zigbee2mqtt
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=1.22.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://registry.npmjs.org/$(PKG_NPM_NAME)/-/
PKG_HASH:=2b0376248a891662626a9f8429cabac5e2eb7bb1054f6cbdf37a936b16bc9ac2

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

TAR_OPTIONS+= --strip-components 1
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))
TMPNPM:=$(shell mktemp -u XXXXXXXXXX)

TARGET_CFLAGS += $(FPIC)
TARGET_CXXFLAGS += $(FPIC)

define Build/Compile
	cd $(PKG_BUILD_DIR); \
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_nodedir=$(STAGING_DIR)/opt/ \
	npm_config_cache=$(TMP_DIR)/npm-cache-$(TMPNPM) \
	npm_config_tmp=$(TMP_DIR)/npm-tmp-$(TMPNPM) \
	npm install --production --global-style --no-save --omit=dev --no-package-lock --build-from-source --target_arch=$(NODEJS_CPU) --prefer-dedupe
	rm $(PKG_BUILD_DIR)/node_modules/zigbee-herdsman/npm-shrinkwrap.json
	rm $(PKG_BUILD_DIR)/node_modules/zigbee-herdsman-converters/npm-shrinkwrap.json
	rm -f $(PKG_BUILD_DIR)/node_modules/zigbee2mqtt-frontend/dist/report.html
	rm -f $(PKG_BUILD_DIR)/node_modules/zigbee2mqtt-frontend/dist/*.map
	rm -f $(PKG_BUILD_DIR)/node_modules/zigbee2mqtt-frontend/dist/*/*.map
	rm -rf $(PKG_BUILD_DIR)/node_modules/zigbee-herdsman-converters/node_modules/zigbee-herdsman
	rm -rf $(PKG_BUILD_DIR)/node_modules/moment/min
	rm -rf $(PKG_BUILD_DIR)/node_modules/moment/src
	rm -rf $(PKG_BUILD_DIR)/node_modules/moment/locale
	rm -rf $(TMP_DIR)/npm-tmp-$(TMPNPM)
	rm -rf $(TMP_DIR)/npm-cache-$(TMPNPM)
	rm -f $(PKG_BUILD_DIR)/node_modules/.package-lock.json
	find $(PKG_BUILD_DIR)/node_modules -type d -empty -delete || true
endef

define Package/node-zigbee2mqtt/install
	$(INSTALL_DIR) $(1)/opt/lib/node/$(PKG_NPM_NAME)
	$(CP) $(PKG_BUILD_DIR)/{package.json,LICENSE} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(CP) $(PKG_BUILD_DIR)/{*.md,*.js} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(CP) $(PKG_BUILD_DIR)/{node_modules,dist} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(CP) $(PKG_BUILD_DIR)/{data,scripts} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(INSTALL_DIR) $(1)/opt/lib/node_modules
	$(LN) ../node/$(PKG_NPM_NAME) $(1)/opt/lib/node_modules/$(PKG_NPM_NAME)
	$(INSTALL_DIR) $(1)/opt/bin
	$(LN) ../lib/node/$(PKG_NPM_NAME)/cli.js $(1)/opt/bin/$(PKG_NPM_NAME)
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99zigbee2mqtt $(1)/opt/etc/init.d
	# XXX fix exec path in scripts
	$(FIND) $(1)/opt/lib -type f -exec $(SED) \
		's,^#!.*bash,#!/opt/bin/bash,;s,^#!.*node$$$$,#!/opt/bin/node,;s,^#!.* sh,#!/bin/sh,' {} +
	$(INSTALL_DIR) $(1)/opt/var/lib/.z2m
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/data/configuration.yaml $(1)/opt/var/lib/.z2m
endef

define Package/node-zigbee2mqtt/preinst
#!/bin/sh

if [ -L "/opt/lib/node_modules/zigbee2mqtt" ]; then
  rm -f /opt/lib/node_modules/zigbee2mqtt
fi
endef

define Package/node-zigbee2mqtt/postinst
#!/bin/sh

echo -e "\n\t*** Please install zigbee2mqtt dependencies manually ***\n\n \
	\t\"npm install -g typescript winston-transport\"\n"
echo -en "\tDo you wish to install them now? [y]: "

read -r wish_to_install
[ -z "$$wish_to_install" ] && wish_to_install=y
if [ "$$wish_to_install" = "y" ]; then
  for deps in typescript winston-transport; do
    npm install -g $$deps
  done
fi
if [ -f "/opt/lib/node_modules/typescript/bin/tsc" ]; then
  sed -i -e 's,^#!.*node,#!/opt/bin/node,' /opt/lib/node_modules/typescript/bin/ts*
fi
endef

$(eval $(call BuildPackage,node-zigbee2mqtt))
