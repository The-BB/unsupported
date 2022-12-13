# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/net/cloudreve

include $(TOPDIR)/rules.mk

PKG_NAME:=cloudreve
PKG_VERSION:=3.5.3
PKG_RELEASE:=1

PKG_GOGET:=github.com/cloudreve/Cloudreve

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=0e5683bc3b102a474b03992eb7932ac12643bcd1
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=c43ec528df19d239b06456e78aae3d9852da5cca372c157b62f1f74b03f5cc0d

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node-yarn/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/cloudreve/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=A project helps you build your own cloud in minutes
  URL:=https://cloudreve.org
  DEPENDS:=+ca-bundle
endef

define Package/cloudreve
  $(call Package/cloudreve/Default)
  VARIANT:=hf
endef

define Package/cloudreve_nohf
  $(call Package/cloudreve/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/cloudreve/description
  Self-deployed file management and sharing system, supports multiple
  storage providers.
endef

Package/cloudreve_nohf/description=$(Package/cloudreve/description)

#define Download/frontend
#  VERSION:=e432a81328c577a22698924f9703a6c684eb66d0
#  SUBDIR:=assets
#  FILE:=frontend-$$(VERSION).tar.xz
#  URL:=https://github.com/cloudreve/frontend.git
#  MIRROR_HASH:=9364558948a97c0c30ebd41e769b5ccee856249565ef7fbb37e8845a4c28cf3f
#  PROTO:=git
#endef

#$(eval $(call Download,frontend))

#define Prepare/frontend
#	$(eval $(Download/frontend))
#	xzcat $(DL_DIR)/$(FILE) | tar -C $(GO_SRC_DIR) $(TAR_OPTIONS)
#endef

define Build/Web
#	$(Prepare/frontend)

	( cd $(GO_SRC_DIR)/assets; \
		yarn install; \
		yarn run build; \
		find ./build -name "*.map" -type f -delete; \
		cd $(GO_SRC_DIR); \
		zip -r - assets/build >assets.zip; \
	)
endef

Hooks/Compile/Pre += Build/Web

GIT_COMMIT:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/v3/pkg/conf.BackendVersion=$(PKG_VERSION)' \
	-X '$(PKG_GOGET)/v3/pkg/conf.LastCommit=$(GIT_COMMIT)'

GO_VARS += GO111MODULE=on

define Package/cloudreve/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/Cloudreve $(1)/opt/bin/cloudreve
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99cloudreve $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/var/lib/cloudreve
endef

Package/cloudreve_nohf/install=$(Package/cloudreve/install)

$(eval $(call BuildPackage,cloudreve))
$(eval $(call BuildPackage,cloudreve_nohf))
