# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bison
PKG_VERSION:=3.7.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_HASH:=67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bison
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Bison
  URL:=https://gnu.org/software/bison/
endef

define Package/bison/description
  Bison is a general-purpose parser generator that converts an annotated
  context-free grammar into a deterministic LR or generalized LR (GLR)
  parser employing LALR(1), IELR(1) or canonical LR(1) parser tables.
endef

CONFIGURE_ARGS += \
	--enable-threads=posix

# FIXME "bison: m4 subprocess failed: no such file or directory"
define Build/Configure
	$(call Build/Configure/Default)
	$(SED) 's,$(STAGING_DIR_HOST)/bin/m4,/opt/bin/m4,' \
		$(PKG_BUILD_DIR)/lib/config.h
endef

define Package/bison/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bison $(1)/opt/bin
	$(INSTALL_BIN) ./files/yacc $(1)/opt/bin/yacc

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/liby.a $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/{aclocal,bison} $(1)/opt/share
endef

$(eval $(call BuildPackage,bison))
