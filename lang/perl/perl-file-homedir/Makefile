# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-file-homedir
PKG_VERSION:=1.006
PKG_RELEASE:=2

PKG_SRC_NAME:=File-HomeDir
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/R/RE/REHSACK
PKG_HASH:=593737c62df0f6dab5d4122e0b4476417945bb6262c33eedc009665ef1548852

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Artistic-1.0-Perl GPL-1.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-file-homedir
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Perl
  TITLE:=Find your home and other directories
  URL:=https://metacpan.org/dist/File-HomeDir
  DEPENDS:=+perl +perlbase-file +perl-file-which
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-file-homedir/install
	$(call perlmod/Install,$(1),File)
endef

$(eval $(call BuildPackage,perl-file-homedir))
