# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-time-date
PKG_VERSION:=0.05
PKG_RELEASE:=2

PKG_SRC_NAME:=Time-Date
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/J/JA/JACOBG
PKG_HASH:=be3d91971289d922ccffe05a6fd53fea5aff0820d8ea265f65e6c387296ea971

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-time-date
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A time and date object for Perl
  URL:=https://metacpan.org/dist/Time-Date
  DEPENDS:=+perlbase-essential +perlbase-posix
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-time-date/install
	$(call perlmod/Install,$(1),Time auto/Time)
endef

$(eval $(call BuildPackage,perl-time-date))
