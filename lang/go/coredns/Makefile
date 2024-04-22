# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=coredns
PKG_VERSION:=1.11.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=ae2bbc29be1aaae0b3ded5d188968a6c97bb3144
PKG_SOURCE_URL:=https://github.com/coredns/coredns
PKG_MIRROR_HASH:=6db84a012be15ca1c3f0b73b4e276ff608ab67ba1f2c013403207eb6e42813aa

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include ../goenv.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/golang.mk

define Package/coredns/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=DNS server that chains plugins
  URL:=https://coredns.io
  DEPENDS:=+ca-bundle
endef

define Package/coredns
  $(call Package/coredns/Default)
  VARIANT:=hf
endef

define Package/coredns_nohf
  $(call Package/coredns/Default)
  VARIANT:=nohf
  DEPENDS+=@arm
endef

define Package/coredns/description
  CoreDNS is a DNS server/forwarder that chains plugins.
  Each plugin performs a (DNS) function.
endef

Package/coredns_nohf/description=$(Package/coredns/description)

GO_LDFLAGS += \
	-X '$(XIMPORTPATH)/coremain.GitCommit=$(COMMIT_SHORT)'

define FixPreCompile
	( cd $(PKG_BUILD_DIR); \
		$(GO_BIN) mod download; \
		$(GO_BIN) generate coredns.go; \
		$(GO_BIN) get; \
	)
endef
Hooks/Compile/Pre += FixPreCompile

define Package/coredns/install
	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/coredns $(1)/opt/sbin
endef

Package/coredns_nohf/install=$(Package/coredns/install)

$(eval $(call BuildPackage,coredns))
$(eval $(call BuildPackage,coredns_nohf))
