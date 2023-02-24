# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=alist
PKG_VERSION:=3.12.0
PKG_RELEASE:=1

PKG_GOGET:=github.com/alist-org/alist

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=c8f3e8ab4d2fc8359266399484f863f3515dddfa
PKG_SOURCE_URL:=https://$(PKG_GOGET)
PKG_MIRROR_HASH:=84ae762c58f52201a06cdaa25f895ce75401451169608552510d5d3d66581bf6

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_CGO_ENABLED:=1
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DEPENDS:=node-pnpm/host

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
  VERSION:=e696cd8a3e8c17486dee0941f3d9cba042939264
  SUBDIR:=alist-web
  FILE:=alist-web-$$(VERSION).tar.xz
  URL:=https://github.com/alist-org/alist-web.git
  MIRROR_HASH:=ad95da3571667c22ff30286e4fab081d81204c1baa2ef66369563684f3763c1b
  PROTO:=git
endef

$(eval $(call Download,alist-web))

define Prepare/alist-web
	$(eval $(Download/alist-web))
	xzcat $(DL_DIR)/$(FILE) | tar -C $(GO_SRC_DIR) $(TAR_OPTIONS)
endef

define Build/Web
	$(Prepare/alist-web)

	$(INSTALL_DIR) $(GO_SRC_DIR)/alist-web/.git

	( cd $(GO_SRC_DIR)/alist-web; \
		pnpm install; \
		pnpm i18n:release; \
		pnpm build; \
		rm -rf ../public/dist; \
		mv dist ../public/; \
	)
endef

Hooks/Compile/Pre += Build/Web

BUILD_DATE:=$(shell date +'%F %T %z')
GIT_COMMIT:=$(shell echo $(PKG_SOURCE_VERSION) | cut -b -9)
GIT_TAG:=v$(PKG_VERSION)-$(GIT_COMMIT)
GO_VER:=$(shell $(GO_BIN) version | sed 's/go version //;s,/.*,/$(GOARCH),')
WEB_COMMIT:=$(shell echo $(VERSION) | cut -b -9)

GO_LDFLAGS += \
	-X '$(PKG_GOGET)/v3/internal/conf.BuiltAt=$(BUILD_DATE)' \
	-X '$(PKG_GOGET)/v3/internal/conf.GoVersion=$(GO_VER)' \
	-X '$(PKG_GOGET)/v3/internal/conf.GitAuthor=Entware' \
	-X '$(PKG_GOGET)/v3/internal/conf.GitCommit=$(GIT_COMMIT)' \
	-X '$(PKG_GOGET)/v3/internal/conf.Version=$(PKG_VERSION)' \
	-X '$(PKG_GOGET)/v3/internal/conf.WebVersion=$(WEB_COMMIT)'

GO_BUILD_ARGS += -trimpath
GO_TAGS:=-tags=jsoniter

define Package/alist/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/alist $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) files/S99alist $(1)/opt/etc/init.d
endef

Package/alist_nohf/install=$(Package/alist/install)

$(eval $(call BuildPackage,alist))
$(eval $(call BuildPackage,alist_nohf))
