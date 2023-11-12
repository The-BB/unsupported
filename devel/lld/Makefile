# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=lld
PKG_VERSION:=17.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.xz
PKG_SOURCE_URL:=https://github.com/llvm/llvm-project/releases/download/llvmorg-$(PKG_VERSION)
PKG_HASH:=47f5da4d28c60d69ab134c028ece0af8a5e18aca940d26a672265a381cafdc50

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.TXT

PKG_BUILD_DEPENDS:=llvm

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

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
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib/cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake/lld $(1)/opt/lib/cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/liblld*.a $(1)/opt/lib
endef

$(eval $(call BuildPackage,lld))
