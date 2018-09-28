#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=isync
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/isync
PKG_HASH:=8d5f583976e3119705bdba27fa4fc962e807ff5996f24f354957178ffa697c9c

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/isync
  SECTION:=mail
  CATEGORY:=Mail
  DEPENDS:=+libdb47 +libopenssl +libsasl2 +zlib
  TITLE:=isync/mbsync - free mailbox synchronization program
  URL:=http://isync.sourceforge.net/
endef

define Package/isync/description
   A command line utility for synchronizing remote IMAP mailboxes and local
maildir-style mailboxes. This is useful for working in disconnected (off-line)
mode, such as on a laptop, but also for mirroring mailboxes between servers.
endef

CONFIGURE_ARGS += \
	--prefix=/opt \
	--with-ssl=$(STAGING_DIR)/opt \
	--with-sasl=$(STAGING_DIR)/opt \
	--with-zlib

define Package/isync/conffiles
endef

define Package/isync/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/{i,mb}sync $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mdconvert $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mbsync-get-cert $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/share/doc/isync
	$(CP) $(PKG_INSTALL_DIR)/opt/share/doc/isync/examples $(1)/opt/share/doc/isync/
endef

$(eval $(call BuildPackage,isync))
