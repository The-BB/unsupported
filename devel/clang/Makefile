# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=clang
PKG_VERSION:=17.0.4
PKG_RELEASE:=1

CLANG_MAJOR_VERSION:=$(word 1,$(subst ., ,$(PKG_VERSION)))

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.xz
PKG_SOURCE_URL:=https://github.com/llvm/llvm-project/releases/download/llvmorg-$(PKG_VERSION)
PKG_HASH:=56c99515be2f245848dacc60fe85fe9de66cdc438ea0a1b82640e68384d0e432

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.TXT

HOST_BUILD_DEPENDS:=libxml2/host llvm/host
PKG_BUILD_DEPENDS:=llvm zlib clang/host

HOST_PATCH_DIR:=./patches-host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

HOST_UNPACK += --strip-components=1 -C $(HOST_BUILD_DIR)
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/clang/Default
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=C Language Family Front-end
  URL:=https://llvm.org/
endef

define Package/clang-analyzer
$(call Package/clang/Default)
  TITLE:=A source code analysis framework
  DEPENDS:=+clang-tools +perlbase-findbin +perlbase-hash +perlbase-sys +perlbase-term +python3
endef

define Package/clang-dev
$(call Package/clang/Default)
  SUBMENU:=Libraries
  TITLE:=Development header files for clang
  DEPENDS:=+clang-tools
endef

define Package/clang-tools
$(call Package/clang/Default)
  DEPENDS:=+libclang +libclang-cpp
endef

define Package/clang-tools-extra
$(call Package/clang/Default)
  TITLE:=Extra tools for clang
  DEPENDS:=+clang-tools
endef

define Package/git-clang-format
$(call Package/clang/Default)
  TITLE:=Integration of clang-format for git
  DEPENDS:=+clang-tools
endef

define Package/libclang
$(call Package/clang/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Runtime library for clang
  DEPENDS:=+libllvm
endef

define Package/libclang-cpp
$(call Package/clang/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Runtime library for clang
  DEPENDS:=+libllvm
endef

define Package/clang/description/Default
  This is a compiler front-end for the C family of languages (C, C++,
  Objective-C, and Objective-C++) which is built as part of the LLVM
  compiler infrastructure project.
endef

Package/clang-analyzer/description=$(Package/clang/description/Default)
Package/clang-dev/description=$(Package/clang/description/Default)
Package/clang-tools/description=$(Package/clang/description/Default)
Package/clang-tools-extra/description=$(Package/clang/description/Default)
Package/git-clang-format/description=$(Package/clang/description/Default)
Package/libclang/description=$(Package/clang/description/Default)
Package/libclang-cpp/description=$(Package/clang/description/Default)

CMAKE_BINARY_SUBDIR:=build

ifneq ($(CONFIG_CCACHE),)
HOSTCC=$(HOSTCC_NOCACHE)
HOSTCXX=$(HOSTCXX_NOCACHE)
endif

HOST_LDFLAGS += \
	-Wl,--rpath,$(STAGING_DIR_HOSTPKG)/lib

TARGET_CXXFLAGS += -pthread
TARGET_LDFLAGS += -latomic -pthread

CLANG_OPTS_COMMON:= \
	-DBUILD_SHARED_LIBS=OFF \
	-DCLANG_BUILD_TOOLS=ON \
	-DCLANG_BUILD_EXAMPLES=OFF \
	-DCLANG_INCLUDE_DOCS=OFF \
	-DCLANG_INCLUDE_TESTS=OFF \
	-DLLVM_DYLIB_COMPONENTS=all \
	-DLLVM_INCLUDE_TESTS=OFF \
	-DLLVM_LINK_LLVM_DYLIB=ON \
	-DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON

CLANG_OPTS_HOST:= \
	$(CLANG_OPTS_COMMON) \
 	-DCLANG_DEFAULT_LINKER=$(TARGET_CROSS)ld \
	-DCMAKE_INSTALL_RPATH="$(STAGING_DIR_HOSTPKG)/lib" \
	-DLLVM_CMAKE_DIR=$(STAGING_DIR_HOSTPKG)/lib/cmake/llvm

CMAKE_HOST_OPTIONS += $(CLANG_OPTS_HOST)

CLANG_OPTS_TARGET:= \
	$(CLANG_OPTS_COMMON) \
	-DCLANG_TABLEGEN=$(STAGING_DIR)/opt/bin/clang-tblgen \
	-DCMAKE_CROSSCOMPILING=TRUE \
	-DLLVM_DIR=$(STAGING_DIR)/opt/lib/cmake/llvm \
	-DLLVM_CMAKE_DIR=$(STAGING_DIR)/opt/lib/cmake/llvm \
	-DLLVM_FORCE_USE_OLD_HOST_TOOLCHAIN=ON \
	-DLLVM_MAIN_INCLUDE_DIR=$(STAGING_DIR)/opt/include \
	-DLLVM_TABLEGEN_EXE=$(STAGING_DIR)/opt/bin/llvm-tblgen \
	-DLLVM_TOOLS_BINARY_DIR=$(STAGING_DIR_HOSTPKG)/bin

CMAKE_OPTIONS += $(CLANG_OPTS_TARGET)

define Host/Uninstall
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{analyze-build,c-index-test,diagtool}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{git-clang-format,hmaptool,intercept-build}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/clang*
	rm -f $(STAGING_DIR_HOSTPKG)/bin/scan-{build*,view}
	rm -fr $(STAGING_DIR_HOSTPKG)/include/clang*
	rm -fr $(STAGING_DIR_HOSTPKG)/lib/{clang,libear,libscanbuild}
	rm -f $(STAGING_DIR_HOSTPKG)/lib/libclang*.{a,so*}
	rm -f $(STAGING_DIR_HOSTPKG)/libexec/{*analyze*,intercept-*}
	rm -fr $(STAGING_DIR_HOSTPKG)/lib/cmake/clang
	rm -fr $(STAGING_DIR_HOSTPKG)/share/{clang,scan-{build,view}}
endef

define Build/Clean
	rm -f $(STAGING_DIR)/host/bin/clang-tblgen
	rm -f $(STAGING_DIR)/opt/bin/clang-tblgen
endef

define PrepTarget
	$(INSTALL_DIR) $(STAGING_DIR)/opt/bin $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/build/bin/clang-tblgen $(STAGING_DIR)/opt/bin
	$(LN) ../../opt/bin/clang-tblgen $(STAGING_DIR)/host/bin
endef

Hooks/Configure/Pre += PrepTarget

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/clang{,-c} $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/c{lang,make} $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libclang*.so* $(1)/opt/lib
endef

define Package/libclang/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libclang.so* $(1)/opt/lib
endef

define Package/libclang-cpp/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libclang-cpp.so* $(1)/opt/lib
endef

define Package/clang-analyzer/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/analyze-build $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/intercept-build $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/scan-build{,-py} $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/scan-view $(1)/opt/bin
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*perl,#!/opt/bin/perl,' $(1)/opt/bin/scan-build
	$(SED) 's,^#!.*python,#!/opt/bin/python,' \
		$(1)/opt/bin/{analyze-build,intercept-build,scan-build-py,scan-view}
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libear $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libscanbuild $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/libexec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/libexec/{analyze,intercept}-c{++,c} \
		$(1)/opt/libexec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/libexec/c{++,cc}-analyzer \
		$(1)/opt/libexec
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*perl,#!/opt/bin/perl,' $(1)/opt/libexec/c{++,cc}-analyzer
	$(SED) 's,^#!.*python,#!/opt/bin/python,' \
			$(1)/opt/libexec/{analyze,intercept}-c{++,c}
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/scan-{build,view} $(1)/opt/share
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/share/scan-view/*.py
endef

define Package/clang-dev/install
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/clang{,-c} $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/c{lang,make} $(1)/opt/lib
	$(CP) $(PKG_BUILD_DIR)/build/lib/libclang*.a $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/clang $(1)/opt/share
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/share/clang/*.py
endef

define Package/clang-tools/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-$(CLANG_MAJOR_VERSION) \
		$(1)/opt/bin
	$(LN) clang-$(CLANG_MAJOR_VERSION) $(1)/opt/bin/clang
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang++ $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-cl $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-cpp $(1)/opt/bin
endef

define Package/clang-tools-extra/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/c-index-test $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-check $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-extdef-mapping $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-format $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-linker-wrapper $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-offload-bundler $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-offload-packager $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-refactor $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-rename $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-repl $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/clang-scan-deps $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/diagtool $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hmaptool $(1)/opt/bin
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/bin/hmaptool
endef

define Package/git-clang-format/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/git-clang-format $(1)/opt/bin
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/bin/git-clang-format
endef

define Package/libclang/postinst
#!/bin/sh

/opt/sbin/ldconfig > /dev/null 2>&1
endef

Package/libclang-cpp/postinst=$(Package/clang/postinst)

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libclang))
$(eval $(call BuildPackage,libclang-cpp))
$(eval $(call BuildPackage,clang-analyzer))
$(eval $(call BuildPackage,clang-dev))
$(eval $(call BuildPackage,clang-tools))
$(eval $(call BuildPackage,clang-tools-extra))
$(eval $(call BuildPackage,git-clang-format))
