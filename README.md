# for fun
Packages are work but unsupported Entware team.

не пользы дела для, токмо забавы ради ;)

Для сборки некоторых пакетов, требуется внести изменения в Makefile пакетов, от которых они зависят, напр.:
* для сборки nginx-unit требуется библиотека libphp (пакет php7);
* для сборки php7-pecl-smbclient требуется библиотека libsmbclient и dev-версия пакета (пакет samba36);
* rrdtool конфликтует с одноименным пакетом из oldpackages;
* etc.
