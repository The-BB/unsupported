# SPDX-License-Identifier: WTFPL
#
# XXX mips*: modernc.org/libc/**: build constraints exclude all Go files in ***

include $(TOPDIR)/rules.mk

PKG_NAME:=promlens
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/promlens

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=759372f2207b1c8e46c210e822b5e8fdc92ea6a7
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=ad567a1cba0ff5c5cf429908f2a3d9ef017d51865f69a6a8037f45f156e712e2

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/promlens/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The query builder, analyzer, and explainer for PromQL
  URL:=http://prometheus.io
  DEPENDS:=@!(mips||mipsel)
endef

define Package/promlens
  $(call Package/promlens/Default)
  VARIANT:=hf
endef

define Package/promlens_nohf
  $(call Package/promlens/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/promlens/description
  PromLens is a web-based PromQL query builder, analyzer, and visualizer.
endef

Package/promlens_nohf/description=$(Package/promlens/description)

GO_BUILD_ARGS += -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-12-05

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=v$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo,builtinassets

GO_TARGET:=./cmd/promlens

define Build/CompilePre
	( cd $(GO_SRC_DIR)/app; \
		CI=false PUBLIC_URL=. npm install; \
		CI=false PUBLIC_URL=. npm run build; \
	)
	( cd $(GO_SRC_DIR); $(SHELL) scripts/compress_assets.sh; )
endef

Hooks/Compile/Pre += Build/CompilePre

define Package/promlens/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/promlens $(1)/opt/bin
endef

Package/promlens_nohf/install=$(Package/promlens/install)

$(eval $(call BuildPackage,promlens))
$(eval $(call BuildPackage,promlens_nohf))
