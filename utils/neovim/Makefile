# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=neovim
PKG_VERSION:=0.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/neovim/neovim/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=adf45ff160e1d89f519b6114732eba03485ae469beb27919b0f7a4f6b44233c1

#PKG_SOURCE_PROTO:=git
#PKG_SOURCE_VERSION:=21257d8580780a5e28f06562cea4f8889e6b0932
#PKG_SOURCE_URL:=https://github.com/neovim/neovim
#PKG_MIRROR_HASH:=e9e3a2a930f4e54cbe0c7bf004a932b486f807a7b751888419193610af94f86c

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.txt

PKG_BUILD_DEPENDS:=libtermkey libvterm luajit tree-sitter unibilium
PKG_BUILD_DEPENDS+=libmpack-lua/host lpeg/host lua/host luabitop/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/neovim
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=hyperextensible Vim-based text editor
  URL:=https://neovim.io/
  DEPENDS:=+libncursesw +luajit +luv +msgpack-c $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/neovim/description
  Vim-fork focused on extensibility and usability.
endef

CMAKE_BINARY_SUBDIR:=build

TARGET_LDFLAGS += -lncursesw

# XXX fake tag
define FixPostPrepare
	touch $(PKG_BUILD_DIR)/runtime/doc/tags
endef

Hooks/Prepare/Post += FixPostPrepare

define Package/neovim/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nvim $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/share/nvim
	$(CP) $(PKG_INSTALL_DIR)/opt/share/nvim/runtime $(1)/opt/share/nvim
endef

define Package/neovim/postinst
#!/bin/sh

DIR="/opt/share/nvim/runtime"

echo "Generating tags..."

nvim -u NONE -i NONE -e --headless -c "helptags ++t $$DIR/doc" -c quit
nvim -u NONE -i NONE -e --headless -c "helptags $$DIR/pack/dist/opt/matchit/doc" -c quit
nvim -u NONE -i NONE -e --headless -c "helptags $$DIR/pack/dist/opt/vimball/doc" -c quit
endef

$(eval $(call BuildPackage,neovim))
