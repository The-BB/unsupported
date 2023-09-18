# SPDX-License-Identifier: WTFPL

# XXX remove feeds/packages/net/xray-core

include $(TOPDIR)/rules.mk

PKG_NAME:=Xray-core
PKG_VERSION:=1.8.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=f7c20b85dcbd6c2e8acf2589dfaef8a448daf337
PKG_SOURCE_URL:=https://github.com/XTLS/Xray-core
PKG_MIRROR_HASH:=d72a4f6d7a7e832023d185718cdef4f6f31c590ef0782adc1d932eee7843dfe2

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/xray-core/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Set of network penetration tools
  URL:=https://github.com/XTLS/Xray-core
  DEPENDS:=+ca-bundle
endef

define Package/xray-core
  $(call Package/xray-core/Default)
  VARIANT:=hf
endef

define Package/xray-core_nohf
  $(call Package/xray-core/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/xray-core/description
  Xray, Penetrates Everything. Also the best v2ray-core, with XTLS support.
  Fully compatible configuration.
endef

Package/xray-core_nohf/description=$(Package/xray-core/description)

define Package/xray-core/conffiles
/opt/etc/xray/config.json
endef

Package/xray-core_nohf/conffiles=$(Package/xray-core/conffiles)

GO_LDFLAGS += -buildid=

GO_BUILD_ARGS += -a

GO_TARGET:=./main

define Package/xray-core/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/main $(1)/opt/sbin/xray
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S24xray $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/etc/xray
	$(INSTALL_CONF) ./files/config.json.example $(1)/opt/etc/xray/config.json
	$(INSTALL_DIR) $(1)/opt/share/xray
	$(INSTALL_DIR) $(1)/opt/var/log/xray
endef

Package/xray-core_nohf/install=$(Package/xray-core/install)

define Package/xray-core/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0;0m"

URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download"

printf "$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "download/install geodat manually:"
printf "\t %s \n" "wget -O /opt/share/xray/geoip.dat $$URL/geoip.dat"
printf "\t %s \n" "wget -O /opt/share/xray/geosite.dat $$URL/geosite.dat"
printf "\t$$ansi_white%s$$ansi_std\n" "or"
printf "\t %s \n" "opkg install v2ray-geoip v2ray-geosite"
endef

Package/xray-core_nohf/postinst=$(Package/xray-core/postinst)

$(eval $(call BuildPackage,xray-core))
$(eval $(call BuildPackage,xray-core_nohf))
