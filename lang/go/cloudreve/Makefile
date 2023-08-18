# SPDX-License-Identifier: WTFPL
#
# XXX mips*: modernc.org/libc/**: build constraints exclude all Go files in ***
# XXX remove feeds/packages/net/cloudreve

include $(TOPDIR)/rules.mk

PKG_NAME:=cloudreve
PKG_VERSION:=3.8.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ce832bf13d8372a84b993b8f65447bce6eced90a
PKG_SOURCE_URL:=https://github.com/cloudreve/Cloudreve
PKG_MIRROR_HASH:=219139d6928e9af28d04d624b29bf930071fe04f28c5688a64fd9ac4568caa15

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

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

define Package/cloudreve/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/Cloudreve $(1)/opt/bin/cloudreve
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99cloudreve $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/var/lib/cloudreve
endef

Package/cloudreve_nohf/install=$(Package/cloudreve/install)

$(eval $(call BuildPackage,cloudreve))
$(eval $(call BuildPackage,cloudreve_nohf))
