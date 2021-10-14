# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=elfkickers
PKG_VERSION:=3.2
PKG_RELEASE:=1

PKG_SOURCE:=ELFkickers-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.muppetlabs.com/~breadbox/pub/software/
PKG_HASH:=9b81e6c53e0c94fc198d9882eb737156f36d565152dc32118897c77b06a2687c

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/elfkickers
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=A collection of programs that access and manipulate ELF files
  URL:=https://www.muppetlabs.com/~breadbox/software/elfkickers.html
endef

define Package/elfkickers/description
  This distribution is a collection of programs that are generally unrelated,
  except in that they all deal with ELF files. 
endef

Build/Configure:=:

define Package/elfkickers/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef

$(eval $(call BuildPackage,elfkickers))
