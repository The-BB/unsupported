# SPDX-License-Identifier: WTFPL
#
# XXX mips*: modernc.org/libc/**: build constraints exclude all Go files in ***
# XXX remove feeds/packages/net/cloudreve

include $(TOPDIR)/rules.mk

PKG_NAME:=cloudreve
PKG_VERSION:=3.7.1
PKG_RELEASE:=1

PKG_GOGET:=github.com/cloudreve/Cloudreve

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=f1722208253fd947b286f365a221bd134b23364b
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=b70601111e727d879a709884bc28237861216b99abac02b6f542f5984ddd8c0d

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node-yarn/host

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/cloudreve/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=A project helps you build your own cloud in minutes
  URL:=https://cloudreve.org
  DEPENDS:=@!(mips||mipsel) +ca-bundle
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

define Build/Web
	$(INSTALL_DIR) $(GO_SRC_DIR)/.git/modules/assets

	( cd $(GO_SRC_DIR)/assets; \
		CI=false GENERATE_SOURCEMAP=false \
		yarn install; \
		CI=false GENERATE_SOURCEMAP=false \
		yarn run build; \
		cd $(GO_SRC_DIR); \
		zip -r - assets/build >assets.zip; \
	)
endef

Hooks/Compile/Pre += Build/Web

GIT_COMMIT:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/v3/pkg/conf.BackendVersion=$(PKG_VERSION)' \
	-X '$(PKG_GOGET)/v3/pkg/conf.LastCommit=$(GIT_COMMIT)'

GO_BUILD_ARGS += -trimpath
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
