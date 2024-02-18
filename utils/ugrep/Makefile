# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=ugrep
PKG_VERSION:=5.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Genivia/ugrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4c1dbf338bfed337fe53df0f685894c2a27d4a4fed236ebb3491441c2ccbec65

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ugrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=an ultra fast, user-friendly, compatible grep
  URL:=https://ugrep.com
  DEPENDS:=+boost-regex +libbz2 +liblz4 +liblzma +libpcre2 +libstdcpp +libzstd +zlib
endef

define Package/ugrep/description
  NEW ugrep 5.0: an ultra fast, user-friendly, compatible grep.
  Ugrep combines the best features of other grep, adds new features, and
  searches fast. Includes a TUI and adds Google-like search, fuzzy search,
  hexdumps, searches nested archives (zip, 7z, tar, pax, cpio), compressed
  files (gz, Z, bz2, lzma, xz, lz4, zstd, brotli), pdfs, docs, and more.
endef

define Package/ugrep/conffiles
/opt/etc/.ugrep
endef

CONFIGURE_ARGS += \
	--disable-7zip \
	--disable-avx \
	--disable-neon \
	--disable-sse2 \
	--enable-hidden \
	--enable-pager \
	--enable-pretty \
	--with-boost-regex=$(STAGING_DIR)/opt \
	--with-bzlib=$(STAGING_DIR)/opt \
	--with-grep-path=/opt/share/ugrep/patterns \
	--with-lz4=$(STAGING_DIR)/opt \
	--with-lzma=$(STAGING_DIR)/opt \
	--with-pcre2=$(STAGING_DIR)/opt \
	--with-zlib=$(STAGING_DIR)/opt \
	--with-zstd=$(STAGING_DIR)/opt \
	--without-bash-completion-dir \
	--without-brotli \
	--without-bzip3 \
	--without-fish-completion-dir \
	--without-zsh-completion-dir

define Package/ugrep/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ug{,rep} $(1)/opt/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ug{,rep}+ $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/ugrep $(1)/opt/share
endef

define Package/ugrep/postinst
#!/bin/sh

ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

[ -f "/opt/etc/.ugrep" ] && exit 0
printf "\n\t$$ansi_white_cur %s $$ansi_std\n\n" "Creating configuration file..."
ugrep --save-config
endef

$(eval $(call BuildPackage,ugrep))
