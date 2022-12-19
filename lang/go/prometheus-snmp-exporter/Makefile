# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-snmp-exporter
PKG_VERSION:=0.21.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/snmp_exporter

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=0d8c3527cac0c26f1d6005b84b74413d14264c37
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=8202d2ae30639061d3471c9e5ff7643220788ac964aaa2c24abbdc4ae0464330

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus-snmp-exporter/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=SNMP Exporter for Prometheus
  URL:=https://prometheus.io/
endef

define Package/prometheus-snmp-exporter
  $(call Package/prometheus-snmp-exporter/Default)
  VARIANT:=hf
endef

define Package/prometheus-snmp-exporter_nohf
  $(call Package/prometheus-snmp-exporter/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus-snmp-exporter/description
  This exporter is the recommended way to expose SNMP data
  in a format which Prometheus can ingest.
endef

Package/prometheus-snmp-exporter_nohf/description=$(Package/prometheus-snmp-exporter/description)

GO_BUILD_ARGS += -trimpath -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-11-22

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=v$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo

define Package/prometheus-snmp-exporter/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/snmp_exporter $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99snmp_exporter $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/etc/prometheus/snmp_exporter
	$(INSTALL_DATA) $(GO_SRC_DIR)/snmp.yml $(1)/opt/etc/prometheus/snmp_exporter
endef

Package/prometheus-snmp-exporter_nohf/description=$(Package/prometheus-snmp-exporter/description)

$(eval $(call BuildPackage,prometheus-snmp-exporter))
$(eval $(call BuildPackage,prometheus-snmp-exporter_nohf))
