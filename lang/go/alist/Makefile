# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=3.33.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-03-25
PKG_SOURCE_VERSION:=cf08aa3668d319b4001268f94ef13ed76c1afd70
PKG_SOURCE_URL:=https://github.com/alist-org/alist
PKG_MIRROR_HASH:=48ee7ed56735503fc406de9c55450bf74b104c25e8c5bd0079752d3e11263a7f

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
  DEPENDS:=@arm
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
  HASH:=50ae0539720bce7c470ac6bc47216b0e103e73636ee3a9b4b9364e2b52ca93f6
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
