#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-io-socket-ssl
PKG_VERSION:=2.068
PKG_RELEASE:=1

PKG_SOURCE:=IO-Socket-SSL-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/S/SU/SULLR
PKG_HASH:=4420fc0056f1827b4dd1245eacca0da56e2182b4ef6fc078f107dc43c3fb8ff9

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/IO-Socket-SSL-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-io-socket-ssl
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=SSL sockets with IO::Socket interface
  URL:=https://github.com/noxxi/p5-io-socket-ssl
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
