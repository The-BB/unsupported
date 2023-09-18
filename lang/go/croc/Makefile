# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=croc
PKG_VERSION:=9.6.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ef68dfa54c3266fd2033f2ee8e16754fb91d888f
PKG_SOURCE_URL:=https://github.com/schollz/croc
PKG_MIRROR_HASH:=324ab1ef98b584904391e55b4f37a1a24fb089303c49a27eeeb4881e7d2d2e82

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/croc/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=File Transfer
  TITLE:=A simple, secure, and fast way to transfer data
  URL:=https://schollz.com/software/croc
endef

define Package/croc
  $(call Package/croc/Default)
  VARIANT:=hf
endef

define Package/croc_nohf
  $(call Package/croc/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/croc/description
  croc is a tool that allows any two computers to simply and securely
  transfer files and folders.
endef

Package/croc_nohf/description=$(Package/croc/description)

define Package/croc/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S88croc $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/croc $(1)/opt/sbin/croc
endef

Package/croc_nohf/install=$(Package/croc/install)

$(eval $(call BuildPackage,croc))
$(eval $(call BuildPackage,croc_nohf))
