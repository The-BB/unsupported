# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nginx-ui
PKG_VERSION:=2.0.0-beta.18
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-03-14
PKG_SOURCE_VERSION:=979a1d5326b27924c3e6c5c5fae808394057c368
PKG_SOURCE_URL:=https://github.com/0xJacky/nginx-ui
PKG_MIRROR_HASH:=1438e775c8a6b1fbb0e2111add910697653ae4e922eb88329c5ab2e9c7247339

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_DEPENDS:=node-pnpm/host

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/nginx-ui/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Yet another WebUI for Nginx
  URL:=https://nginxui.com
  DEPENDS:=+nginx
endef

define Package/nginx-ui
  $(call Package/nginx-ui/Default)
  VARIANT:=hf
endef

define Package/nginx-ui_nohf
  $(call Package/nginx-ui/Default)
  VARIANT:=nohf
  DEPENDS+=@arm
endef

define Package/nginx-ui/description
  Yet another WebUI for Nginx.
endef

Package/nginx-ui_nohf/description=$(Package/nginx-ui/description)

define Package/nginx-ui/conffiles
/opt/etc/nginx-ui/app.ini
endef

Package/nginx-ui_nohf/conffiles=$(Package/nginx-ui/conffiles)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/server/settings.buildTime=$(PKG_SOURCE_DATE)'

GO_TAGS:=-tags=jsoniter

define BuildFrontend
	( cd $(PKG_BUILD_DIR)/app; pnpm install; pnpm build; )
endef
Hooks/Compile/Pre += BuildFrontend

define Package/nginx-ui/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S81nginx-ui $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/etc/nginx-ui
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/app.example.ini \
		$(1)/opt/etc/nginx-ui/app.ini
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/Nginx-UI $(1)/opt/sbin/nginx-ui
endef

Package/nginx-ui_nohf/install=$(Package/nginx-ui/install)

$(eval $(call BuildPackage,nginx-ui))
$(eval $(call BuildPackage,nginx-ui_nohf))
