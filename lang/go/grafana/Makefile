# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=grafana
PKG_VERSION:=9.3.1
PKG_RELEASE:=1

PKG_GOGET:=github.com/grafana/grafana

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=89b365f8b17d5b1852dffa40df2f90994564fe22
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=d0e66a41224825dbc739435e5a51c2ce806a07b5a57eca5ee59b7f8070f316b1

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

GO_LDFLAGS += \
	-X 'main.version=$(PKG_VERSION)' \
	-X 'main.commit=$(GIT_HASH)' \
	-X 'main.buildstamp=$(SOURCE_DATE_EPOCH)' \
	-X 'main.buildBranch=main'

GO_TARGET:=./pkg/cmd/grafana-cli ./pkg/cmd/grafana-server

define Build/Deps
	$(INSTALL_DIR) $(GO_SRC_DIR)/.git

	( cd $(GO_SRC_DIR); \
		YARN_ENABLE_PROGRESS_BARS=false YARN_CHECKSUM_BEHAVIOR=update \
		yarn install --immutable; \
	)
	( cd $(GO_SRC_DIR); \
		$(GO_BIN) build -mod=mod -modfile=.bingo/swagger.mod \
		-o=$(GO_SRC_DIR)/swagger-host "github.com/go-swagger/go-swagger/cmd/swagger"; \
		\
		$(GO_BIN) build -mod=mod -modfile=.bingo/wire.mod \
		-o=$(GO_SRC_DIR)/wire-host "github.com/google/wire/cmd/wire"; \
	)
	( cd $(GO_SRC_DIR); \
		PATH="$(GOROOT)/bin:$$$$PATH" SWAGGER_GENERATE_EXTENSION=false \
		$(GO_SRC_DIR)/swagger-host generate spec -m -w pkg/server -o public/api-spec.json \
		-x "$(PKG_GOGET)/pkg/services/ngalert/api/tooling/definitions" \
		-x "github.com/prometheus/alertmanager" -i pkg/api/swagger_tags.json --exclude-tag=alpha; \
	)
	( cd $(GO_SRC_DIR)/pkg/services/ngalert/api/tooling; \
		PATH="$(GOROOT)/bin:$$$$PATH" SWAGGER_GENERATE_EXTENSION=false \
		$(GO_SRC_DIR)/swagger-host generate spec -m -w definitions -o spec.json; \
		PATH="$(GOROOT)/bin:$$$$PATH" SWAGGER_GENERATE_EXTENSION=false \
		$(GO_SRC_DIR)/swagger-host generate spec -m --include-tag=stable -o spec-stable.json; \
		$(GO_BIN) run cmd/clean-swagger/main.go -if spec-stable.json -of api.json; \
	)
	( cd $(GO_SRC_DIR); \
		PATH="$(GOROOT)/bin:$$$$PATH" $(GO_SRC_DIR)/swagger-host mixin public/api-spec.json \
			pkg/services/ngalert/api/tooling/api.json --ignore-conflicts \
			-o public/api-merged.json; \
	)
	( cd $(GO_SRC_DIR); \
		$(GO_BIN) run scripts/openapi3/openapi3conv.go public/api-merged.json public/openapi3.json; \
	)
	( cd $(GO_SRC_DIR); \
		$(GO_BIN) generate ./pkg/plugins/plugindef; \
		$(GO_BIN) generate ./kinds/gen.go; \
		$(GO_BIN) generate ./pkg/framework/coremodel; \
		$(GO_BIN) generate ./public/app/plugins; \
	)
	( cd $(GO_SRC_DIR); \
		PATH="$(GOROOT)/bin:$$$$PATH" \
		$(GO_SRC_DIR)/wire-host gen -tags "oss" ./pkg/server ./pkg/cmd/grafana-cli/runner; \
	)
	( cd $(GO_SRC_DIR); $(GO_BIN) generate ./devenv/jsonnet; )
endef

Hooks/Compile/Pre += Build/Deps

define Build/Web
	# XXX fix JavaScript heap out of memory
	( cd $(GO_SRC_DIR); \
		NODE_OPTIONS=--max_old_space_size=8096 \
		GENERATE_SOURCEMAP=false yarn run build; \
	)
	( cd $(GO_SRC_DIR)/plugins-bundled/internal/input-datasource; \
		GENERATE_SOURCEMAP=false yarn run build; \
	)
endef

Hooks/Compile/Post += Build/Web

define Package/grafana/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/grafana-{cli,server} $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/grafana
	$(CP) $(GO_SRC_DIR)/conf/sample.ini $(1)/opt/etc/grafana/grafana.ini

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S80grafana-server $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/share/grafana
	$(CP) $(GO_SRC_DIR)/{conf,public} $(1)/opt/share/grafana

	$(INSTALL_DIR) $(1)/opt/share/grafana/plugins-bundled/internal/input-datasource
	$(CP) $(GO_SRC_DIR)/plugins-bundled/internal/input-datasource/dist/* \
		$(1)/opt/share/grafana/plugins-bundled/internal/input-datasource

	$(INSTALL_DIR) $(1)/opt/var/lib/grafana/plugins
	$(INSTALL_DIR) $(1)/opt/var/log/grafana
endef

Package/grafana_nohf/description=$(Package/grafana/description)

$(eval $(call BuildPackage,grafana))
$(eval $(call BuildPackage,grafana_nohf))
