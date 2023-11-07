# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=atinout
PKG_VERSION:=0.9.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/beralt/atinout
PKG_SOURCE_VERSION:=4013e8db4cd140c1df24bb90f929efeb9b61b238
PKG_MIRROR_HASH:=ac6631879141faecf737c96ef68a1b495528a50a369a223df9d178af1f117289

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=gplv3.txt

include $(INCLUDE_DIR)/package.mk

define Package/atinout
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a program that reads a list of AT commands
  URL:=https://github.com/beralt/atinout
endef

define Package/atinout/description
  Atinout is a program that will execute AT commands in sequence and
  capture the response from the modem.
endef

TARGET_CFLAGS += -DVERSION=\"$(PKG_VERSION)\"

Build/Configure:=:

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CC) $(TARGET_CFLAGS) -o atinout atinout.c $(TARGET_LDFLAGS); \
	)
endef

define Package/atinout/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/atinout $(1)/opt/bin
endef

$(eval $(call BuildPackage,atinout))
