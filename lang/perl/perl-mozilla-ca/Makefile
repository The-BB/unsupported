# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-mozilla-ca
PKG_VERSION:=20221114
PKG_RELEASE:=1

PKG_SOURCE:=Mozilla-CA-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/H/HA/HAARG
PKG_HASH:=701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Mozilla-CA-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-mozilla-ca
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Mozilla's CA cert bundle in PEM format
  URL:=https://metacpan.org/dist/Mozilla-CA
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
endef

$(eval $(call BuildPackage,perl-mozilla-ca))
