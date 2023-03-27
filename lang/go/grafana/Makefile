# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=grafana
PKG_VERSION:=9.4.7
PKG_RELEASE:=1

PKG_GOGET:=github.com/grafana/grafana

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=4add91f03d3bf455b4eb8160c86c50030cbb823c
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=8f04db860641d7d38873877a0551325f8c3de77d2c15b638e51b5f4df595fefe

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE LICENSING.md

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node-yarn/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/grafana/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=prometheus tools
  TITLE:=platform for monitoring and observability
  URL:=https://grafana.com
endef

define Package/grafana
  $(call Package/grafana/Default)
  VARIANT:=hf
endef

define Package/grafana_nohf
  $(call Package/grafana/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/grafana/description
  The open and composable observability and data visualization
  platform. Visualize metrics, logs, and traces from multiple
  sources like Prometheus, Loki, Elasticsearch, InfluxDB, Postgres
  and many more. 
endef

Package/grafana_nohf/description=$(Package/grafana/description)

GIT_HASH:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -8)
SOURCE_DATE:=2023-03-22

GO_LDFLAGS += \
	-X 'main.version=$(PKG_VERSION)' \
	-X 'main.commit=$(GIT_HASH)' \
	-X 'main.buildstamp=$(SOURCE_DATE)' \
	-X 'main.buildBranch=main'

GO_BUILD_ARGS += -trimpath
GO_TARGET:=./pkg/cmd/grafana ./pkg/cmd/grafana-cli ./pkg/cmd/grafana-server

define Build/Deps
	# FIXME husky - .git can't be found
	$(INSTALL_DIR) $(GO_SRC_DIR)/.git

	# install frontend dependencies
	( cd $(GO_SRC_DIR); \
		YARN_ENABLE_PROGRESS_BARS=false YARN_CHECKSUM_BEHAVIOR=update \
		yarn install --immutable; \
	)
	# wire-host
	( cd $(GO_SRC_DIR)/.bingo; \
		GOWORK=off $(GO_BIN) build -mod=mod -modfile=wire.mod \
		-o=$(GO_SRC_DIR)/wire-host "github.com/google/wire/cmd/wire"; \
	)
	# generate code from .cue files
	( cd $(GO_SRC_DIR); \
		$(GO_BIN) generate ./pkg/plugins/plugindef; \
		$(GO_BIN) generate ./kinds/gen.go; \
		$(GO_BIN) generate ./public/app/plugins/gen.go; \
		$(GO_BIN) generate ./pkg/kindsys/report.go; \
	)
	# generate go files
	( cd $(GO_SRC_DIR); \
		PATH="$(GOROOT)/bin:$$PATH" \
		$(GO_SRC_DIR)/wire-host gen -tags "oss" ./pkg/server ./pkg/cmd/grafana-cli/runner; \
	)
endef

Hooks/Compile/Pre += Build/Deps

define Build/Web
	# build frontend
	# FIXME JavaScript heap out of memory
	( cd $(GO_SRC_DIR); \
		NODE_OPTIONS=--max_old_space_size=8000 yarn run build; \
	)
	( cd $(GO_SRC_DIR)/plugins-bundled/internal/input-datasource; \
		yarn run build; \
	)
endef

Hooks/Compile/Post += Build/Web

define Package/grafana/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/grafana{,-cli,-server} $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/grafana
	$(CP) $(GO_SRC_DIR)/conf/sample.ini $(1)/opt/etc/grafana/grafana.ini
	$(CP) $(GO_SRC_DIR)/conf/ldap.toml $(1)/opt/etc/grafana
	$(CP) $(GO_SRC_DIR)/conf/provisioning $(1)/opt/etc/grafana

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S80grafana $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/share/grafana
	$(CP) $(GO_SRC_DIR)/{conf,public} $(1)/opt/share/grafana

	$(INSTALL_DIR) $(1)/opt/share/grafana/plugins-bundled/internal/input-datasource
	$(CP) $(GO_SRC_DIR)/plugins-bundled/internal/input-datasource/dist/* \
		$(1)/opt/share/grafana/plugins-bundled/internal/input-datasource

	# XXX remove *.map
	$(FIND) $(1)/opt/share/grafana -type f -a -iname "*.map" -delete

	$(INSTALL_DIR) $(1)/opt/var/lib/grafana/plugins
	$(INSTALL_DIR) $(1)/opt/var/log/grafana
endef

Package/grafana_nohf/install=$(Package/grafana/install)

$(eval $(call BuildPackage,grafana))
$(eval $(call BuildPackage,grafana_nohf))
