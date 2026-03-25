FROM php:8.2-fpm-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libzip-dev unzip zip \
    libonig-dev \
    pkg-config \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Core extensions needed by OpenCart/plugins
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        mysqli \
        gd \
        intl \
        zip \
        opcache \
        mbstring \
        bcmath \
    && rm -rf /tmp/*

ARG PHP_MEMORY_LIMIT=512M
RUN { \
      echo "memory_limit=${PHP_MEMORY_LIMIT}"; \
      echo "upload_max_filesize=128M"; \
      echo "post_max_size=128M"; \
      echo "max_execution_time=120"; \
      echo "max_input_time=120"; \
      echo "date.timezone=UTC"; \
    } > /usr/local/etc/php/conf.d/99-opencart.ini

WORKDIR /home/dby/sites/d4.by

EXPOSE 9000

# Enable ionCube loader automatically when binary is mounted to /ioncube.
COPY ioncube-enable.sh /usr/local/bin/ioncube-enable.sh
RUN chmod +x /usr/local/bin/ioncube-enable.sh
ENTRYPOINT ["/usr/local/bin/ioncube-enable.sh"]

CMD ["php-fpm"]
