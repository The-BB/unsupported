# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rtlmux
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=7d03dd6f5f60b9f75b00d5fca728d19be98d5526
PKG_SOURCE_URL:=https://github.com/d03n3rfr1tz3/rtlmux
PKG_MIRROR_HASH:=043b660f21376799bce0e1f99b81cf745bcffe969001214124f80dbebe19c6ad

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/rtlmux
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=RTL-SDR TCP Mulitplexer
  URL:=https://github.com/d03n3rfr1tz3/rtlmux
  DEPENDS:=+libevent2 +libevent2-pthreads
endef

define Package/rtlmux/description
  RTL TCP Client Multiplexer/Relay.
  This will connect to an rtl_tcp server and allow multiple end clients
  to connect and control the RTL.
endef

Build/Configure:=:

define Package/rtlmux/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rtlmux $(1)/opt/bin
endef

$(eval $(call BuildPackage,rtlmux))
