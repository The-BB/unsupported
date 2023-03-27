# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=dpitunnel-cli
PKG_VERSION:=0.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=624389417f31c98b98875c2f8f32057da9497b9b
PKG_SOURCE_URL:=https://github.com/nomoresat/DPITunnel-cli
PKG_MIRROR_HASH:=44541d071437b0385993af9cff55bb8ffc21a4dfc9fe0c7c90dd8e24785c62a8

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/dpitunnel-cli
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DPI Tunnel for Linux
  URL:=https://github.com/nomoresat/DPITunnel-cli
  DEPENDS:=+libnl-genl +libnl-route +libopenssl +libstdcpp
endef

define Package/dpitunnel-cli/description
  Free, simple and serverless solution against censorship
  for Linux PCs and routers.
endef

define Package/dpitunnel-cli/conffiles
/opt/etc/dpitunnel-cli.conf
endef

TARGET_CFLAGS += -pthread -I$(STAGING_DIR)/opt/include/libnl3

define Package/dpitunnel-cli/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/DPITunnel-cli-exec \
		$(1)/opt/bin/DPITunnel-cli

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S25dpitunnel $(1)/opt/etc/init.d

	touch $(1)/opt/etc/dpitunnel-cli.conf
endef

$(eval $(call BuildPackage,dpitunnel-cli))
