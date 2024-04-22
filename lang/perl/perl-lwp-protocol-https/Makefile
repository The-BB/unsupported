# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-lwp-protocol-https
PKG_VERSION:=6.14
PKG_RELEASE:=1

PKG_SRC_NAME:=LWP-Protocol-https
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/O/OA/OALDERS
PKG_HASH:=59cdeabf26950d4f1bef70f096b0d77c5b1c5a7b5ad1b66d71b681ba279cbb2a

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-lwp-protocol-https
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Provide https support for LWP::UserAgent
  URL:=https://metacpan.org/dist/LWP-Protocol-https
  DEPENDS:=+perl +perl-io-socket-ssl
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
