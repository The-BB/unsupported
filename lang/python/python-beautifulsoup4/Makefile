# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python-beautifulsoup4
PKG_VERSION:=4.9.1
PKG_RELEASE:=1

PYPI_NAME:=beautifulsoup4
PKG_HASH:=73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7

PKG_LICENSE:=MIT

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
	+python3-soupsieve
endef

define Package/python3-beautifulsoup4/description
  Beautiful Soup is a library that makes it easy to scrape information from 
web pages. It sits atop an HTML or XML parser, providing Pythonic idioms for 
iterating, searching, and modifying the parse tree.
endef

$(eval $(call Py3Package,python3-beautifulsoup4))
$(eval $(call BuildPackage,python3-beautifulsoup4))
#$(eval $(call BuildPackage,python3-beautifulsoup4-src))
