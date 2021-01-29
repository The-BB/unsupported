#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=coturn
PKG_VERSION:=4.5.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/$(PKG_NAME)/$(PKG_NAME)/archive/$(PKG_VERSION)
PKG_HASH:=462f1aa5c2455f28c1c8df09510d9e88ab14a1159b5e33ea5be5095262e83745

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE LICENSE.OpenSSL

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/coturn
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Telephony
  TITLE:=STUN/TURN server
  URL:=https://github.com/coturn/coturn
  DEPENDS:=+libevent2 +libevent2-extra +libevent2-openssl +libevent2-pthreads 
  DEPENDS+=+libsocket +libsqlite3 $(INTL_DEPENDS)
endef

define Package/coturn/description
  Free open source implementation of TURN and STUN Server.
endef

define Package/coturn/conffiles
/opt/etc/turnserver/turnserver.conf
/opt/var/lib/turn/turndb
endef

ifeq ($(or $(CONFIG_GCC_USE_VERSION_8),$(CONFIG_GCC_USE_VERSION_9)),y)
TARGET_CFLAGS += -Wno-stringop-truncation -Wno-stringop-overflow
endif

CONFIGURE_ARGS += \
	--confdir=/opt/etc \
	--schemadir=/opt/share/turnserver \
	--turndbdir=/opt/var/lib/turn

define Package/coturn/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/turnserver $(1)/opt/bin
	$(LN) turnserver $(1)/opt/bin/turnadmin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/opt/bin/turnutils_{natdiscovery,oauth,peer,{stun,u}client} \
			$(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/turnserver
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/etc/turnserver.conf \
		$(1)/opt/etc/turnserver
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/examples/ca/turn_server_*.pem \
		$(1)/opt/etc/turnserver

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99turnserver $(1)/opt/etc/init.d

	$(INSTALL_DIR) $(1)/opt/var/lib/turn
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/examples/var/db/turndb \
		$(1)/opt/var/lib/turn
endef

$(eval $(call BuildPackage,coturn))
