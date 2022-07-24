# unsupported
Packages not supported by the Entware team.

1. Read [Compile packages from sources](https://github.com/Entware/Entware/wiki/Compile-packages-from-sources)

2. To use these packages, add the following line to the feeds.conf in the Entware buildroot, e.g.:

```
echo 'src-git-full unsupported https://github.com/The-BB/unsupported.git' >> feeds.conf
```

To install all its package definitions, run:

```
./scripts/feeds update unsupported

./scripts/feeds install -a -p unsupported
```

The unsupported packages should now appear in menuconfig.

---
не пользы дела для, токмо забавы ради ;)

3. Для сборки некоторых пакетов, требуется внести изменения в Makefile пакетов, от которых они зависят, напр.,
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
