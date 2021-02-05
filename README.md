# unsupported
Packages not supported by the Entware team.

не пользы дела для, токмо забавы ради ;)

Для сборки некоторых пакетов, требуется внести изменения в Makefile пакетов, от которых они зависят, напр.,
для php7-pecl-smbclient требуется dev-секция в пакете "samba4":
```
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/usr/include/samba-4.0
	$(CP) $(PKG_INSTALL_DIR)/opt/include/samba-4.0/*.h \
		$(1)/opt/usr/include/samba-4.0/

	$(INSTALL_DIR) $(1)/opt/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsmbclient.so* \
		$(1)/opt/usr/lib/
endef
```
