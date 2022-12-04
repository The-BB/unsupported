# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/utils/prometheus

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus
PKG_VERSION:=2.40.5
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/prometheus

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=44af4716c86138869aa621737139e6dacf0e2550
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=169508f6fa4f8100f22ebe972865d3ee6d38c148c8e31913759ff6457505b3db

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Monitoring system and time series database
  URL:=http://prometheus.io
endef

define Package/prometheus
  $(call Package/prometheus/Default)
  VARIANT:=hf
endef

define Package/prometheus_nohf
  $(call Package/prometheus/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus/description
  Prometheus, a Cloud Native Computing Foundation project,
  is a systems and service monitoring system. It collects
  metrics from configured targets at given intervals, evaluates
  rule expressions, displays the results, and can trigger alerts
  when specified conditions are observed.
endef

Package/prometheus_nohf/description=$(Package/prometheus/description)

define Package/prometheus/conffiles
/opt/etc/prometheus/prometheus.yml
endef

Package/prometheus_nohf/description=$(Package/prometheus/description)

GO_BUILD_ARGS:=-a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=v$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE_EPOCH)'

GO_TAGS:=-tags=netgo,builtinassets

GO_TARGET:=./cmd/...

GO_VARS += GO111MODULE=on

define Build/CompilePre
	( cd $(GO_SRC_DIR)/web/ui; \
		npm install; \
		CI="" npm run build; \
		npm run build:module; \
	)
	( cd $(GO_SRC_DIR); $(SHELL) scripts/compress_assets.sh; )
	( cd $(GO_SRC_DIR); $(SHELL) scripts/package_assets.sh; )
	( cd $(GO_SRC_DIR); $(GO_BIN) generate -tags plugins ./plugins; )
endef

Hooks/Compile/Pre += Build/CompilePre

define Package/prometheus/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/prom{etheus,tool} $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/prometheus
	$(INSTALL_DATA) \
		$(GO_SRC_DIR)/documentation/examples/prometheus.yml \
			$(1)/opt/etc/prometheus

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S70prometheus $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/var/lib/prometheus
endef

Package/prometheus_nohf/description=$(Package/prometheus/description)

$(eval $(call BuildPackage,prometheus))
$(eval $(call BuildPackage,prometheus_nohf))
