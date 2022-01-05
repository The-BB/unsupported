# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=pax-utils
PKG_VERSION:=1.3.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://gentoo.osuosl.org/distfiles/
PKG_HASH:=eeca7fbd98bc66bead4a77000c2025d9f17ea8201b84245882406ce00b9b6b14

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

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
	endif
endef

CONFIGURE_ARGS += \
	--with$(if $(CONFIG_PAX_UTILS_LIBCAP),,out)-caps \
	--without-python \
	--without-seccomp

define Package/pax-utils/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef

$(eval $(call BuildPackage,pax-utils))
