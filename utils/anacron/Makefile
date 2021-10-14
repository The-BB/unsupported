# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=anacron
PKG_VERSION:=2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/anacron
PKG_HASH:=5ceee6f22cd089bdaf1c0841200dbe5726babaf9e2c432bb17c1fc95da5ca99f

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/anacron
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A cron-like periodic command scheduler
  URL:=https://sourceforge.net/projects/anacron/
endef

define Package/anacron/description
  cron-like program that doesn't go by time Anacron (like "anac(h)ronistic")
  is a periodic command scheduler.  It executes commands at intervals specified
  in days.  Unlike cron, it does not assume that the system is running
  continuously.  It can therefore be used to control the execution of daily,
  weekly, and monthly jobs (or anything with a period of n days), on systems
  that don't run 24 hours a day.  When installed and configured properly,
  Anacron will make sure that the commands are run at the specified
  intervals as closely as machine uptime permits.
endef

define Package/anacron/install
	$(INSTALL_DIR) $(1)/opt/etc/cron.{daily,monthly,weekly}
	$(INSTALL_BIN) files/00anacron.daily $(1)/opt/etc/cron.daily/00anacron
	$(INSTALL_BIN) files/00anacron.monthly $(1)/opt/etc/cron.monthly/00anacron
	$(INSTALL_BIN) files/00anacron.weekly $(1)/opt/etc/cron.weekly/00anacron

	$(INSTALL_DATA) files/anacrontab $(1)/opt/etc

	$(INSTALL_DIR) $(1)/opt/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/anacron $(1)/opt/sbin
	$(INSTALL_BIN) files/run-anacron $(1)/opt/sbin

	$(INSTALL_DIR) $(1)/opt/var/spool/anacron
endef

$(eval $(call BuildPackage,anacron))
