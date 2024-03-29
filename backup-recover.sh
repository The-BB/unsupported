#!/bin/sh

if [ ! -d ./feeds/unsupported ]; then
  echo "error: change the directory" && exit 1
fi

OLDPORTS_FEED="./feeds/oldports"
PACKAGES_FEED="./feeds/packages"
PATCH_DIR="./feeds/unsupported/_patches"
PATCH_OLDPORTS="$PATCH_DIR/livemedia-add-shared-libs.patch"
PATCH_PACKAGE="\
$PATCH_DIR/package-libs-libxml2-fix-args.patch
$PATCH_DIR/package-utils-e2fsprogs-add-libe2p.patch
"
PATCH_PACKAGES="\
$PATCH_DIR/libs-libmpeg2-add-as-dependency.patch
$PATCH_DIR/libs-libvpx-add-as-dependency.patch
$PATCH_DIR/multimedia-ffmpeg-disable-sndio.patch
$PATCH_DIR/multimedia-gst1-libav-add-as-dependency.patch
$PATCH_DIR/multimedia-gst1-plugins-base-add-as-dependency.patch
$PATCH_DIR/multimedia-gstreamer1-add-as-dependency.patch
$PATCH_DIR/net-samba4-add-as-dependency.patch
$PATCH_DIR/utils-collectd-fix-opts.patch
$PATCH_DIR/utils-domoticz-adapted.patch
$PATCH_DIR/utils-openzwave-adapted.patch
"
STAMP_OLDPORTS="$PATCH_DIR/.oldports-patched"
STAMP_PACKAGE="$PATCH_DIR/.package-patched"
STAMP_PACKAGES="$PATCH_DIR/.packages-patched"

GO_PKG="\
$PACKAGES_FEED/net/alist
$PACKAGES_FEED/net/cloudreve
$PACKAGES_FEED/net/croc
$PACKAGES_FEED/net/dnsproxy
$PACKAGES_FEED/net/trojan-go
"

backup() {
# base
if [ ! -f $STAMP_PACKAGE ]; then
  for PATCH in $PATCH_PACKAGE; do patch -p1 -b -d . < "$PATCH"; done
  touch $STAMP_PACKAGE
fi
# oldports feed
if [ ! -f $STAMP_OLDPORTS ]; then
  patch -p1 -b -d $OLDPORTS_FEED < $PATCH_OLDPORTS
  touch $STAMP_OLDPORTS
fi
# packages feed
if [ ! -f $STAMP_PACKAGES ]; then
  for PATCH in $PATCH_PACKAGES; do patch -p1 -b -d $PACKAGES_FEED < "$PATCH"; done
  touch $STAMP_PACKAGES
  # go
  for pkg in $GO_PKG
    do
      if [ ! -f "$pkg"/Makefile.orig ]; then
	mv "$pkg"/Makefile "$pkg"/Makefile.orig
      fi
  done
fi
}

check() {
# base
if [ ! -f $STAMP_PACKAGE ]; then
  for PATCH in $PATCH_PACKAGE; do patch -p1 --dry-run -d . < "$PATCH"; done
else
  echo "base: Reversed (or previously applied) patch detected!"
fi
# oldports feed
if [ ! -f $STAMP_OLDPORTS ]; then
  patch -p1 --dry-run -d $OLDPORTS_FEED < $PATCH_OLDPORTS
else
  echo "oldports: Reversed (or previously applied) patch detected!"
fi
# packages feed
if [ ! -f $STAMP_PACKAGES ]; then
  for PATCH in $PATCH_PACKAGES; do patch -p1 --dry-run -d $PACKAGES_FEED < "$PATCH"; done
else
  echo "packages: Reversed (or previously applied) patch detected!"
fi
}

recovery() {
# base
if [ -f $STAMP_PACKAGE ]; then
  for PATCH in $PATCH_PACKAGE; do patch -p1 -R -d . < "$PATCH"; done
  rm $STAMP_PACKAGE
  find ./package/libs/libxml2 ./package/utils/e2fsprogs -type f -name "*.orig" -delete
fi
# oldports feed
if [ -f $STAMP_OLDPORTS ]; then
  patch -p1 -R -d $OLDPORTS_FEED < $PATCH_OLDPORTS
  rm $STAMP_OLDPORTS
  find $OLDPORTS_FEED/livemedia -type f -name "*.orig" -delete
fi
# packages feed
if [ -f $STAMP_PACKAGES ]; then
  for PATCH in $PATCH_PACKAGES; do patch -p1 -R -d $PACKAGES_FEED < "$PATCH"; done
  rm $STAMP_PACKAGES
  for pkg in $GO_PKG
    do
      if [ -f "$pkg"/Makefile.orig ]; then
	mv "$pkg"/Makefile.orig "$pkg"/Makefile
      fi
  done
  FEED=$PACKAGES_FEED
  find $FEED/libs $FEED/multimedia $FEED/net $FEED/utils -type f -name "*.orig" -delete
fi
}

case "$1" in
    backup)
	backup
	[ $? -eq 0 ] && echo "Done"
    ;;
    check)
	check
    ;;
    recovery)
	recovery
	[ $? -eq 0 ] && echo "Done"
    ;;
    *)
	echo "Usage: $0 {backup|check|recovery}"
	exit 1
    ;;
esac

exit 0
