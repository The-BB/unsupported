# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-task-weaken
PKG_VERSION:=1.06
PKG_RELEASE:=1

PKG_SOURCE:=Task-Weaken-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/E/ET/ETHER
PKG_HASH:=2383fedb9dbaef646468ea824afbf7c801076720cfba0df2a7a074726dcd66be

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Task-Weaken-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-task-weaken
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Ensure that a platform has weaken support
  URL:=https://metacpan.org/pod/Task::Weaken
  DEPENDS:=+perl 
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-task-weaken/install
	$(call perlmod/Install,$(1),Task auto/Task)
endef

$(eval $(call BuildPackage,perl-task-weaken))
