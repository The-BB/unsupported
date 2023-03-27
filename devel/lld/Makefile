# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=lld
PKG_VERSION:=15.0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.xz
PKG_SOURCE_URL:=https://github.com/llvm/llvm-project/releases/download/llvmorg-$(PKG_VERSION)
PKG_HASH:=dba5c70c3fe88b3a38b9180df82fbc9d1dfd55d68f41fddd6a90f9e17f8e5df9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.TXT

PKG_BUILD_DEPENDS:=llvm

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK:=xzcat "$(DL_DIR)/$(PKG_SOURCE)" | $(HOST_TAR) -C "$(PKG_BUILD_DIR)" -x --strip-components=1

define Package/lld
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=LLVM Linker
  URL:=https://llvm.org/
  DEPENDS:=+libatomic +libllvm +libstdcpp +zlib
endef

define Package/lld/description
  LLVM Linker (lld).
endef

CMAKE_BINARY_SUBDIR:=build

TARGET_CXXFLAGS += -pthread
TARGET_LDFLAGS += -latomic -pthread

define Package/lld/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/lld $(1)/opt/bin
	for bins in ld.lld ld64.lld lld-link wasm-ld; do \
		$(LN) lld $(1)/opt/bin/$$$$bins; \
	done
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib/cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake/lld $(1)/opt/lib/cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/liblld*.a $(1)/opt/lib
endef

$(eval $(call BuildPackage,lld))
