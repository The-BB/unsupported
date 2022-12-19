# SPDX-License-Identifier: WTFPL
#
# XXX remove feeds/packages/utils/prometheus-statsd-exporter

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-statsd-exporter
PKG_VERSION:=0.23.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/statsd_exporter

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=9c6e2455218b2c7f55944e5d4da65a9757aa8c24
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=7acca9a2f79393b66c5b0effec5398dfbb8baf3fe4af0d7a246a1f86116e01d6

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus-statsd-exporter/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=StatsD to Prometheus metrics exporter
  URL:=https://prometheus.io/
endef

define Package/prometheus-statsd-exporter
  $(call Package/prometheus-statsd-exporter/Default)
  VARIANT:=hf
endef

define Package/prometheus-statsd-exporter_nohf
  $(call Package/prometheus-statsd-exporter/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus-statsd-exporter/description
  statsd_exporter receives StatsD-style metrics and exports them
  as Prometheus metrics.
endef

Package/prometheus-statsd-exporter_nohf/description=$(Package/prometheus-statsd-exporter/description)

define Package/prometheus-statsd-exporter/conffiles
/opt/etc/prometheus/statsd_mapping.yml
endef

Package/prometheus-statsd-exporter_nohf/description=$(Package/prometheus-statsd-exporter/description)

GO_BUILD_ARGS += -trimpath -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-12-07

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo,static_build

define Package/prometheus-statsd-exporter/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/statsd_exporter $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99statsd_exporter $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/etc/prometheus
	$(INSTALL_DATA) files/statsd_mapping.yml $(1)/opt/etc/prometheus
endef

Package/prometheus-statsd-exporter_nohf/description=$(Package/prometheus-statsd-exporter/description)

$(eval $(call BuildPackage,prometheus-statsd-exporter))
$(eval $(call BuildPackage,prometheus-statsd-exporter_nohf))
