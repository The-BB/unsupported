# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=llvm
PKG_VERSION:=15.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.xz
PKG_SOURCE_URL:=https://github.com/llvm/llvm-project/releases/download/llvmorg-$(PKG_VERSION)
PKG_HASH:=4cd035b665f3be72382b978543d897238c7faa13d13cdd7d573c2e93f23c10d0

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.TXT

HOST_BUILD_PARALLEL:=1

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

HOST_UNPACK:=xzcat "$(DL_DIR)/$(PKG_SOURCE)" | $(HOST_TAR) -C "$(HOST_BUILD_DIR)" -x --strip-components=1
PKG_UNPACK:=xzcat "$(DL_DIR)/$(PKG_SOURCE)" | $(HOST_TAR) -C "$(PKG_BUILD_DIR)" -x --strip-components=1

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

define Host/Install
	$(call Host/Uninstall)

	$(call Host/Install/Default)

	$(INSTALL_DIR) $(STAGING_DIR)/opt/bin $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/build/bin/llvm-config $(STAGING_DIR)/opt/bin
	$(LN) ../../opt/bin/llvm-config $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/build/bin/llvm-tblgen $(STAGING_DIR)/opt/bin
	$(LN) ../../opt/bin/llvm-tblgen $(STAGING_DIR)/host/bin
endef

HOST_LIST_INSTALLED:=$(HOST_BUILD_DIR)/build/install_manifest.txt

define Host/Uninstall
	if [ -f "$(HOST_LIST_INSTALLED)" ]; then \
		xargs rm < $(HOST_LIST_INSTALLED) || true; \
	fi
	rm -r $(STAGING_DIR_HOSTPKG)/bin/llvm-* || true
	rm -rf $(STAGING_DIR_HOSTPKG)/include/llvm* || true
	rm -r $(STAGING_DIR_HOSTPKG)/lib/libLLVM*.so || true
	rm -rf $(STAGING_DIR_HOSTPKG)/lib/cmake/llvm || true
	rm -rf $(STAGING_DIR_HOSTPKG)/share/opt-viewer || true
	rm -r $(STAGING_DIR)/opt/bin/llvm-* || true
	rm -r $(STAGING_DIR)/host/bin/llvm-* || true
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/llvm{,-c} $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{LLVM,LTO}*.so* $(1)/opt/lib
	# XXX for build clang-tblgen
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libLLVM*.a $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake $(1)/opt/lib
	# FIXME
	$(SED) 's,if(NOT EXISTS,if(NOT DEFINED CMAKE_CROSSCOMPILING AND NOT EXISTS,' \
		$(1)/opt/lib/cmake/llvm/LLVMExports.cmake
endef

define Package/libllvm/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{LLVM,LTO,Remarks}*.so* $(1)/opt/lib
endef

define Package/llvm/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bugpoint $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dsymutil $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llc $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/lli $(1)/opt/bin
	$(LN) llvm-symbolizer $(1)/opt/bin/llvm-addr2line
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-ar $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-as $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-bcanalyzer $(1)/opt/bin
	$(LN) llvm-objdump $(1)/opt/bin/llvm-bitcode-strip
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-c-test $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cat $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cfi-verify $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-config $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cov $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cvtres $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cxxdump $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cxxfilt $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-cxxmap $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-debuginfod{,-find} $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-diff $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-dis $(1)/opt/bin
	$(LN) llvm-ar $(1)/opt/bin/llvm-dlltool
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-dwarfdump $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-dwarfutil $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-dwp $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-exegesis $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-extract $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-gsymutil $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-ifs $(1)/opt/bin
	$(LN) llvm-objdump $(1)/opt/bin/llvm-install-name-tool
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-jitlink $(1)/opt/bin
	$(LN) llvm-ar $(1)/opt/bin/llvm-lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-libtool-darwin $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-link $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-lipo $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-lto $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-lto2 $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-mc $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-mca $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-ml $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-modextract $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-mt $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-nm $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-objcopy $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-objdump $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-opt-report $(1)/opt/bin
	$(LN) llvm-objdump $(1)/opt/bin/llvm-otool
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-pdbutil $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-profdata $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-profgen $(1)/opt/bin
	$(LN) llvm-ar $(1)/opt/bin/llvm-ranlib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-rc $(1)/opt/bin
	$(LN) llvm-readobj $(1)/opt/bin/llvm-readelf
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-readobj $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-reduce $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-remark-size-diff $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-rtdyld $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-sim $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-size $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-split $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-stress $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-strings $(1)/opt/bin
	$(LN) llvm-objcopy $(1)/opt/bin/llvm-strip
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-symbolizer $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-tapi-diff $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-tli-checker $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-undname $(1)/opt/bin
	$(LN) llvm-rc $(1)/opt/bin/llvm-windres
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/llvm-xray $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/opt $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sancov $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sanstats $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/split-file $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/verify-uselistorder $(1)/opt/bin

	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/opt-viewer $(1)/opt/share
	# XXX Entware specific: fix exec path in scripts
	$(SED) 's,^#!.*python,#!/opt/bin/python,' $(1)/opt/share/opt-viewer/opt*.py
endef

define Package/llvm-dev/install
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/llvm{,-c} $(1)/opt/include

	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.a $(1)/opt/lib

	$(INSTALL_DIR) $(1)/opt/lib/cmake
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake/llvm $(1)/opt/lib/cmake
endef

define Package/libllvm/postinst
#!/bin/sh

/opt/sbin/ldconfig > /dev/null 2>&1
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libllvm))
$(eval $(call BuildPackage,llvm))
$(eval $(call BuildPackage,llvm-dev))
