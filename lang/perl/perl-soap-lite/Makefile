# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-soap-lite
PKG_VERSION:=1.27
PKG_RELEASE:=2

PKG_SRC_NAME:=SOAP-Lite
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/P/PH/PHRED
PKG_HASH:=e359106bab1a45a16044a4c2f8049fad034e5ded1517990bc9b5f8d86dddd301

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-soap-lite
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Perl's Web Services Toolkit
  URL:=https://metacpan.org/dist/SOAP-Lite
  DEPENDS:= \
	+perl +perlbase-compress +perlbase-essential +perlbase-mime \
	+perl-class-inspector +perl-io-socket-ssl +perl-lwp-protocol-https \
	+perl-mozilla-ca +perl-net-ssleay +perl-task-weaken +perl-time-date \
	+perl-try-tiny +perl-uri +perl-www +perl-xml-parser
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-soap-lite/install
	$(call perlmod/Install,$(1),Apache SOAP auto/SOAP)
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/SOAPsh.pl $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/stubmaker.pl $(1)/opt/bin
	$(SED) 's,#!.*perl,#!/opt/bin/perl,' $(1)/opt/bin/*.pl
endef

$(eval $(call BuildPackage,perl-soap-lite))
