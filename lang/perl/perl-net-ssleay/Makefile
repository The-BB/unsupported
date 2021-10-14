#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-net-ssleay
PKG_VERSION:=1.88
PKG_RELEASE:=1

PKG_SOURCE:=Net-SSLeay-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/C/CH/CHRISN
PKG_HASH:=2000da483c8471a0b61e06959e92a6fca7b9e40586d5c828de977d3d2081cfdd

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Net-SSLeay-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-net-ssleay
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Perl extension for using OpenSSL
  URL:=https://metacpan.org/pod/distribution/Net-SSLeay/lib/Net/SSLeay.pod
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
