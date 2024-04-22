# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=navidrome
PKG_VERSION:=0.51.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6d253225de088e27f9a191d6bcedcb2e68b123fa
PKG_SOURCE_URL:=https://github.com/navidrome/navidrome
PKG_MIRROR_HASH:=42491cac9585d35d6b948291970709bf815f34a1493ff657de2709326b8af9c4

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

PKG_BUILD_DEPENDS:=node/host

include ../goenv.mk
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
  DEPENDS+=@arm
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
	( cd $(PKG_BUILD_DIR)/ui; npm ci; npm run build; )
endef

Hooks/Compile/Pre += Build/Web

GO_BUILD_ARGS += -a

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/consts.gitSha=$(COMMIT_SHORT)' \
	-X '$(XIMPORTPATH)/consts.gitTag=v$(PKG_VERSION)'

GO_TAGS:=-tags=netgo

define Package/navidrome/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/navidrome $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) ./files/navidrome.toml $(1)/opt/etc
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S91navidrome $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/data/music
endef

Package/navidrome_nohf/install=$(Package/navidrome/install)

$(eval $(call BuildPackage,navidrome))
$(eval $(call BuildPackage,navidrome_nohf))
