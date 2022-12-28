# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-net-ssleay
PKG_VERSION:=1.92
PKG_RELEASE:=1

PKG_SOURCE:=Net-SSLeay-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/C/CH/CHRISN
PKG_HASH:=47c2f2b300f2e7162d71d699f633dd6a35b0625a00cbda8c50ac01144a9396a9

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Net-SSLeay-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-net-ssleay
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Perl extension for using OpenSSL
  URL:=https://metacpan.org/dist/Net-SSLeay
  DEPENDS:=+perl +libopenssl
endef

define Build/Configure
	$(call perlmod/Configure,,)
	$(SED) 's,^INC =.*,INC = -I$(STAGING_DIR)/opt/include,; \
		s,^EXTRALIBS =.*,EXTRALIBS = -L$(STAGING_DIR)/opt/lib -lssl -lcrypto -lz,; \
		s,^LDLOADLIBS =.*,LDLOADLIBS = -L$(STAGING_DIR)/opt/lib -lssl -lcrypto -lz,' \
			$(PKG_BUILD_DIR)/Makefile
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-net-ssleay/install
	$(call perlmod/Install,$(1),Net auto/Net)
endef

$(eval $(call BuildPackage,perl-net-ssleay))
