# unsupported
не пользы дела для, токмо забавы ради ;) Packages not supported by the Entware team.

0. Читаем и выполняем [Compile packages from sources](https://github.com/Entware/Entware/wiki/Compile-packages-from-sources). 

1. Добавляем фид в конфиг:
```
echo 'src-git-full unsupported https://github.com/The-BB/unsupported.git' >> feeds.conf
```
2. Обновляем фид:
```
./scripts/feeds update unsupported
```
3. Подготавливаем к работе (создаём копии и патчим):
```
sh ./feeds/unsupported/backup-recover.sh backup
```
4. Добавляем пакеты из фида:
```
./scripts/feeds install -a -p unsupported
```
5. Собираем пакеты...

6. Перед обновлением фидов восстанавливаем:
```
sh ./feeds/unsupported/backup-recover.sh recovery
```
