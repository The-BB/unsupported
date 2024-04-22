# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-file-which
PKG_VERSION:=1.27
PKG_RELEASE:=2

PKG_SRC_NAME:=File-Which
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/
PKG_HASH:=3201f1a60e3f16484082e6045c896842261fc345de9fb2e620fd2a2c7af3a93a

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Artistic-1.0-Perl GPL-1.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-file-which
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Perl
  TITLE:=Perl implementation of the which utility as an API
  URL:=https://metacpan.org/dist/File-Which
  DEPENDS:=+perl +perlbase-file
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-file-which/install
	$(call perlmod/Install,$(1),File)
endef

$(eval $(call BuildPackage,perl-file-which))
