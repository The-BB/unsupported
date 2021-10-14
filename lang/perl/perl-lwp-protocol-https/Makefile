# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-lwp-protocol-https
PKG_VERSION:=6.10
PKG_RELEASE:=1

PKG_SOURCE:=LWP-Protocol-https-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/O/OA/OALDERS
PKG_HASH:=cecfc31fe2d4fc854cac47fce13d3a502e8fdfe60c5bc1c09535743185f2a86c

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/LWP-Protocol-https-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-lwp-protocol-https
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Provide https support for LWP::UserAgent
  URL:=https://metacpan.org/dist/LWP-Protocol-https
  DEPENDS:=+perl 
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-lwp-protocol-https/install
	$(call perlmod/Install,$(1),LWP auto/LWP)
endef

$(eval $(call BuildPackage,perl-lwp-protocol-https))
