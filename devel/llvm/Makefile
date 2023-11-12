# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=llvm
PKG_VERSION:=17.0.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.xz
PKG_SOURCE_URL:=https://github.com/llvm/llvm-project/releases/download/llvmorg-$(PKG_VERSION)
PKG_HASH:=4f5907fb547947d10df35230a0fc73cf2f81aa12e09fc8de96c023425412c9f6

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.TXT

HOST_BUILD_DEPENDS:=python3/host
PKG_BUILD_DEPENDS:=llvm/host

PKG_CONFIG_DEPENDS:= \
	CONFIG_LLVM_AMDGPU \
	CONFIG_LLVM_BPF \
	CONFIG_LLVM_RTTI \
	CONFIG_LLVM_WEBASSEMBLY

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/nls.mk

HOST_UNPACK += --strip-components=1 -C $(HOST_BUILD_DIR)
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/llvm/Default
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=LLVM (An Optimizing Compiler Infrastructure)
  URL:=https://llvm.org/
endef

define Package/llvm
$(call Package/llvm/Default)
  DEPENDS:=+libllvm
endef

define Package/llvm-dev
$(call Package/llvm/Default)
  SUBMENU:=Libraries
  TITLE:=Libraries and header files for LLVM
  DEPENDS:=+llvm
endef

define Package/libllvm
$(call Package/llvm/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=LLVM shared libraries
  DEPENDS:=+libatomic +libstdcpp +zlib
endef

define Package/llvm/description/Default
LLVM is a compiler infrastructure designed for compile-time, link-time, runtime,
and idle-time optimization of programs from arbitrary programming languages.
LLVM is written in C++ and has been developed since 2000 at the University of
Illinois and Apple. It currently supports compilation of C and C++ programs, 
using front-ends derived from GCC 4.0.1. A new front-end for the C family of
languages is in development. The compiler infrastructure includes mirror sets
of programming tools as well as libraries with equivalent functionality.
endef

Package/llvm/description=$(Package/llvm/description/Default)
Package/llvm-dev/description=$(Package/llvm/description/Default)
Package/libllvm/description=$(Package/llvm/description/Default)

define Package/llvm/config
  menu "Configuration"
  depends on PACKAGE_llvm
  source "$(SOURCE)/Config.in"
  endmenu
endef

CMAKE_BINARY_SUBDIR:=build

ifneq ($(CONFIG_CCACHE),)
HOSTCC=$(HOSTCC_NOCACHE)
HOSTCXX=$(HOSTCXX_NOCACHE)
endif

LLVM_TARGET_ARCH = $(call qstrip,$(CONFIG_LLVM_TARGET_ARCH))
LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)

ifeq ($(CONFIG_LLVM_AMDGPU),y)
LLVM_TARGETS_TO_BUILD += AMDGPU
endif

ifeq ($(CONFIG_LLVM_BPF),y)
LLVM_TARGETS_TO_BUILD += BPF
endif

ifeq ($(CONFIG_LLVM_WEBASSEMBLY),y)
LLVM_TARGETS_TO_BUILD += WebAssembly
endif

TARGET_CXXFLAGS += -pthread
TARGET_LDFLAGS += -latomic -pthread

LLVM_OPTS_COMMON:= \
	-DBUILD_SHARED_LIBS=OFF \
	-DLLVM_APPEND_VC_REV=OFF \
	-DLLVM_BUILD_DOCS=OFF \
	-DLLVM_BUILD_EXAMPLES=OFF \
	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
	-DLLVM_BUILD_LLVM_DYLIB=ON \
	-DLLVM_BUILD_RUNTIME=OFF \
	-DLLVM_BUILD_TESTS=OFF \
	-DLLVM_CCACHE_BUILD=$(if $(CONFIG_CCACHE),ON,OFF) \
	-DLLVM_ENABLE_BACKTRACES=OFF \
	-DLLVM_ENABLE_BINDINGS=OFF \
	-DLLVM_ENABLE_CRASH_OVERRIDES=ON \
	-DLLVM_ENABLE_DOXYGEN=OFF \
	-DLLVM_ENABLE_FFI=OFF \
	-DLLVM_ENABLE_LIBCXX=OFF \
	-DLLVM_ENABLE_LIBEDIT=OFF \
	-DLLVM_ENABLE_LIBPFM=OFF \
	-DLLVM_ENABLE_LIBXML2=OFF \
	-DLLVM_ENABLE_LLD=OFF \
	-DLLVM_ENABLE_LOCAL_SUBMODULE_VISIBILITY=OFF \
	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF \
	-DLLVM_ENABLE_MODULES=OFF \
	-DLLVM_ENABLE_OCAMLDOC=OFF \
	-DLLVM_ENABLE_PEDANTIC=ON \
	-DLLVM_ENABLE_PIC=ON \
	-DLLVM_ENABLE_PROJECTS="" \
	-DLLVM_ENABLE_RTTI=$(if $(CONFIG_LLVM_RTTI),ON,OFF) \
	-DLLVM_ENABLE_SPHINX=OFF \
	-DLLVM_ENABLE_TERMINFO=OFF \
	-DLLVM_ENABLE_THREADS=ON \
	-DLLVM_ENABLE_Z3_SOLVER=OFF \
	-DLLVM_ENABLE_WARNINGS=ON \
	-DLLVM_ENABLE_WERROR=OFF \
	-DLLVM_ENABLE_ZLIB=ON \
	-DLLVM_ENABLE_ZSTD=OFF \
	-DLLVM_ENABLE_UNWIND_TABLES=OFF \
	-DLLVM_EXTRA_PROJECTS="" \
	-DLLVM_HAVE_LIBXAR=0 \
	-DLLVM_INCLUDE_BENCHMARKS=OFF \
	-DLLVM_INCLUDE_DOCS=OFF \
	-DLLVM_INCLUDE_EXAMPLES=OFF \
	-DLLVM_INCLUDE_GO_TESTS=OFF \
	-DLLVM_INCLUDE_RUNTIMES=OFF \
	-DLLVM_INCLUDE_TESTS=OFF \
	-DLLVM_INCLUDE_TOOLS=ON \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_LINK_LLVM_DYLIB=ON \
	-DLLVM_POLLY_BUILD=OFF \
	-DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
	-DLLVM_UNREACHABLE_OPTIMIZE=OFF

LLVM_OPTS_HOST += \
	$(LLVM_OPTS_COMMON) \
	-DCMAKE_INSTALL_RPATH="$(STAGING_DIR_HOSTPKG)/lib" \
	-DLLVM_BUILD_TOOLS=ON \
	-DLLVM_BUILD_UTILS=ON \
	-DLLVM_INCLUDE_UTILS=ON \
	-DLLVM_INSTALL_UTILS=ON \
	-DLLVM_OPTIMIZED_TABLEGEN=ON \
	-DLLVM_TARGETS_TO_BUILD="AArch64;ARM;Mips;X86;$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))" \
	-DLLVM_TARGET_ARCH="host"

CMAKE_HOST_OPTIONS += $(LLVM_OPTS_HOST)

LLVM_OPTS_TARGET += \
	$(LLVM_OPTS_COMMON) \
	-DCMAKE_CROSSCOMPILING=TRUE \
	-DLLVM_BUILD_UTILS=OFF \
	-DLLVM_CONFIG_PATH=$(STAGING_DIR)/opt/bin/llvm-config \
	-DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
	-DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME) \
	-DLLVM_INCLUDE_UTILS=OFF \
	-DLLVM_INSTALL_UTILS=OFF \
	-DLLVM_TABLEGEN=$(STAGING_DIR)/opt/bin/llvm-tblgen \
	-DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))" \
	-DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)

CMAKE_OPTIONS += $(LLVM_OPTS_TARGET)

define Host/Uninstall
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{FileCheck,UnicodeNameMappingGenerator}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{bugpoint,count,dsymutil}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/ll{c,i,vm-}*
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{not,obj2yaml,opt,sancov,sanstats}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/{split-file,verify-uselistorder}
	rm -f $(STAGING_DIR_HOSTPKG)/bin/yaml{-bench,2obj}
	rm -fr $(STAGING_DIR_HOSTPKG)/include/llvm*
	rm -f $(STAGING_DIR_HOSTPKG)/lib/libLLVM*.{a,so}
	rm -f $(STAGING_DIR_HOSTPKG)/lib/lib{LTO,Remarks}.so*
	rm -fr $(STAGING_DIR_HOSTPKG)/lib/cmake/llvm
	rm -fr $(STAGING_DIR_HOSTPKG)/share/opt-viewer
endef

define Build/Clean
	rm -f $(STAGING_DIR)/host/bin/llvm-*
	rm -f $(STAGING_DIR)/opt/bin/llvm-*
endef

define PrepTarget
	$(INSTALL_DIR) $(STAGING_DIR)/opt/bin $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/build/bin/llvm-config $(STAGING_DIR)/opt/bin
	$(LN) ../../opt/bin/llvm-config $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/build/bin/llvm-tblgen $(STAGING_DIR)/opt/bin
	$(LN) ../../opt/bin/llvm-tblgen $(STAGING_DIR)/host/bin
endef

Hooks/Configure/Pre += PrepTarget

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/llvm{,-c} $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake $(1)/opt/lib
	$(SED) 's,if(NOT EXISTS,if(NOT DEFINED CMAKE_CROSSCOMPILING AND NOT EXISTS,' \
		$(1)/opt/lib/cmake/llvm/LLVMExports.cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libLLVM*.{a,so*} $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{LTO,Remarks}.so* $(1)/opt/lib
endef

define Package/libllvm/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{LLVM,LTO,Remarks}*.so* $(1)/opt/lib
endef

define Package/llvm/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/opt-viewer $(1)/opt/share
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/share/opt-viewer/opt*.py
endef

define Package/llvm-dev/install
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/llvm{,-c} $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.a $(1)/opt/lib
endef

define Package/libllvm/postinst
#!/bin/sh

/opt/sbin/ldconfig > /dev/null 2>&1
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libllvm))
$(eval $(call BuildPackage,llvm))
$(eval $(call BuildPackage,llvm-dev))
