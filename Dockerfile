FROM php:8.1-fpm-alpine
RUN apk update && apk add zlib-dev libpng-dev libintl gettext-dev bzip2-dev libxslt-dev libpq-dev && docker-php-ext-install gd gettext bz2 mysqli pcntl sysvsem xsl sockets pdo_pgsql
RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
        && pecl install redis \
        && docker-php-ext-enable redis.so
COPY --from=composer /usr/bin/composer /usr/bin/composer
