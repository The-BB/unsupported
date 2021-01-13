# for fun
Packages are work but unsupported Entware team.

не пользы дела для, токмо забавы ради ;)

Для сборки некоторых пакетов, требуется внести изменения в Makefile пакетов, от которых они зависят, напр.,
для php7-pecl-smbclient требуется dev-секция в пакете "samba4":
```
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/tmp/samba-$(PKG_VERSION)/include/samba-4.0
	$(CP) $(PKG_INSTALL_DIR)/opt/include/samba-4.0/*.h \
		$(1)/opt/tmp/samba-$(PKG_VERSION)/include/samba-4.0/

	$(INSTALL_DIR) $(1)/opt/tmp/samba-$(PKG_VERSION)/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsmbclient.so* \
		$(1)/opt/tmp/samba-$(PKG_VERSION)/lib/
endef
```
