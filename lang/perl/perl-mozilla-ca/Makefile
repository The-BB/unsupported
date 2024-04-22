# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-mozilla-ca
PKG_VERSION:=20240313
PKG_RELEASE:=1

PKG_SRC_NAME:=Mozilla-CA
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/L/LW/LWP
PKG_HASH:=624873939e309833894f881464a95dfe74ab77cab5d557308c010487161698e7

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

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
