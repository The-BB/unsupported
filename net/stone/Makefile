# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=stone
PKG_VERSION:=2.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.gcd.org/sengoku/stone/
PKG_HASH:=d5dc1af6ec5da503f2a40b3df3fe19a8fbf9d3ce696b8f46f4d53d2ac8d8eb6f

PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=GPL.txt

include $(INCLUDE_DIR)/package.mk

define Package/stone
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Simple Repeater
  URL:=http://www.gcd.org/sengoku/stone/
  VARIANT:=stub
endef

define Package/stone-pop
$(call Package/stone)
  TITLE+= (POP->APOP conversion)
  VARIANT:=pop
endef

define Package/stone-ssl
$(call Package/stone)
  TITLE+= (OpenSSL)
  DEPENDS:=+libopenssl
  VARIANT:=ssl
endef

define Package/stone/description
  Stone is a TCP/IP repeater in the application layer. It repeats TCP and
  UDP from inside to outside of a firewall, or from outside to inside. 
endef

Package/stone-pop/description = $(Package/stone/description)
Package/stone-ssl/description = $(Package/stone/description)

SRC:=stone.c

TARGET_CPPFLAGS += \
	-D_GNU_SOURCE \
	-DPTHREAD \
	-DUNIX_DAEMON \
	-DPRCTL \
	-DSO_ORIGINAL_DST=80 \
	-DUSE_EPOLL 

TARGET_LDFLAGS += -pthread

ifeq ($(BUILD_VARIANT),pop)
  TARGET_CPPFLAGS += -DUSE_POP
  SRC += md5c.c
endif

ifeq ($(BUILD_VARIANT),ssl)
  TARGET_CFLAGS += -Wno-deprecated-declarations
  TARGET_CPPFLAGS += -DUSE_SSL -DCONST_SSL_METHOD -DOPENSSL_NO_TLS1 -DOPENSSL_NO_SSL2 -DOPENSSL_NO_SSL3
  TARGET_LDFLAGS += -lssl -lcrypto
endif

Build/Configure:=:

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -o stone $(SRC) $(TARGET_LDFLAGS); \
	)
endef

define Package/stone/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/stone $(1)/opt/bin
endef

Package/stone-pop/install = $(Package/stone/install)
Package/stone-ssl/install = $(Package/stone/install)

$(eval $(call BuildPackage,stone))
$(eval $(call BuildPackage,stone-pop))
$(eval $(call BuildPackage,stone-ssl))
