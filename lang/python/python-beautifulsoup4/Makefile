# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=beautifulsoup4
PKG_VERSION:=4.12.2
PKG_RELEASE:=1

PYPI_NAME:=beautifulsoup4
PKG_HASH:=492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING.txt LICENSE

PKG_BUILD_DEPENDS:=python-hatchling/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-beautifulsoup4
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Screen-scraping library
  URL:=http://www.crummy.com/software/BeautifulSoup/bs4/
  DEPENDS:= \
	+python3-logging \
	+python3-unittest
  DEPENDS+= \
	+python3-html5lib \
	+python3-lxml \
	+python3-soupsieve
endef

define Package/python3-beautifulsoup4/description
  Beautiful Soup is a library that makes it easy to scrape information from 
  web pages. It sits atop an HTML or XML parser, providing Pythonic idioms
  for iterating, searching, and modifying the parse tree.
endef

define Py3Package/python3-beautifulsoup4/filespec
+|$(PYTHON3_PKG_DIR)
-|$(PYTHON3_PKG_DIR)/bs4/tests
endef

$(eval $(call Py3Package,python3-beautifulsoup4))
$(eval $(call BuildPackage,python3-beautifulsoup4))
#$(eval $(call BuildPackage,python3-beautifulsoup4-src))
