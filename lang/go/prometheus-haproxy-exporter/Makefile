# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-haproxy-exporter
PKG_VERSION:=0.14.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/haproxy_exporter

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=01f3f215eb2a9d7872df6b730d9037d3c68cfe56
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=51870c1f94b9d2c1d1c5f0b9af9a2d224b3a619a3f9e529727b6e9f38e71139c

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus-haproxy-exporter/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=HAProxy Exporter for Prometheus
  URL:=https://prometheus.io/
endef

define Package/prometheus-haproxy-exporter
  $(call Package/prometheus-haproxy-exporter/Default)
  VARIANT:=hf
endef

define Package/prometheus-haproxy-exporter_nohf
  $(call Package/prometheus-haproxy-exporter/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus-haproxy-exporter/description
  Simple server that scrapes HAProxy stats and exports
  them via HTTP for Prometheus consumption.
endef

Package/prometheus-haproxy-exporter_nohf/description=$(Package/prometheus-haproxy-exporter/description)

GO_BUILD_ARGS += -trimpath -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-11-29

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo

define Package/prometheus-haproxy-exporter/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/haproxy_exporter $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99haproxy_exporter $(1)/opt/etc/init.d
endef

Package/prometheus-haproxy-exporter_nohf/description=$(Package/prometheus-haproxy-exporter/description)

$(eval $(call BuildPackage,prometheus-haproxy-exporter))
$(eval $(call BuildPackage,prometheus-haproxy-exporter_nohf))
