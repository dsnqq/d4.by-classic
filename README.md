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

## Файлы, которые не коммитятся (нужно подготовить)

Следующие файлы **не хранятся в репозитории** (перечислены в `.gitignore`). Для части файлов есть шаблоны `.example` — скопируйте и заполните:

| Нужный файл | Откуда взять | Назначение |
|---|---|---|
| `.env` | `.env.example` | Пароли и настройки Docker/MySQL |
| `config.php` | `config.php.example` | Конфиг витрины (URL, пути, БД) |
| `admin/config.php` | `admin/config.php.example` | Конфиг админки (URL, пути, БД) |
| `.htaccess` | `.htaccess.example` | Правила Apache (для сервера, не для Docker) |
| `.docker/mysql/dump.sql` | Дамп с сервера / бэкап | SQL-дамп для инициализации БД |
| `.docker/ioncube/ioncube_loader_lin_8.2.so` | [get-loader.ioncube.com](https://get-loader.ioncube.com) → Linux 64-bit | ionCube Loader для PHP 8.2 |

### Быстрые команды

```bash
cp .env.example .env
cp config.php.example config.php
cp admin/config.php.example admin/config.php
```

Дальше:
- В `config.php` и `admin/config.php` для локального Docker раскомментируйте **Вариант 1** (`localhost:8081`, `DB_HOSTNAME = 'db'`).
- Положите `dump.sql` в `.docker/mysql/dump.sql`. MySQL импортирует его при **первом** запуске (когда volume `db_data` пустой).
- Положите ionCube Loader в `.docker/ioncube/ioncube_loader_lin_8.2.so`.
- Если вы запускаете не Docker, а напрямую Apache/VPS, создайте `.htaccess` из `.htaccess.example`.

---

## Локальная разработка (Docker)

### Требования

- Docker Desktop (или Docker Engine + Compose plugin)
- **Apple Silicon (M1/M2/M3):** образы запускаются через Rosetta/эмуляцию (`platform: linux/amd64`) — это нормально

### Шаг 1 — Создать `.env`

Создайте `.env` из `.env.example` и задайте пароли. Значения `MYSQL_USER` / `MYSQL_PASSWORD` должны совпадать с `DB_USERNAME` / `DB_PASSWORD` в `config.php` (см. раздел `Файлы, которые не коммитятся`).

### Шаг 2 — Создать `config.php` и `admin/config.php`

Создайте файлы из `.example`, затем для локального Docker раскомментируйте **Вариант 1** в обоих файлах (`localhost:8081`, `DB_HOSTNAME = 'db'`) (см. раздел `Файлы, которые не коммитятся`).

### Шаг 3 — Положить дамп БД

Положите `dump.sql` в `.docker/mysql/dump.sql`. MySQL автоматически импортирует его при **первом** запуске (когда volume `db_data` пустой) (см. раздел `Файлы, которые не коммитятся`).

### Шаг 4 — Положить ionCube Loader

Скачайте ionCube Loader (Linux 64-bit) и положите его в `.docker/ioncube/ioncube_loader_lin_8.2.so` (см. раздел `Файлы, которые не коммитятся`).

### Шаг 5 — Запустить

```bash
docker compose up -d --build
```

Адреса и инструкция входа в админку — в разделе `Быстрый доступ (локальная разработка)`.

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
