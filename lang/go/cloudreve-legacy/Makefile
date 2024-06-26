# SPDX-License-Identifier: WTFPL
#
# XXX v3.7.0+: mips*: modernc.org/libc/**: build constraints exclude all Go files in ***
# XXX remove feeds/packages/net/cloudreve

include $(TOPDIR)/rules.mk

PKG_NAME:=cloudreve
PKG_VERSION:=3.6.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=42a31f2fd1c8f14c14762a6b1c2b67b4bb498ad2
PKG_SOURCE_URL:=https://github.com/cloudreve/Cloudreve
PKG_MIRROR_HASH:=134dc707f8befaa9a193a2b0ae2eb2eebd3c5c70c291b5104bed458c63eedbb7

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

PKG_BUILD_DEPENDS:=node-yarn/host

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/cloudreve-legacy/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=
  TITLE:=A project helps you build your own cloud in minutes
  URL:=https://cloudreve.org
  DEPENDS:=@(mips||mipsel) +ca-bundle
  PROVIDES:=cloudreve
endef

define Package/cloudreve-legacy
  $(call Package/cloudreve-legacy/Default)
  VARIANT:=hf
endef

define Package/cloudreve-legacy_nohf
  $(call Package/cloudreve-legacy/Default)
  VARIANT:=nohf
  DEPENDS+=@arm
endef

define Package/cloudreve-legacy/description
  Self-deployed file management and sharing system, supports multiple
  storage providers.
endef

Package/cloudreve-legacy_nohf/description=$(Package/cloudreve-legacy/description)

define Build/Web
	( cd $(PKG_BUILD_DIR)/assets; \
		CI=false GENERATE_SOURCEMAP=false \
		yarn install; \
		CI=false GENERATE_SOURCEMAP=false \
		yarn run build; \
		cd $(PKG_BUILD_DIR); \
		zip -r - assets/build >assets.zip; \
	)
endef

Hooks/Compile/Pre += Build/Web

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/v3/pkg/conf.BackendVersion=$(PKG_VERSION)' \
	-X '$(XIMPORTPATH)/v3/pkg/conf.LastCommit=$(COMMIT_SHORT)'

GO_VARS += GO111MODULE=on

define Package/cloudreve-legacy/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/Cloudreve $(1)/opt/bin/cloudreve
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99cloudreve $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/var/lib/cloudreve
endef

Package/cloudreve-legacy_nohf/install=$(Package/cloudreve-legacy/install)

$(eval $(call BuildPackage,cloudreve-legacy))
#$(eval $(call BuildPackage,cloudreve-legacy_nohf))
