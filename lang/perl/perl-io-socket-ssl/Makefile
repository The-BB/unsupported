# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-io-socket-ssl
PKG_VERSION:=2.081
PKG_RELEASE:=1

PKG_SOURCE:=IO-Socket-SSL-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/S/SU/SULLR
PKG_HASH:=07bdf826a8d6b463316d241451c890d1012fa2499a83d8e3d00ce0a584618443

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/IO-Socket-SSL-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-io-socket-ssl
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=SSL sockets with IO::Socket interface
  URL:=https://metacpan.org/dist/IO-Socket-SSL
  DEPENDS:=+perl +perl-mozilla-ca +perl-net-ssleay
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-io-socket-ssl/install
	$(call perlmod/Install,$(1),IO auto/IO)
endef

$(eval $(call BuildPackage,perl-io-socket-ssl))
