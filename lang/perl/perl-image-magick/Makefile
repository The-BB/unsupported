# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-image-magick
PKG_VERSION:=7.1.1
PKG_RELEASE:=1

PKG_SRC_NAME:=Image-Magick
PKG_SOURCE:=$(PKG_SRC_NAME)-$(PKG_VERSION)-28.tar.gz
PKG_SOURCE_URL:=https://cpan.metacpan.org/authors/id/J/JC/JCRISTY
PKG_HASH:=bc54137346c1d45626e7075015f7d1dae813394af885457499f54878cfc19e0b

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/$(PKG_SRC_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/perl/perlmod.mk

define Package/perl-image-magick
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=interface to ImageMagick
  URL:=https://metacpan.org/dist/Image-Magick
  DEPENDS:=+imagemagick +perlbase-http-tiny
endef

define Build/Configure
	$(SED) 's,@STAGING_DIR@,$(STAGING_DIR),g; \
		s,@TARGET_CFLAGS@,$(TARGET_CFLAGS),g; \
		s|@TARGET_LDFLAGS@|$(TARGET_LDFLAGS)|g; \
		s,@TARGET_CC@,$(TARGET_CC),g' $(PKG_BUILD_DIR)/Makefile.PL
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-image-magick/install
	$(call perlmod/Install,$(1),auto/Image Image)
endef

$(eval $(call BuildPackage,perl-image-magick))
