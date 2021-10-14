# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=flex
PKG_VERSION:=2.6.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/westes/flex/releases/download/v$(PKG_VERSION)/
PKG_HASH:=e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf gettext-version
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/flex
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=the fast lexical analyser generator
  URL:=https://github.com/westes/flex
endef

define Package/flex/description
  The Fast Lexical Analyzer - scanner generator for lexing in C and C++.
endef

CONFIGURE_ARGS += \
	--disable-bootstrap

define Package/flex/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/flex{,++} $(1)/opt/bin
	$(LN) flex $(1)/opt/bin/lex
endef

$(eval $(call BuildPackage,flex))
