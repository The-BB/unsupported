# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=navidrome
PKG_VERSION:=0.48.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/navidrome/navidrome

GOPKG_SOURCE=GO_$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.bz2

#!!! uncomment PKG_SOURCE to download fixed version
#PKG_SOURCE=$(GOPKG_SOURCE)
PKG_COMMIT=af5c2b5a42ed8b1038f8434ff64bab78378360a4
PKG_HASH:=skip

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=node/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

ifeq ($(BUILD_VARIANT),nohf)
GOARM:=GOARM=5
endif

define Package/navidrome/Default
  $(call Package/gopackage/Default)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  SUBMENU:=
  TITLE:=Modern Music Server and Streamer
  URL:=https://www.navidrome.org/
  DEPENDS:=+libstdcpp +taglib +zlib
  EXTRA_DEPENDS:=ffmpeg 
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

GIT_SHA:=$(shell echo $(PKG_COMMIT) | cut -b -9)
GIT_TAG:=v$(PKG_VERSION)

define Build/Compile
	( cd $(PKG_BUILD_DIR)/src/$(PKG_GOGET); \
		\
		pushd $(PKG_BUILD_DIR)/src/$(PKG_GOGET)/ui; \
		npm ci; \
		npm run build; \
		popd; \
		\
		CC=$(TARGET_CROSS)gcc \
		CXX=$(TARGET_CROSS)g++ \
		CGO_ENABLED=1 \
		GOOS=linux \
		GOARCH=$(GOARCH) \
		$(GOARM) \
		$(GOMIPS) \
		$(GOROOT)/bin/go build -a -o $(PKG_BUILD_DIR)/bin/navidrome \
		-ldflags="-s -w -I /opt/lib/$(DYNLINKER) \
			-X $(PKG_GOGET)/consts.gitSha=$(GIT_SHA) \
			-X $(PKG_GOGET)/consts.gitTag=$(GIT_TAG)-SNAPSHOT" \
		-tags=netgo; \
	)
endef

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
