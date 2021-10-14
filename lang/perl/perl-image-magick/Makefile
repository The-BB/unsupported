# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-image-magick
PKG_VERSION:=7.0.11
PKG_RELEASE:=1

PKG_SOURCE:=Image-Magick-$(PKG_VERSION)-3.tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/J/JC/JCRISTY
PKG_HASH:=232f2312c09a9d9ebc9de6c9c6380b893511ef7c6fc358d457a4afcec26916aa

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Image-Magick-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=imagemagick

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-image-magick
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=interface to ImageMagick
  URL:=https://metacpan.org/dist/Image-Magick
  DEPENDS:=+imagemagick +perl
endef

define Build/Configure
	$(SED) 's,$$$$STAGING_DIR,$(STAGING_DIR),g' $(PKG_BUILD_DIR)/Makefile.PL
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-image-magick/install
	$(call perlmod/Install,$(1),auto/Image Image)
endef

$(eval $(call BuildPackage,perl-image-magick))
