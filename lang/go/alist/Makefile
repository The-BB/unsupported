# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=3.30.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-01-05
PKG_SOURCE_VERSION:=e6e2d03ba175edea1c9c2c6bd42259e11ed764a0
PKG_SOURCE_URL:=https://github.com/alist-org/alist
PKG_MIRROR_HASH:=4c86d2dcf4cd20cf77e5bc6f4ce5d4c754ab1569427cb9370d86ead6d9b31f22

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/alist/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  TITLE:=A file list program that supports multiple storage
  URL:=https://alist-doc.nn.ci/
endef

define Package/alist
  $(call Package/alist/Default)
  VARIANT:=hf
endef

define Package/alist_nohf
  $(call Package/alist/Default)
  VARIANT:=nohf
  DEPENDS:=@(TARGET_armv7_2_6||TARGET_armv7_3_2)
endef

define Package/alist/description
  A file list program that supports multiple storage.
endef

Package/alist_nohf/description=$(Package/alist/description)

GIT_TAG:=v$(PKG_VERSION)-$(COMMIT_SHORT)
GO_VER:=$(shell $(GO_BIN) version | sed 's/go version //;s,/.*,/$(GOARCH),')

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/v3/internal/conf.BuiltAt=$(PKG_SOURCE_DATE)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GoVersion=$(GO_VER)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GitAuthor=Entware' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GitCommit=$(COMMIT_SHORT)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.Version=$(PKG_VERSION)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.WebVersion=$(PKG_VERSION)'

GO_TAGS:=-tags=jsoniter

WEB_FILE:=$(PKG_NAME)-web-$(PKG_VERSION).tar.gz
define Download/alist-web
  URL:=https://github.com/alist-org/alist-web/releases/download/$(PKG_VERSION)/
  URL_FILE:=dist.tar.gz
  FILE:=$(WEB_FILE)
  HASH:=04e160efc6e7169103cd424a39de0f1720e769aacc49dc0a2fcc3f1fcc6d0fee
endef
$(eval $(call Download,alist-web))

define Build/Web
	$(HOST_TAR) -xzf $(DL_DIR)/$(WEB_FILE) -C $(PKG_BUILD_DIR)/public 
endef
Hooks/Compile/Pre += Build/Web

define Package/alist/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/alist $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99alist $(1)/opt/etc/init.d
endef

Package/alist_nohf/install=$(Package/alist/install)

$(eval $(call BuildPackage,alist))
$(eval $(call BuildPackage,alist_nohf))
