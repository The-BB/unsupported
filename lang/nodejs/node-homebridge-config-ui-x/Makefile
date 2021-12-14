# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=homebridge-config-ui-x
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=4.41.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://registry.npmjs.org/$(PKG_NPM_NAME)/-/
PKG_HASH:=27a4835d32d13d8c156a97b3894d48d49171d02966854447a7bab74ce011c4b9

PKG_BUILD_DEPENDS:=node/host
PKG_USE_MIPS16:=0

PKG_MAINTAINER:=Hirokazu MORIKAWA <morikw2@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/node-homebridge-config-ui-x
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Homebridge Config UI X
  URL:=https://www.npmjs.org/package/homebridge-config-ui-x
  DEPENDS:=+node +node-homebridge +node-pty-prebuilt-multiarch
endef

define Package/node-homebridge-config-ui-x/description
 Homebridge Config UI X is a web based management tool for Homebridge that allows you to manage all aspects of your Homebridge setup.

 Run as root:
    hb-service install --user root -U /opt/share/homebridge
    hb-service restart

 *** The hb-service command is not full compatible with the openwrt environment. ***
 *** You can edit config.json using the Homebridge Config UI X. ***

      See: https://github.com/oznu/homebridge-config-ui-x#configuration
           https://github.com/oznu/homebridge-config-ui-x#logs-from-custom-command

        "platforms": [
            {
              "platform": "config",
              "name": "Config",
              "port": 8581,
              "restart": "/opt/etc/init.d/S98homebridge restart",
            }
        ]
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
	npm install --production --global-style --no-save --omit=dev --no-package-lock
	rm -rf $(TMP_DIR)/npm-tmp-$(TMPNPM)
	rm -rf $(TMP_DIR)/npm-cache-$(TMPNPM)
	rm -f $(PKG_BUILD_DIR)/node_modules/.package-lock.json
	find $(PKG_BUILD_DIR)/node_modules -type d -empty -print0 | xargs -0 rmdir || true
endef

define Package/node-homebridge-config-ui-x/install
	$(INSTALL_DIR) $(1)/opt/lib/node/$(PKG_NPM_NAME)
	$(CP) $(PKG_BUILD_DIR)/{*.json,*.md} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(CP) $(PKG_BUILD_DIR)/{node_modules,dist,public} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(CP) $(PKG_BUILD_DIR)/{LICENSE,*.js} \
		$(1)/opt/lib/node/$(PKG_NPM_NAME)/
	$(INSTALL_DIR) $(1)/opt/bin
	$(LN) ../lib/node/$(PKG_NPM_NAME)/dist/bin/hb-service.js $(1)/opt/bin/hb-service
	$(LN) ../lib/node/$(PKG_NPM_NAME)/dist/bin/standalone.js $(1)/opt/bin/homebridge-config-ui-x
	$(CP) ./files/entware.js $(1)/opt/lib/node/$(PKG_NPM_NAME)/dist/bin/platforms/
	$(INSTALL_DIR) $(1)/opt/lib/node_modules
	$(LN) ../node/$(PKG_NPM_NAME) $(1)/opt/lib/node_modules/$(PKG_NPM_NAME)
	chmod +x $(1)/opt/lib/node/$(PKG_NPM_NAME)/dist/bin/hb-service.js
	chmod +x $(1)/opt/lib/node/$(PKG_NPM_NAME)/dist/bin/standalone.js
	# Entware specific: fix exec path in scripts
	$(FIND) $(1)/opt/lib/node/$(PKG_NPM_NAME) -type f -exec $(SED) \
		's,^#!.*bash$$$$,#!/opt/bin/bash,;s,^#!.*node$$$$,#!/opt/bin/node,' {} +
	$(INSTALL_DIR) $(1)/opt/var/log
	touch $(1)/opt/var/log/homebridge.log
endef

$(eval $(call BuildPackage,node-homebridge-config-ui-x))
