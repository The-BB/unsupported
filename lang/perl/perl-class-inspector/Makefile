# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-class-inspector
PKG_VERSION:=1.36
PKG_RELEASE:=1

PKG_SOURCE:=Class-Inspector-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/P/PL/PLICEASE
PKG_HASH:=cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Class-Inspector-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-class-inspector
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Get information about a class and its structure
  URL:=https://metacpan.org/dist/Class-Inspector
  DEPENDS:=+perl 
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-class-inspector/install
	$(call perlmod/Install,$(1),Class auto/Class)
endef

$(eval $(call BuildPackage,perl-class-inspector))
