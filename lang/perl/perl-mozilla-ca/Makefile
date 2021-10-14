# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-mozilla-ca
PKG_VERSION:=20211001
PKG_RELEASE:=1

PKG_SOURCE:=Mozilla-CA-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/A/AB/ABH
PKG_HASH:=122c8900000a9d388aa8e44f911cab6c118fe8497417917a84a8ec183971b449

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Mozilla-CA-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-mozilla-ca
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Mozilla's CA cert bundle in PEM format
  URL:=https://metacpan.org/pod/Mozilla::CA
  DEPENDS:=+perl 
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-mozilla-ca/install
	$(call perlmod/Install,$(1),Mozilla auto/Mozilla)
	# Entware specific: fix exec path to scripts
	$(SED) 's,#!.*perl,#!/opt/bin/perl,' $(1)$(PERL_SITELIB)/Mozilla/*.pl
endef

$(eval $(call BuildPackage,perl-mozilla-ca))
