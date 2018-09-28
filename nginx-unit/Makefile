#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nginx-unit
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://codeload.github.com/nginx/unit/tar.gz/$(PKG_VERSION)?
PKG_SOURCE:=unit-$(PKG_VERSION).tar.gz
PKG_HASH:=e9320c8ffe77dc4f49d089d71a02a0624b7c3bb349577b95ab993c493364b92b
PKG_BUILD_DIR:=$(BUILD_DIR)/nginx-unit-$(PKG_VERSION)

PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

PKG_LICENSE:=Apache 2.0

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

PKG_CONFIG_DEPENDS:= \
  CONFIG_IPV6 \
  NGINX_UNIT_OPENSSL \
  \
  NGINX_UNIT_PERL \
  NGINX_UNIT_PHP \
  NGINX_UNIT_PYTHON \
  NGINX_UNIT_PYTHON3 \
  NGINX_UNIT_RUBY

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/nginx-unit
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=NGINX Unit
  URL:=http://unit.nginx.org
  DEPENDS:=+USE_UCLIBC:librt +USE_UCLIBC:libpthread +curl \
	+NGINX_UNIT_OPENSSL:libopenssl \
	\
	+NGINX_UNIT_PERL:perl \
	+NGINX_UNIT_PERL:perlbase-arybase \
	+NGINX_UNIT_PERL:perlbase-attributes \
	+NGINX_UNIT_PERL:perlbase-b \
	+NGINX_UNIT_PERL:perlbase-compress \
	+NGINX_UNIT_PERL:perlbase-cwd \
	+NGINX_UNIT_PERL:perlbase-data \
	+NGINX_UNIT_PERL:perlbase-db-file \
	+NGINX_UNIT_PERL:perlbase-devel \
	+NGINX_UNIT_PERL:perlbase-digest \
	+NGINX_UNIT_PERL:perlbase-encode \
	+NGINX_UNIT_PERL:perlbase-fcntl \
	+NGINX_UNIT_PERL:perlbase-file \
	+NGINX_UNIT_PERL:perlbase-filter \
	+NGINX_UNIT_PERL:perlbase-gdbm-file \
	+NGINX_UNIT_PERL:perlbase-hash \
	+NGINX_UNIT_PERL:perlbase-i18n \
	+NGINX_UNIT_PERL:perlbase-io \
	+NGINX_UNIT_PERL:perlbase-ipc \
	+NGINX_UNIT_PERL:perlbase-list \
	+NGINX_UNIT_PERL:perlbase-math \
	+NGINX_UNIT_PERL:perlbase-mime \
	+NGINX_UNIT_PERL:perlbase-mro \
	+NGINX_UNIT_PERL:perlbase-opcode \
	+NGINX_UNIT_PERL:perlbase-perlio \
	+NGINX_UNIT_PERL:perlbase-posix \
	+NGINX_UNIT_PERL:perlbase-re \
	+NGINX_UNIT_PERL:perlbase-sdbm-file \
	+NGINX_UNIT_PERL:perlbase-socket \
	+NGINX_UNIT_PERL:perlbase-storable \
	+NGINX_UNIT_PERL:perlbase-sys \
	+NGINX_UNIT_PERL:perlbase-threads \
	+NGINX_UNIT_PERL:perlbase-tie \
	+NGINX_UNIT_PERL:perlbase-time \
	+NGINX_UNIT_PERL:perlbase-unicode \
	\
	+NGINX_UNIT_PHP:php7-lib \
	\
	+NGINX_UNIT_PYTHON:python-base \
	+NGINX_UNIT_PYTHON:python-codecs \
	\
	+NGINX_UNIT_PYTHON3:python3-base \
	+NGINX_UNIT_PYTHON3:python3-codecs \
	\
	+NGINX_UNIT_RUBY:ruby \
	+NGINX_UNIT_RUBY:ruby-gems \
	+NGINX_UNIT_RUBY:ruby-enc-extra
endef

define Package/nginx-unit/description
    NGINX Unit is a dynamic web and application server, designed to run \
applications in multiple languages.
endef

define Package/nginx-unit/config
  source "$(SOURCE)/Config.in"
endef

define Package/nginx-unit/conffiles
/opt/var/lib/nginx/unit/
endef

#ifeq ($(CONFIG_GCC_USE_VERSION_7_3_0),y)
#TARGET_CFLAGS +=-Wimplicit-fallthrough=0
#endif

TARGET_CFLAGS += -Werror -Wno-error=cpp -Wno-implicit-function-declaration
TARGET_LDFLAGS += -ldl -lm -lrt -lpthread

# Strip options that configure script does not recognize
CONFIGURE_ARGS:=$(filter-out	\
	--target=%		\
	--host=%		\
	--build=%		\
	--program-prefix=%	\
	--program-suffix=%	\
	--exec-prefix=%		\
	--libexecdir=%		\
	--sysconfdir=%		\
	--datadir=%		\
	--localstatedir=%	\
	--mandir=%		\
	--infodir=%		\
	--disable-nls		\
	, $(CONFIGURE_ARGS))

CONFIGURE_ARGS += \
		--cc="$(TARGET_CC)" \
		--cc-opt="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
		--ld-opt="$(TARGET_LDFLAGS)" \
		--prefix=/opt \
		--modules=/opt/lib/nginx/unit \
		--state=/opt/var/lib/nginx/unit \
		--pid=/opt/var/run/unit.pid \
		--log=/opt/var/log/unit.log \
		--control=unix:/opt/var/run/control.unit.sock \
		--user=nobody \
		--group=

define Build/Prepare
	$(Build/Prepare/Default)
endef

define Build/Compile

  ifeq ($(CONFIG_NGINX_UNIT_OPENSSL),y)
	cd $(PKG_BUILD_DIR); ./configure \
	$(CONFIGURE_ARGS) \
	--openssl
  endif

#  ifeq ($(CONFIG_NGINX_UNIT_GO),y)
#	cd $(PKG_BUILD_DIR); ./configure \
#	go \
#	--go=$(STAGING_DIR_HOSTPKG)/bin/go \
#	--go-path=$(STAGING_DIR_HOSTPKG)/lib/go-cross
#  endif

  ifeq ($(CONFIG_NGINX_UNIT_PERL),y)
	$(SED) '62c\    NXT_PERL_INCPATH="$(STAGING_DIR)/opt/lib/perl5/5.28/CORE"' \
	-e '65c\    NXT_PERL_LDOPTS=" -fstack-protector-strong \
	-L$(STAGING_DIR)/opt/lib \
	-L$(STAGING_DIR)/opt/lib/perl5/5.28/CORE -lperl -lpthread -lnsl -ldl -lm -lcrypt -lutil -lc -lrt"' \
	$(PKG_BUILD_DIR)/auto/modules/perl

	cd $(PKG_BUILD_DIR); ./configure \
	perl
	#--perl=$(STAGING_DIR_HOSTPKG)/usr/bin/perl \
	#--include=$(STAGING_DIR)/opt/lib/perl5/5.28/CORE
  endif

  ifeq ($(CONFIG_NGINX_UNIT_PHP),y)
	cd $(PKG_BUILD_DIR); ./configure \
	php --config=$(STAGING_DIR)/opt/bin/php7-config \
	--lib-path=$(STAGING_DIR)/opt/lib
  endif

  ifeq ($(CONFIG_NGINX_UNIT_PYTHON),y)
	$(CP) $(STAGING_DIR_HOSTPKG)/bin/python3.7-config $(STAGING_DIR)/opt/bin/python2.7-config
	$(SED) 's|$(STAGING_DIR_HOSTPKG)|$(STAGING_DIR)/opt|g' \
	-e 's|VERSION="3.7"|VERSION="2.7"|' -e 's|/lib/python3.7/config-.*" |/lib/python2.7/config" |' \
	-e 's|cpython-37.so|cpython-27.so|' -e 's|-I$(STAGING_DIR)/host/include|-I$(TOOLCHAIN_DIR)/include|' \
	-e 's|-I$(STAGING_DIR_HOST)/include||' \
	$(STAGING_DIR)/opt/bin/python2.7-config

	$(SED) 's|"$NXT_PYTHON_CONFIG --prefix"|echo "$(STAGING_DIR)/opt"|' \
	-e '67c\    NXT_PYTHON_INCLUDE="-I$(STAGING_DIR)/opt/include/python2.7"' \
	-e '68c\    NXT_PYTHON_LIBS="-L$(STAGING_DIR)/opt/lib/python2.7/config \
	-L$(STAGING_DIR)/opt/lib -lpython2.7 -lz -lpthread -ldl -lutil -lm -Xlinker -export-dynamic"' \
	$(PKG_BUILD_DIR)/auto/modules/python

	cd $(PKG_BUILD_DIR); ./configure \
	python \
	--config=$(STAGING_DIR)/opt/bin/python2.7-config \
	--lib-path=$(STAGING_DIR)/opt/lib
  endif

  ifeq ($(CONFIG_NGINX_UNIT_PYTHON3),y)
	$(CP) $(STAGING_DIR_HOSTPKG)/bin/python3.7-config $(STAGING_DIR)/opt/bin/
	$(SED) 's|$(STAGING_DIR_HOSTPKG)|$(STAGING_DIR)/opt|g' \
	-e 's|-I$(STAGING_DIR)/host/include|-I$(TOOLCHAIN_DIR)/include|' \
	-e 's|-I$(STAGING_DIR_HOST)/include||' \
	$(STAGING_DIR)/opt/bin/python3.7-config

	$(SED) 's|"$NXT_PYTHON_CONFIG --prefix"|echo "$(STAGING_DIR)/opt"|' \
	-e '67c\    NXT_PYTHON_INCLUDE="-I$(STAGING_DIR)/opt/include/python3.7"' \
	-e '68c\    NXT_PYTHON_LIBS="-L$(STAGING_DIR)/opt/lib/python3.7/config-3.7 \
	-L$(STAGING_DIR)/opt/lib -lpython3.7 -lz -lpthread -ldl -lutil -lm -Xlinker -export-dynamic"' \
	$(PKG_BUILD_DIR)/auto/modules/python

	cd $(PKG_BUILD_DIR); ./configure \
	python \
	--config=$(STAGING_DIR)/opt/bin/python3.7-config \
	--lib-path=$(STAGING_DIR)/opt/lib
  endif

  ifeq ($(CONFIG_NGINX_UNIT_RUBY),y)
	$(SED) '59c\    NXT_RUBY_RUBYHDRDIR="$(STAGING_DIR)/opt/include/ruby-2.5"' \
	-e '60c\    NXT_RUBY_ARCHHDRDIR="$(STAGING_DIR)/opt/include/ruby-2.5/$(ARCH)-linux-gnu"' \
	-e '63c\    NXT_RUBY_LIBNAME="ruby"' \
	-e '64c\    NXT_RUBY_LIBSCONF=" -ldl -lcrypt -lm -lpthread"' \
	-e '65c\    NXT_RUBY_LIBPATH="$(STAGING_DIR)/opt/lib"' \
	$(PKG_BUILD_DIR)/auto/modules/ruby

	cd $(PKG_BUILD_DIR); ./configure \
	ruby
	#--ruby=$(STAGING_DIR_HOSTPKG)/bin/ruby
  endif

endef

define Package/nginx-unit/install
	$(INSTALL_DIR) $(1)/opt/{lib,sbin,share/www,var/lib/nginx/unit}
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/sbin/unitd $(1)/opt/sbin

	if [ -d $(PKG_INSTALL_DIR)/opt/lib ]; then \
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/* $(1)/opt/lib/; \
	$(CP) ./files/* $(1)/; \
	fi
endef

define Package/nginx-unit/postinst
#!/bin/sh

if [ -f /opt/lib/nginx/unit/perl.unit.so ] | grep -q "/opt/lib/perl5" /opt/etc/ld.so.conf; then
echo "Perl's lib dirs already added"
else
echo "Added perl's lib dirs to /opt/etc/ld.so.conf"

echo "/opt/lib/perl5/5.28/CORE
/opt/lib/perl5/5.28/auto/arybase
/opt/lib/perl5/5.28/auto/attributes
/opt/lib/perl5/5.28/auto/B
/opt/lib/perl5/5.28/auto/Compress/Raw/Bzip2
/opt/lib/perl5/5.28/auto/Compress/Raw/Zlib
/opt/lib/perl5/5.28/auto/Cwd
/opt/lib/perl5/5.28/auto/Data/Dumper
/opt/lib/perl5/5.28/auto/DB_File
/opt/lib/perl5/5.28/auto/Devel/Peek
/opt/lib/perl5/5.28/auto/Digest/MD5
/opt/lib/perl5/5.28/auto/Digest/SHA
/opt/lib/perl5/5.28/auto/Encode/Byte
/opt/lib/perl5/5.28/auto/Encode/CN
/opt/lib/perl5/5.28/auto/Encode/EBCDIC
/opt/lib/perl5/5.28/auto/Encode
/opt/lib/perl5/5.28/auto/Encode/JP
/opt/lib/perl5/5.28/auto/Encode/KR
/opt/lib/perl5/5.28/auto/Encode/Symbol
/opt/lib/perl5/5.28/auto/Encode/TW
/opt/lib/perl5/5.28/auto/Encode/Unicode
/opt/lib/perl5/5.28/auto/Fcntl
/opt/lib/perl5/5.28/auto/File/DosGlob
/opt/lib/perl5/5.28/auto/File/Glob
/opt/lib/perl5/5.28/auto/Filter/Util/Call
/opt/lib/perl5/5.28/auto/GDBM_File
/opt/lib/perl5/5.28/auto/Hash/Util/FieldHash
/opt/lib/perl5/5.28/auto/Hash/Util
/opt/lib/perl5/5.28/auto/I18N/Langinfo
/opt/lib/perl5/5.28/auto/IO
/opt/lib/perl5/5.28/auto/IPC/SysV
/opt/lib/perl5/5.28/auto/List/Util
/opt/lib/perl5/5.28/auto/Math/BigInt/FastCalc
/opt/lib/perl5/5.28/auto/MIME/Base64
/opt/lib/perl5/5.28/auto/mro
/opt/lib/perl5/5.28/auto/Opcode
/opt/lib/perl5/5.28/auto/PerlIO/encoding
/opt/lib/perl5/5.28/auto/PerlIO/mmap
/opt/lib/perl5/5.28/auto/PerlIO/scalar
/opt/lib/perl5/5.28/auto/PerlIO/via
/opt/lib/perl5/5.28/auto/POSIX
/opt/lib/perl5/5.28/auto/re
/opt/lib/perl5/5.28/auto/SDBM_File
/opt/lib/perl5/5.28/auto/Socket
/opt/lib/perl5/5.28/auto/Storable
/opt/lib/perl5/5.28/auto/Sys/Hostname
/opt/lib/perl5/5.28/auto/Sys/Syslog
/opt/lib/perl5/5.28/auto/threads/shared
/opt/lib/perl5/5.28/auto/threads
/opt/lib/perl5/5.28/auto/Tie/Hash/NamedCapture
/opt/lib/perl5/5.28/auto/Time/HiRes
/opt/lib/perl5/5.28/auto/Time/Piece
/opt/lib/perl5/5.28/auto/Unicode/Collate
/opt/lib/perl5/5.28/auto/Unicode/Normalize" \
>> /opt/etc/ld.so.conf
ldconfig > /dev/null 2>&1
fi
if [ -f /opt/lib/nginx/unit/ruby.unit.so -a ! -f /opt/bin/rackup ]; then
gem install rack
fi
endef

$(eval $(call BuildPackage,nginx-unit))
