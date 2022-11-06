# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=daytimed
PKG_VERSION:=0.0.0
PKG_RELEASE:=1

PKG_SOURCE_DATE:=2022-07-20
PKG_SOURCE_VERSION:=05d500477c65f4e2bf80ee594604f64bf76c0242

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/sbennett1990/daytimed
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/daytimed
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Time Synchronization
  TITLE:=Daytime Protocol daemon
  URL:=https://github.com/sbennett1990/daytimed
endef

define Package/daytimed/description
  daytimed is a privilege-dropping server that implements the
  Daytime Protocol as specified in RFC 867. It responds to TCP
  connections on port 13, returns a human-readable date string
  to the client, then closes the connection.
endef

TARGET_CFLAGS+= -D_GNU_SOURCE -D_DEFAULT_SOURCE
TARGET_CFLAGS+= -Wall
TARGET_CFLAGS+= -Wstrict-prototypes -Wmissing-prototypes
TARGET_CFLAGS+= -Wmissing-declarations
TARGET_CFLAGS+= -Wshadow -Wpointer-arith -Wcast-qual
TARGET_CFLAGS+= -Wsign-compare

define Build/Compile
	$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) \
		-o $(PKG_BUILD_DIR)/daytimed -C $(PKG_BUILD_DIR)/daytimed.c \
		$(TARGET_LDFLAGS)
endef

define Package/daytimed/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daytimed $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S02daytimed $(1)/opt/etc/init.d
endef

$(eval $(call BuildPackage,daytimed))
