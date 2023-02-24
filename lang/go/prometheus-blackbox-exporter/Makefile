# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=prometheus-blackbox-exporter
PKG_VERSION:=0.23.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/prometheus/blackbox_exporter

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=26fc98b9c6db21457653ed752f34d1b7fb5bba43
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=b55f24a355db7f18bcfbe98ab7772e6ad6af334cdcd7e9c3eee71e9e0c3a0d0c

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/prometheus-blackbox-exporter/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=prometheus tools
  TITLE:=Blackbox prober exporter
  URL:=https://prometheus.io/
endef

define Package/prometheus-blackbox-exporter
  $(call Package/prometheus-blackbox-exporter/Default)
  VARIANT:=hf
endef

define Package/prometheus-blackbox-exporter_nohf
  $(call Package/prometheus-blackbox-exporter/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/prometheus-blackbox-exporter/description
  The blackbox exporter allows blackbox probing of endpoints
  over HTTP, HTTPS, DNS, TCP, ICMP and gRPC.
endef

Package/prometheus-blackbox-exporter_nohf/description=$(Package/prometheus-blackbox-exporter/description)

define Package/blackbox_exporter/conffiles
/opt/etc/prometheus/blackbox.yml
endef

Package/blackbox_exporter_nohf/conffiles=$(Package/blackbox_exporter/conffiles)

GO_BUILD_ARGS += -trimpath -a

REVISION:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
SOURCE_DATE:=2022-12-02

GO_LDFLAGS += \
	-X 'github.com/prometheus/common/version.Version=$(PKG_VERSION)' \
	-X 'github.com/prometheus/common/version.Revision=$(REVISION)'  \
	-X 'github.com/prometheus/common/version.Branch="release"' \
	-X 'github.com/prometheus/common/version.BuildUser=Entware@Entware' \
	-X 'github.com/prometheus/common/version.BuildDate=$(SOURCE_DATE)'

GO_TAGS:=-tags=netgo

define Package/prometheus-blackbox-exporter/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(GO_INSTALL_DIR)/blackbox_exporter $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99blackbox_exporter $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/etc/prometheus
	$(INSTALL_DATA) $(GO_SRC_DIR)/blackbox.yml $(1)/opt/etc/prometheus
endef

Package/prometheus-blackbox-exporter_nohf/install=$(Package/prometheus-blackbox-exporter/install)

$(eval $(call BuildPackage,prometheus-blackbox-exporter))
$(eval $(call BuildPackage,prometheus-blackbox-exporter_nohf))
