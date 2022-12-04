# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=navidrome
PKG_VERSION:=0.48.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/navidrome/navidrome

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=af5c2b5a42ed8b1038f8434ff64bab78378360a4
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=457f00d8d1e1278861b80e32a81ac42c87314c0f63818754e2f97919189e5ad3

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/navidrome/Default
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Modern Music Server and Streamer
  URL:=https://www.navidrome.org/
  DEPENDS:=+ffmpeg +libstdcpp +taglib +zlib
endef

define Package/navidrome
  $(call Package/navidrome/Default)
  VARIANT:=hf
endef

define Package/navidrome_nohf
  $(call Package/navidrome/Default)
  VARIANT:=nohf
  DEPENDS+=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/navidrome/description
  Navidrome is an open source web-based music collection server and streamer.
  It gives you freedom to listen to your music collection from any browser or
  mobile device.
endef

Package/navidrome_nohf/description=$(Package/navidrome/description)

define Package/navidrome/conffiles
/opt/etc/navidrome.toml
endef

Package/navidrome_nohf/conffiles=$(Package/navidrome/conffiles)

define Build/Web
	( cd $(GO_SRC_DIR)/ui; npm ci; npm run build; )
endef

Hooks/Compile/Pre += Build/Web

GIT_SHA:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)

GO_BUILD_ARGS += -a

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/consts.gitSha=$(GIT_SHA)' \
	-X '$(PKG_GOGET)/consts.gitTag=v$(PKG_VERSION)'

GO_TAGS:=-tags=netgo

define Package/navidrome/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/navidrome $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) files/navidrome.toml $(1)/opt/etc

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S91navidrome $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/data/music
endef

Package/navidrome_nohf/install=$(Package/navidrome/install)

$(eval $(call BuildPackage,navidrome))
$(eval $(call BuildPackage,navidrome_nohf))
