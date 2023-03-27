# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=hstr
PKG_VERSION:=2.6.0
PKG_RELEASE:=1

SHORT_VERSION:=$(subst $(space),.,$(wordlist 1,2,$(subst .,$(space),$(PKG_VERSION))))

PKG_SOURCE:=$(PKG_NAME)-$(SHORT_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dvorka/hstr/tar.gz/refs/tags/$(SHORT_VERSION)?
PKG_HASH:=085f8a087481bcdf33e75e2fa5aaa9289931782c0bee2db3e02425b9a7d83cdf

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(SHORT_VERSION)

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/hstr
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=bash and zsh shell history suggest box
  URL:=http://me.mindforger.com/
  DEPENDS:=+libncursesw +libreadline
endef

define Package/hstr/description
  Easily view, navigate and search your command history
  with shell history suggest box for bash and zsh.
endef

CONFIGURE_VARS += \
	ac_cv_file__tmp_hstr_ms_wsl=no

define Package/hstr/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hstr $(1)/opt/bin
endef

$(eval $(call BuildPackage,hstr))
