#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-lwp-protocol-https
PKG_VERSION:=6.09
PKG_RELEASE:=1

PKG_SOURCE:=LWP-Protocol-https-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/O/OA/OALDERS
PKG_HASH:=16cfe1a511690b066db5667c8714802ee2b9c5d28a31a3e7bd36fbc70a3af592

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/LWP-Protocol-https-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-lwp-protocol-https
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Provide https support for LWP::UserAgent
  URL:=https://github.com/libwww-perl/LWP-Protocol-https
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
