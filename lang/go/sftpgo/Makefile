# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sftpgo
PKG_VERSION:=2.5.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-12-18
PKG_SOURCE_VERSION:=a6a92f0d69b8cf5e72e38ffa5e693057aa2dc776
PKG_SOURCE_URL:=https://github.com/drakkan/sftpgo
PKG_MIRROR_HASH:=39957d156d85c8cc62af33725f4bf1f09844d171feeaa86311bcb508ee1b1fd2

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

include $(TOPDIR)/feeds/golang/goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/sftpgo/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=File Transfer
  TITLE:=SFTP server
  URL:=https://sftpgo.com/
endef

define Package/sftpgo
  $(call Package/sftpgo/Default)
  VARIANT:=hf
endef

define Package/sftpgo_nohf
  $(call Package/sftpgo/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/sftpgo/description
  Fully featured and highly configurable SFTP server with
  optional HTTP/S, FTP/S and WebDAV support.
  Supported storage backends: local filesystem, encrypted
  local filesystem, S3 (compatible) Object Storage, Google
  Cloud Storage, Azure Blob Storage, other SFTP servers.
endef

Package/sftpgo_nohf/description=$(Package/sftpgo/description)

# https://github.com/drakkan/sftpgo/blob/main/docs/build-from-source.md
# FEATURES=nogcs,nos3,noazblob,nobolt,nomysql,nopgsql,nosqlite,noportable,nometrics,bundle,unixcrypt
FEATURES=nobolt,nomysql,nopgsql,unixcrypt

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/v2/internal/version.commit=$(COMMIT_SHORT)' \
	-X '$(XIMPORTPATH)/v2/internal/version.date=$(PKG_SOURCE_DATE)'

GO_TAGS:=-tags=$(FEATURES)

define Package/sftpgo/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S21sftpgo $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/etc/sftpgo
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/sftpgo.json $(1)/opt/etc/sftpgo
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/sftpgo $(1)/opt/sbin/sftpgo
	$(INSTALL_DIR) $(1)/opt/share/sftpgo
	$(CP) $(PKG_BUILD_DIR)/{openapi,static,templates} $(1)/opt/share/sftpgo
	$(INSTALL_DIR) $(1)/opt/srv/sftpgo/{data,backups}
	$(INSTALL_DIR) $(1)/opt/var/lib/sftpgo/certs
endef

Package/sftpgo_nohf/install=$(Package/sftpgo/install)

$(eval $(call BuildPackage,sftpgo))
$(eval $(call BuildPackage,sftpgo_nohf))
