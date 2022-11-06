# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-stow
PKG_VERSION:=2.3.1
PKG_RELEASE:=1

PKG_SOURCE:=Stow-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/A/AS/ASPIERS
PKG_HASH:=5062a1f8d0c03e38aca5cf46b72de0cba03f901279729338b7b2f93e518182d8

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Stow-v$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlver.mk

define Package/perl-stow
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=manage farms of symbolic links
  URL:=https://metacpan.org/dist/Stow
  DEPENDS:=+perl 
endef

Build/Configure:=:
Build/Compile:=:

define Package/perl-stow/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/{,chk}stow $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/lib/perl5/$(PERL_VERSION2)/Stow
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lib/Stow.pm \
		$(1)/opt/lib/perl5/$(PERL_VERSION2)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lib/Stow/Util.pm \
		$(1)/opt/lib/perl5/$(PERL_VERSION2)/Stow
endef

$(eval $(call BuildPackage,perl-stow))
