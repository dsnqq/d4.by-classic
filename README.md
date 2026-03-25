# D4.by — интернет‑магазин на OpenCart 2.3

Кастомизированный интернет‑магазин на базе **OpenCart 2.3**, работающий на PHP 8.2.

---

## Быстрый доступ (локальная разработка)

После запуска `docker compose up -d --build` сайт доступен по адресам:

| Что | Адрес |
|---|---|
| 🛒 Витрина | http://localhost:8081/ |
| ⚙️ Админка | http://localhost:8081/admin/ |
| 🔒 Витрина HTTPS | https://localhost:8443/ |
| 🔒 Админка HTTPS | https://localhost:8443/admin/ |

> **Логин в админку** берётся из импортированного дампа БД.
> Основной администратор: логин `pavel`, пароль — из дампа базы данных.
> Если пароль неизвестен — сбросьте через MySQL:
> ```bash
> docker compose exec db mysql -u root -p dby_bd \
>   -e "UPDATE oc_user SET password=MD5('newpassword') WHERE username='pavel';"
> ```

---

## Структура проекта

```
.docker/                   # Docker-окружение для локальной разработки
  php/
    Dockerfile             # PHP 8.2-FPM образ
    ioncube-enable.sh      # Скрипт автоподключения ionCube Loader
  nginx/
    Dockerfile             # Nginx образ с self-signed SSL
    opencart.conf          # Конфиг виртуального хоста
  mysql/
    .gitkeep               # Папка для SQL-дампа (сам файл в .gitignore)
  ioncube/
    .gitkeep               # Папка для ionCube Loader binary (*.so в .gitignore)
admin/                     # Административная панель OpenCart
catalog/                   # Витрина магазина
system/                    # Ядро OpenCart, библиотеки
image/                     # Медиафайлы
docker-compose.yml         # Оркестрация Docker-контейнеров
.env.example               # Шаблон переменных окружения → скопировать в .env
config.php.example         # Шаблон конфига витрины → скопировать в config.php
admin/config.php.example   # Шаблон конфига админки → скопировать в admin/config.php
.htaccess.example          # Шаблон .htaccess для Apache → скопировать в .htaccess
```

---

## Файлы не в git — нужно создать вручную

Следующие файлы **не хранятся в репозитории** (перечислены в `.gitignore`). Для каждого есть готовый шаблон `.example` — скопируйте и заполните:

| Нужный файл | Откуда взять | Назначение |
|---|---|---|
| `.env` | `.env.example` | Пароли и настройки Docker/MySQL |
| `config.php` | `config.php.example` | Конфиг витрины (URL, пути, БД) |
| `admin/config.php` | `admin/config.php.example` | Конфиг админки (URL, пути, БД) |
| `.htaccess` | `.htaccess.example` | Правила Apache (только для сервера, не Docker) |
| `.docker/mysql/dump.sql` | Дамп с сервера / бэкап | SQL-дамп для инициализации БД |
| `.docker/ioncube/ioncube_loader_lin_8.2.so` | [get-loader.ioncube.com](https://get-loader.ioncube.com) → Linux 64-bit | ionCube Loader для PHP 8.2 |

---

## Локальная разработка (Docker)

### Требования

- Docker Desktop (или Docker Engine + Compose plugin)
- **Apple Silicon (M1/M2/M3):** образы запускаются через Rosetta/эмуляцию (`platform: linux/amd64`) — это нормально

### Шаг 1 — Создать `.env`

```bash
cp .env.example .env
```

Отредактируйте `.env` — задайте пароли. Значения `MYSQL_USER` / `MYSQL_PASSWORD` должны совпадать с `DB_USERNAME` / `DB_PASSWORD` в `config.php`.

### Шаг 2 — Создать `config.php` и `admin/config.php`

```bash
cp config.php.example config.php
cp admin/config.php.example admin/config.php
```

Для локального Docker раскомментируйте **Вариант 1** в обоих файлах (localhost:8081, `DB_HOSTNAME = 'db'`).

### Шаг 3 — Положить дамп БД

```
.docker/mysql/dump.sql
```

Файл не коммитится. MySQL автоматически импортирует его при **первом** запуске (когда volume `db_data` пустой).

### Шаг 4 — Положить ionCube Loader

Скачайте с [get-loader.ioncube.com](https://get-loader.ioncube.com) → **Linux (64 bits)**:

```
.docker/ioncube/ioncube_loader_lin_8.2.so
```

Файл не коммитится.

### Шаг 5 — Запустить

```bash
docker compose up -d --build
```

| Адрес | Назначение |
|---|---|
| http://localhost:8081/ | Витрина |
| http://localhost:8081/admin/ | Административная панель |
| https://localhost:8443/ | Витрина (HTTPS, self-signed сертификат) |
| https://localhost:8443/admin/ | Админка (HTTPS) |

### Полезные команды

```bash
# Логи в реальном времени
docker compose logs php -f
docker compose logs nginx -f

# Перезапуск PHP (подхватить изменения файлов / очистить OPcache)
docker compose restart php

# Сброс БД и повторный импорт дампа
docker compose down -v && docker compose up -d --build

# Открыть shell внутри контейнера PHP
docker compose exec php sh

# Проверить статус контейнеров
docker compose ps
```

---

## Деплой на сервер (Apache / cPanel)

1. Загрузите файлы проекта на сервер.
2. Создайте `config.php` и `admin/config.php` по шаблонам `.example` — заполните реальный домен, пути и данные БД (`DB_HOSTNAME = 'localhost'`).
3. Создайте `.htaccess` из `.htaccess.example` — замените `YOUR_DOMAIN.com` на реальный домен.
   > Если используете cPanel — оставьте блок `cPanel-generated` в конце файла. На чистом Apache/VPS удалите его.
4. Создайте БД MySQL и импортируйте дамп.
5. Убедитесь что PHP 8.2 выбран в панели управления хостингом.
6. Проверьте работу витрины и админки.

---

## Разработка

- Придерживайтесь стандартной MVC-структуры OpenCart: `controller` / `model` / `view`.
- `config.php`, `admin/config.php` и `.htaccess` в `.gitignore` — не коммитятся.
- Перед коммитом проверяйте работу как витрины, так и админки.
- Изменения в шаблоне: `catalog/view/theme/d4/`
- Изменения в модулях: `catalog/controller/extension/`, `catalog/model/extension/`
