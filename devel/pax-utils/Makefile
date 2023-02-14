# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pax-utils
PKG_VERSION:=1.3.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://gentoo.osuosl.org/distfiles/
PKG_HASH:=108362d29668d25cf7b0cadc63b15a4c1cfc0dbc71adc151b33c5fe7dece939a

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pax-utils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Security-focused ELF files checking tool
  URL:=http://www.gentoo.org/proj/en/hardened/pax-utils.xml
  DEPENDS:=+PAX_UTILS_LIBCAP:libcap +bash +coreutils-realpath
  MENU:=1
endef

define Package/pax-utils/description
  ELF related utils for ELF 32/64 binaries that can check files for security
  relevant properties.
endef

define Package/pax-utils/config
  if PACKAGE_pax-utils
	config PAX_UTILS_LIBCAP
		bool
		prompt "build with capabilities"
		default n
		help
		    Enable listing capabilities in pspax output (requires libcap)
  endif
endef

MESON_ARGS += \
	-Dbuild_manpages=disabled \
	-Dlddtree_implementation=sh \
	-Dtests=false \
	-Duse_fuzzing=false \
	-Duse_libcap=$(if $(CONFIG_PAX_UTILS_LIBCAP),enabled,disabled) \
	-Duse_seccomp=false

define Package/pax-utils/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef

$(eval $(call BuildPackage,pax-utils))
