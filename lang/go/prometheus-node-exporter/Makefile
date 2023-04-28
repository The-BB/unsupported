# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-node-exporter
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/node_exporter

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=1b48970ffcf5630534fb00bb0687d73c66d1c959
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=e96bbff45302412cc2e8c3ac426c88a50749b0d7c47d678f8a3d6cf771978579

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus-node-exporter/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=prometheus tools
  TITLE:=Exporter for machine metrics
  URL:=https://prometheus.io/
endef

define Package/prometheus-node-exporter
  $(call Package/prometheus-node-exporter/Default)
  VARIANT:=hf
endef

define Package/prometheus-node-exporter_nohf
  $(call Package/prometheus-node-exporter/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus-node-exporter/description
  Prometheus exporter for hardware and OS metrics exposed by *NIX
  kernels, written in Go with pluggable metric collectors.
endef

Package/prometheus-node-exporter_nohf/description=$(Package/prometheus-node-exporter/description)

GO_BUILD_ARGS += -trimpath -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-11-29

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=v$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo,osusergo,static_build

define Package/prometheus-node-exporter/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/node_exporter $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99node_exporter $(1)/opt/etc/init.d
endef

Package/prometheus-node-exporter_nohf/install=$(Package/prometheus-node-exporter/install)

$(eval $(call BuildPackage,prometheus-node-exporter))
$(eval $(call BuildPackage,prometheus-node-exporter_nohf))
