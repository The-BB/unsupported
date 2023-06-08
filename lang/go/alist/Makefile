# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=3.18.0
PKG_RELEASE:=1
SOURCE_DATE:=2023-05-28

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=bd2418c438ec89bb642b8c236e1872d7e0db04f4
PKG_SOURCE_URL:=https://github.com/alist-org/alist
PKG_MIRROR_HASH:=9357d43ba16908004be50c2960fe3e411cb8982439518f9bd5c7d79ad8e41613

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1

PKG_BUILD_DEPENDS:=node-pnpm/host

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

define Download/alist-web
  VERSION:=10382506c4402bd22d4dc0ad71a3c11dbc91b88d
  SUBDIR:=alist-web
  FILE:=alist-web-$$(VERSION).tar.xz
  URL:=https://github.com/alist-org/alist-web.git
  MIRROR_HASH:=89f386a9e5d6da00d5797fd4e53f7907948dbd69a4fb75f0996968b94a244556
  PROTO:=git
endef

$(eval $(call Download,alist-web))

define Prepare/alist-web
	$(eval $(Download/alist-web))
	xzcat $(DL_DIR)/$(FILE) | tar -C $(PKG_BUILD_DIR) $(TAR_OPTIONS)
endef

define Build/Web
	$(Prepare/alist-web)

	$(INSTALL_DIR) $(PKG_BUILD_DIR)/alist-web/.git

	( cd $(PKG_BUILD_DIR)/alist-web; \
		pnpm install; \
		pnpm i18n:release; \
		pnpm build; \
		rm -rf ../public/dist; \
		mv dist ../public/; \
	)
endef

Hooks/Compile/Pre += Build/Web

GIT_TAG:=v$(PKG_VERSION)-$(COMMIT_SHORT)
GO_VER:=$(shell $(GO_BIN) version | sed 's/go version //;s,/.*,/$(GOARCH),')
WEB_COMMIT:=$(shell echo $(VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/v3/internal/conf.BuiltAt=$(SOURCE_DATE)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GoVersion=$(GO_VER)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GitAuthor=Entware' \
	-X '$(XIMPORTPATH)/v3/internal/conf.GitCommit=$(COMMIT_SHORT)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.Version=$(PKG_VERSION)' \
	-X '$(XIMPORTPATH)/v3/internal/conf.WebVersion=$(WEB_COMMIT)'

GO_TAGS:=-tags=jsoniter

define Package/alist/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/alist $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S99alist $(1)/opt/etc/init.d
endef

Package/alist_nohf/install=$(Package/alist/install)

$(eval $(call BuildPackage,alist))
$(eval $(call BuildPackage,alist_nohf))
